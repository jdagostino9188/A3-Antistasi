private _filename = "A3A_fnc_addInteraction";
/*
    Author: Håkon
    Last Edited: Håkon - 2020-10-23
    Function:
        add or removes an action to/from an object
    Arguments:
        0. <Object> Object to add/remove action to/from
           <String> Classname to add/remove class action to/from
        1. <Bool>   Add or remove action
        2. <Int>    Client number, same as remoteExec
        3. <Array>  Action array
        4. <Bool>   Quick interaction (optional - Default: false)
           <Array>  Path to action ( path defaults to | Interaction: [] | ACE: ["ACE_MainActions"] )
        5. <Bool>   Use inheritance (optional - default: false) only applies with class actions

        Action array = [                        //note some paramaters are only applied to Interaction menu
            <String>            Name            //Name of action (Displayed Text)
            <Code/String>       Code            //Code to execute on action use
            <Code/String/Bool>  Condition       //Conditions needed for action to be show/used
            <Int>               Distance        //Max distance before action is no longer shown
            <Any>               Arguments       //Arguments passed to the executed code
            <Int>               Priority        //Determins listing order, Higher number higher in the list     (Not ACE)
            <Array>
                <Bool>          Repeatable      //Can the action be used more then once                         (not supported with class actions)
                <Bool>          Local Removal   //Local single use if not repeatable
            <String>            Icon            //Icon displayed for the action                                 (Interaction Menu [Both])
            <Array>             Child Menu      //(Advanced users only) Action arrays of children               (Only for Interaction menu [None ace variant])
        ];

    Return:
        <Script Handler> Like any other spawned code

    Example: (Examples made for Interaction Menu, full functionality not guaranteed when not using it)

    ~~ Add action ~~
    [cursorTarget, true, 0, ["Test", {systemChat "This is an action"}, {true}]] spawn A3A_fnc_actionManager;

    ~~ remove action ~~
    [cursorTarget, false, 0, ["Test", {systemChat "This is an action"}, {true}]] spawn A3A_fnc_actionManager;

    ~~ Add quick interaction ~~
    [cursorTarget, true, 0, ["Test", {systemChat "This is a quick interaction"}, {true}], true] spawn A3A_fnc_actionManager;

    ~~ Add interaction with custom path (pre-existing action required) ~~
    [cursorTarget, true, 0, ["Test", {systemChat "This is a sub interaction"}, {true}], ["Test"]] spawn A3A_fnc_actionManager;

    ~~ add action to the client running this only ~~
    [cursorTarget, true, clientOwner, ["Test", {systemChat "This is only available to me"}, {true}]] spawn A3A_fnc_actionManager;

    ~~ Add self removing action (Global removal) ~~
    [cursorTarget, true, 0, ["Test", {systemChat "This is removed for everyone on use"}, {true}, 3, {nil}, 3, [{false},{false}]]] spawn A3A_fnc_actionManager;

    ~~ Add self removing action (Local removal) ~~
    [cursorTarget, true, 0, ["Test", {systemChat "This is removed for me only"}, {true}, 3, {nil}, 3, [{false},{true}]]] spawn A3A_fnc_actionManager;

    ~~ Add class based action ~~
    [typeOf cursorTarget, true, 0, ["Test", {systemChat "This is a class action"}, {true}, 3, {nil}, 3] ] spawn A3A_fnc_actionManager;

    ~~ add class based action with inheritance ~~
    [typeOf cursorTarget, true, 0, ["Test", {systemChat "This is a inherited class action"}, {true}, 3, {nil}, 3], false, true] spawn A3A_fnc_actionManager;

    Execution: server scheduled

    Effect: Global

    Public: true
*/
if (!isServer) exitWith {_this remoteExec ["A3A_fnc_actionManager",2]};
params [ ["_object", objNull], "_add", "_targets", "_action", ["_optionalArgument", false, [ [], false ]], ["_useInheritance", false] ];

//action data
_action params [
   "_name"
, ["_code", {}, [ "", {} ]]
, ["_condition", {true}, [ true, {}, "" ]]
, ["_distance", 50, [ 0 ]]
, ["_arguments", {nil}]
, ["_priority", 3, [ 0 ]]
, ["_repeatable", [{true}, {false}], [ [] ], 2]
, ["_icon", "\a3\ui_f\data\map\markers\military\dot_ca.paa", [""]]
, ["_childMenu", []]
];

//exit if bad action data
if (isNil "_name") exitWith {};

//path or quick interaction
private ["_path", "_isQuickInteraction"];
if (_optionalArgument isEqualType []) then {
    _path = _optionalArgument;
    _isQuickInteraction = false;
} else {_isQuickInteraction = _optionalArgument};

//if adding to class non ace
private _notAceAction = !(hasAce && InteractionEnabled isEqualTo 1) || _isQuickInteraction;
if ( (_object isEqualType "") && _notAceAction) exitWith {
    if (_add) then {
        [_object, _action, _optionalArgument, _useInheritance] call A3A_fnc_addActionToClass;
    } else {
        [_object, _action, _optionalArgument, _useInheritance] call A3A_fnc_removeActionFromClass;
    };
};

if ( (_object isEqualType "") && (hasAce && InteractionEnabled isEqualTo 1)) exitWith {
    private _JIPMessage = if (_targets isEqualTo 0) then { format ["%1_%2_%3", _object, _optionalArgument, _name] } else { false };
    if (isNil "_path") then {_path = ["ACE_MainActions"]};
    [_object] call ACE_interact_menu_fnc_compileMenu;

    //fix code format and unify condition var names
    if (_condition isEqualType {}) then {_condition = [_condition] call A3A_fnc_codeToString};
    if (_condition isEqualType true) then {_condition = str _condition};
    private _addonCondition = "params ['_originalTarget', '_player', '_params']; private _target = vehicle _originalTarget; private _this = _player;";
    _condition = compile (_addonCondition + _condition);

    if (_code isEqualType {}) then {_code = [_code] call A3A_fnc_codeToString};
    private _addonCode = "params ['_target', '_player', '_params']; _this = [_target, _player, " + str (_path + [_name]) + ", _params];";
    _code = compile (_addonCode + _code);

    if (_add) then {
        [_object, 0, _path, [_name, _name, _icon, _code, _condition, {}, _arguments, [0,0,0], _distance, [false,false,false,false,false], {}]] remoteExecCall ["ace_interact_menu_fnc_addActionToClass", _targets, _JIPMessage];
    } else {
        remoteExecCall ["", _targets, _JIPMessage]; //clear JIP
        [_object, 0, _path + [_name]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromClass", _targets];
    };
};

//bad object passed
if (isNull _object) exitWith {};

//Only add one action at the time to an object
if (isNil "ActionObjectManager") then {ActionObjectManager = []};
waitUntil {!(_object in ActionObjectManager)};
ActionObjectManager pushBack _object;

//Custom message to support multiple actions with JIP
private _objectString = toArray str _object; //need to remove ':' as it breaks JIP
_objectString deleteAt (_objectString find 58);
_objectString = toString _objectString;
private _JIPMessage = if (_targets isEqualTo 0) then { format ["%1_%2_%3", _objectString, _optionalArgument, _name] } else { false }; //cant use JIP if not to everyone

//////////////////////////////////////////////////////////////////
//  define the methodes to add/remove from the various systems  //
//////////////////////////////////////////////////////////////////

//Interaction Menu
private _quickInteraction = {
    _JIPMessage = if (_targets isEqualTo 0) then { format ["%1_QuickInteraction", _objectString] } else { false }; //unique format of JIP message
    if (_add) then {
        [_object, _name, _code, _condition, _distance, _arguments, _repeatable, _icon] remoteExecCall ["A3A_fnc_setInteraction", _targets, _JIPMessage];
    } else {
        remoteExecCall ["", _targets, _JIPMessage];
        [_object] remoteExecCall ["A3A_fnc_setInteraction", _targets];
    };
};

private _interaction = {
    if (isNil "_path") then {_path = []};
    if (_add) then {
        [_object, _path, _action] remoteExecCall ["A3A_fnc_addInteraction", _targets, _JIPMessage];
    } else {
        remoteExecCall ["", _targets, _JIPMessage];
        [_object, [_path, _name]] remoteExecCall ["A3A_fnc_removeInteraction", _targets];
    };
};

//Ace Interaction Menu
private _aceInteraction = {
    if (isNil "_path") then {_path = ["ACE_MainActions"]};
    [_object] call ACE_interact_menu_fnc_compileMenu; //make sure menu is compiled before doing something with the objects iteraction menu

    //fix for bad node root offset
    _offset = [_object] call A3A_fnc_getTypeOffset;
    if ((_offset isEqualTo [0,0,0]) && !(_object isKindOf "CAManBase")) then { //CAManBase get a offset but ace default is prefrerable
        if ((_path#0) isEqualTo "ACE_MainActions") then {_path set [0,"Interactions"]};
        if (isNil "ACE_Interaction_Menu_BadClassOffset") then {ACE_Interaction_Menu_BadClassOffset = []};
        if !(_object in ACE_Interaction_Menu_BadClassOffset) then {
            ACE_Interaction_Menu_BadClassOffset pushBack _object;
            private _action = ["Interactions", "Interactions", "\a3\ui_f\data\map\markers\military\dot_ca.paa", {}, {true}, nil, nil, _offset] call ace_interact_menu_fnc_createAction;
            [typeOf _object, 0, [], _action] remoteExecCall ["ace_interact_menu_fnc_addActionToClass", 0, format ["%1_BaseACENode", typeOf _object]];
        };
    };

    //fix condition formating
    if (_condition isEqualType {}) then {_condition = [_condition] call A3A_fnc_codeToString};
    if (_condition isEqualType true) then {_condition = str _condition};
    private _addonCondition = "params ['_originalTarget', '_player', '_params']; private _target = vehicle _originalTarget; private _this = _player;";
    _condition = compile (_addonCondition + _condition);

    //fix code formating
    if (_code isEqualType {}) then {_code = [_code] call A3A_fnc_codeToString};
    private _addonCode = "params ['_target', '_player', '_params']; _this = [_target, _player, " + str (_path + [_name]) + ", _params];";

        //single use functionality
    private _removalCode = "";
    if !(call (_repeatable#0)) then {
        if (call (_repeatable#1)) then {//global removal
            _removalCode = "; [_this#0, 0, _this#2] remoteExecCall ['ace_interact_menu_fnc_removeActionFromObject', 0]; [_this#0, _this#2] remoteExecCall ['A3A_fnc_removeJIP', 2];";
        } else {//local removal
            _removalCode = "; [_this#0, 0, _this#2] call ace_interact_menu_fnc_removeActionFromObject;";
        };
    };
    _code = compile (_addonCode + _code + _removalCode);

    if (_add) then {
            [_object, 0, _path, [_name, _name, _icon, _code, _condition, {}, _arguments, [0,0,0], _distance, [false,false,false,false,false], {}]] remoteExecCall ["A3A_fnc_addAceAction", _targets, _JIPMessage];
        } else {
            remoteExecCall ["", _targets, _JIPMessage]; //clear JIP
            [_object, 0, _path + [_name]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", _targets];
    };
};

//Vanilla action
private _vanillaAction = {
    if (_add) then {
        //vanilla actions dosnt support code or bool type conditions
        if (_condition isEqualType {}) then {_condition = [_condition] call A3A_fnc_codeToString};
        if (_condition isEqualType true) then {_condition = str _condition};

        //correct actionID to actionManager format
        private _addonCode = "params ['_target', '_player', '_id', '_params']; _this = [_target, _player, [(_target actionParams _id)#0], _params];";

        //single use functionality
        private _removalCode = "";
        if !(call (_repeatable#0)) then {
            if (call (_repeatable#1)) then {//global removal
                _removalCode = "; [_this#0, (_this#2)#0] remoteExecCall ['A3A_fnc_removeVanillaAction', 0]; [_this#0, (_this#2)] remoteExecCall ['A3A_fnc_removeJIP', 2];";
            } else {//local removal
                _removalCode = "; (_this#0) removeAction (_this#2);";
            };
        };
        // add removal code to end of action code
        if (_code isEqualType {}) then {_code = [_code] call A3A_fnc_codeToString};
        _code = compile (_addonCode + _code + _removalCode);

        [_object, [_name, _code, _arguments, _priority, true, true, "", _condition, _distance, false, "", ""]] remoteExecCall ["A3A_fnc_addVanillaAction", _targets, _JIPMessage]; //uniqe string for multiple actions with JIP
    } else {
        remoteExecCall ["", _targets, _JIPMessage];
        [_object, _name] remoteExecCall ["A3A_fnc_removeVanillaAction", _targets];
    };
};

/////////////////////////////////
//  decide what system to use  //
/////////////////////////////////

switch (true) do {
    case ( _isQuickInteraction ): { call _quickInteraction };

    case (hasAce && InteractionEnabled isEqualTo 1): { call _aceInteraction };

    case (InteractionEnabled isEqualTo 1): {call _interaction };

    default { call _vanillaAction };
};

//keep track of JIP manualy as we are using custom ones not tied directly to objects or groups (wont auto clean themselfs)
if (isNil "actionJIPRec") then {actionJIPRec = []};
if (_add) then {
    actionJIPRec pushBack [_object, _JIPMessage];
} else {
    actionJIPRec deleteAt (actionJIPRec find [_object, _JIPMessage]);
};
//give time for new info to propigate (avoid overwriting something)
sleep 0.1;
ActionObjectManager deleteAt (ActionObjectManager find _object);
