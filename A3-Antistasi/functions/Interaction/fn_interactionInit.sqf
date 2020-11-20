private _filename = "A3A_fnc_interactionInit";
/*
    Author: Håkon
    Last Edited: Håkon - 2020-10-23
    Function:
        Initialize the rendere and key EH for the interaction system (Run on every spawn/respawn)

        Key binds:
            L Win:  (Hold)      Open interaction menu   (Bindable User action 13)
            F:      (Release)   Use action              (Bindable User action 14)

        Required Variables
        | Variable name         | Type      | Description

        | InteractionEnabled    | Int       | Flag 1: use interaction menu and quick interaction 0: only use quick interaction
        | hasAce                | Bool      | Flag if ace is used

        Global Variables
        | Variable name         | Type      | Description

        | IMTarget              | Object    | The object the current menu tree is belongs too
        | QITarget              | Object    | Last cycle cursorTarget
        | PlayerPos             | Position  | Last cycle player ASL visual position
        | IMTargetPos           | Position  | Last cycle target ASL visual position
        | IMSelectedRotation    | Int       | Rotation degree of selector icon
        | IMRenderData          | Array     | Nodes to render in current cycle
        | ActiveNodeData        | Array     | Node data of active node
        | IMNodeSelected        | Bool      | Flag if player is looking at a node
        | InteractionActionCD   | Time      | Last time a action was executed
        | QIPressed             | Bool      | Flag if quick interaction key was pressed
        | QIDefaultKey          | Bool      | Flag if QI default key was released
        | IMDefaultKey          | Bool      | Flag if IM default key is pressed
        | IMKeyName             | String    | Formated keybind hint of IM key
        | IMKeyBound            | Bool      | Flag if IMKey bound to custom key (User13)
        | QIKeyName             | String    | Formated keybind hint of QI key
        | QIKeyBound            | Bool      | Flag if QIKey bound to custom key (User14)
        | IMTypeOffset          | Position  | Model relative offset of the target, used to correct for model centers that dont match visuals
        | InteractionSystemInit | Bool      | Flag if init has been run, used to block stacking respawn persistent EH

    Arguments:

    Return:
        <Nil>

    Example:

    Execution: unscheduled

    Effect: Local

    Public: true
*/
#include "\a3\ui_f\hpp\definedikcodes.inc";

//Key EH
if (isNil "InteractionKeyEH") then {//percistant trough respawn
    waituntil {!isNull (findDisplay 46)};

    ////////////////////
    // Global Defines //
    ////////////////////

    //Interaction Targets
    IMTarget = objNull;
    QITarget = objNull;

    //position data
    PlayerPos = getPosASLVisual player;
    IMTargetPos = getPosASLVisual IMTarget;
    IMTargetStance = stance objNull;

    //IM data
    IMSelectedRotation = 0;
    IMRenderData = [];
    IMNodeSelected = false;

    //cooldown
    InteractionActionCD = time;

    //input variables
    QIPressed = false;
    QIDefaultKey = false;
    IMDefaultKey = false;

    call A3A_fnc_refreshKeybindHint;

    ////////////////////
    // Event Handlers //
    ////////////////////

    //Key release
    findDisplay 46 displayAddEventHandler ["KeyUp", {
        params ["", "_key"];

        //interaction key
        if (_key isEqualTo DIK_F) then { //"F"
            if (dialog) exitWith {};
            QIDefaultKey = true;
        };

        if (_key isEqualTo DIK_LWIN) then { //"Left Windows Key"
            IMDefaultKey = false;
        };
    }];

    //keybind hint refresh
    [missionNamespace, "OnGameInterrupt", {
        A3A_EH_MouseMoving = findDisplay 46 displayAddEventHandler ["MouseMoving", {
            call A3A_fnc_refreshKeybindHint;
            findDisplay 46 displayRemoveEventHandler ["MouseMoving", A3A_EH_MouseMoving]; //no _thisEventHandler for displayEventHandlers
        }];
    }] call BIS_fnc_addScriptedEventHandler;

    // when we use ace interaction menu or vanilla actions we dont need the menu key eh
    if ((InteractionEnabled isEqualTo 1 && hasAce) || InteractionEnabled isEqualTo 0) exitWith {};

    //Key pressed
    findDisplay 46 displayAddEventHandler ["KeyDown", {
        params ["", "_key"];

        //Menu open key
        if (_key isEqualTo DIK_LWIN) then {//"Left Windows Key"
            if (dialog) exitWith {};
            IMDefaultKey = true;
        };
    }];

};

//Interaction Renderer
InteractionMenuRenderer = addMissionEventHandler ["Draw3D", {
    if (dialog) exitWith {IMNodeSelected = false};
    if !(ace_interact_menu_openedMenuType < 0) exitWith {IMNodeSelected = false}; //dont render when ace interaction menu is open, no overlaping icons etc.

    //overide for use with conditions to match vanilla actions
    private _this = player;

    //Menu key pressed
    if ( inputAction "User13" isEqualTo 1 || (!IMKeyBound && IMDefaultKey) ) then {
        if ((InteractionEnabled isEqualTo 1 && hasAce) || InteractionEnabled isEqualTo 0) exitWith {};
        if !(isNull IMTarget) exitWith {};
        IMTarget = getCursorObjectParams#0;
/*** DISABLED TO SEE IF getCursorObjectParams DOSNT HAVE THIS ISSUE ***/
/*        if (isNull IMTarget) then { //work-around for attached objects not registering as cursorTarget when looking at them
            private _objects = attachedObjects player;
            private _index = _objects findIf {!isNil {_x getVariable "A3A_InteractionMenu"}};
            if !(_index isEqualTo -1) then {IMTarget = _objects#_index};
        };*/
        if ( isNil {IMTarget getVariable "A3A_InteractionMenu"} ) then { IMTarget = objNull };//dont hold target with no interaction
        if (isNull IMTarget) exitWith {};
        IMTypeOffset = [IMTarget] call A3A_fnc_getTypeOffset;
    };

    if (isNull IMTarget) then {
        //////////////////////////////////////////
        //      quick interaction render        //
        //////////////////////////////////////////

        private _originalTarget = getCursorObjectParams#0;
        private _target = vehicle _originalTarget;

        private _interactionMenu = _target getVariable "A3A_InteractionMenu";
        if (isNil "_interactionMenu") exitWith {};
        _interactionMenu params ["_text", "_action", "_condition", "_distance", "", "", "", "_icon", "_children"];

        private _hasChildren = ({ call (_x#2) && _target distance _this < (_x#3)} count _children) > 0; //child with valid condition and within distance
        if !( ( call _condition && _target distance _this < _distance ) || _hasChildren) exitWith {};

        //Display formating
        private ["_iconToDraw", "_color", "_displayText", "_keyBindName"];
        if (call _condition && _target distance _this < _distance) then {
            _keyBindName = QIKeyName;
            _iconToDraw = _icon;
            _color = [1,1,1,1];
            _displayText = _text;
        } else {
            _keyBindName = "";
            _iconToDraw = "\a3\ui_f\data\map\markers\military\dot_ca.paa";
            _color = [1,1,1,1];
            _displayText = "";
        };

        //set node offset
        if (!(_target isEqualTo QITarget) || !(PlayerPos isEqualTo getPosASLVisual player) || !(IMTargetPos isEqualTo getPosASLVisual QITarget) || !(IMTargetStance isEqualTo stance QITarget)) then {
            QITarget = _target;
            PlayerPos = getPosASLVisual player;
            IMTargetPos = getPosASLVisual QITarget;
            IMTargetStance = stance QITarget;
            IMTypeOffset = [_target] call A3A_fnc_getTypeOffset;
        };

        //render node
        drawIcon3D [_iconToDraw, _color, _target modelToWorldVisual IMTypeOffset, 0.6, 0.6, 0, _displayText, true, 0.03, "TahomaB", "center"];

        //render keybind hints
        private _distToObj = _target distance _this;
        drawIcon3D ["", [1,1,1,1], _target modelToWorldVisual (IMTypeOffset vectorAdd [0,0,-0.035*_distToObj]), 0, 0, 0, _keyBindName, true, 0.05, "TahomaB", "center"]; //KeyBind Hint
        if (_hasChildren) then { drawIcon3D ["", [1,1,1,1], positionCameraToWorld [0, -1, 2] , 0, 0, 0, IMKeyName, true, 0.03, "TahomaB", "center"] }; //menu keybind hint

        //execute action if key is pressed
        if ( (QIPressed && inputAction "User14" isEqualTo 0) || (!QIKeyBound && QIDefaultKey) ) then {
            [_originalTarget, _interactionMenu] call A3A_fnc_executeAction;
            QIPressed = false;
        };
        if (inputAction "User14" isEqualTo 1) then {QIPressed = true};

    } else {
        //////////////////////////////////////
        //      interaction menu render     //
        //////////////////////////////////////

        if ((InteractionEnabled isEqualTo 1 && hasAce) || InteractionEnabled isEqualTo 0) exitWith {}; //dont render menu when using ace or vanilla actions

        //overide for conditions
        private _originalTarget = IMTarget;
        private _target = vehicle _originalTarget;

        //get target interaction data
        private _interactionMenu = IMTarget getVariable ["A3A_InteractionMenu", ["",{},{false},50,{nil},3,[{true},{false}],"\a3\ui_f\data\map\markers\military\dot_ca.paa",[],[]]];
        _interactionMenu params ["_text", "_action", "_condition", "_distance", "_arguments", "_priority", "_repeatable", "_icon", "_children", "_path"];

        //condition or valid children to render
        private _hasChildren = ({ call (_x#2) && IMTarget distance _this < (_x#3)} count _children) > 0;
        if !( (call _condition && IMTarget distance _this < _distance) || _hasChildren ) exitWith {IMNodeSelected = false};

        // draw cursor icon
        drawIcon3D ["\a3\ui_f\data\map\markers\military\dot_ca.paa", [1,1,1,1], positionCameraToWorld [0, 0, 2], 0.6, 0.6, 0, "", true, 0.03, "TahomaB", "center"];

        //render root of the menu
        private ["_pos"];
        if (isNil "ActiveNodeData") then {
            private ["_color", "_displayText"];
            if (call _condition && IMTarget distance _this < _distance) then {
                _color = [1,1,1,1];
                _displayText = _text;
            } else {
                _color = [0.7,0.7,0.7,1];
                _displayText = "";
            };
            _pos = IMTarget modelToWorldVisual IMTypeOffset;
            drawIcon3D [_icon, _color, _pos, 0.6, 0.6, 0, _displayText, true, 0.03, "TahomaB", "center"];
        };

        //Entry point
        if (IMRenderData isEqualTo []) then {
            if ([_pos] call A3A_fnc_isPosCenterScreen) then {
                IMRenderData = [[_pos, 0, _interactionMenu]];
            };
        };

        //refresh render data
        if (!isNil "ActiveNodeData" && ( !(getPosASLVisual player isEqualTo PlayerPos) || !(getPosASLVisual IMTarget isEqualTo IMTargetPos) || (IMTargetStance isEqualTo stance IMTarget) ) ) then {
            PlayerPos = getPosASLVisual player;
            IMTargetPos = getPosASLVisual IMTarget;
            IMTargetStance = stance IMTarget;
            ActiveNodeData call A3A_fnc_setActiveNode;
        };

        //set active node
        private _index = IMRenderData findIf {[_x#0] call A3A_fnc_isPosCenterScreen}; //element format: [NodeWorldPos, entryAngle, NodeActionData]
        if (_index != -1) then {
            private _ActiveNodeData = IMRenderData#_index;
            if (ActiveNodeData isEqualTo _ActiveNodeData) exitWith {IMNodeSelected = true};
            _ActiveNodeData call A3A_fnc_setActiveNode;
            IMNodeSelected = true;
        } else {IMNodeSelected = false};

        //render menu
        call A3A_fnc_renderInteractionMenu;
    };

    //reset interaction key flags
    QIDefaultKey = false;

    if (isNull IMTarget) exitWith {};
    ActiveNodeData params ["_pos", "_entryAngle", "_actionData"];
    if ( ( inputAction "User13" isEqualTo 0 && IMKeyBound ) || (!IMKeyBound && !IMDefaultKey) ) then { //only if key released
        //execute action if menu key is released and a node was selected
        if (IMNodeSelected && !isNil{_actionData}) then { [IMTarget, _actionData] call A3A_fnc_executeAction; };
        ActiveNodeData = nil;
        IMRenderData = [];
        IMTarget = objnull;
    };
}];

InteractionSystemInit = true;
[2, format ["Interaction system initialized for player: %1", name player], _filename] remoteExecCall ["A3A_fnc_log", 2];
