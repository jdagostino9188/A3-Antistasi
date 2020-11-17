private _filename = "A3A_fnc_addInteraction";
/*
    Author: Håkon
    Last Edited: Håkon - 2020-10-23
    Function:
        adds a interaction to an objects interaction tree
    Arguments:
        0. <Object> object to add interaction too
        1. <Array>	Path to new action
            <Strings> Category/action name
        2. <Array> Action paramaters

            <String> action name (displayed)

            <Code/String> code to excecute

            <Code/String/Bool> Condition to show/execute action

            <Any> Arguments to be passed to the excecuted code

            <Int> Priority in list, higher number higher priority

            <String> icon to display (arma native or full path)

            <Array> Repeatable
                <Code/String/Bool> Repeatable (false: action removed on use)
                <Code/String/Bool> Local single use (true: every client can use once, false: is removed for everyone on use) (only evaluated if repeatable is false)

            <Array> Child actions (advanced users only) action paramaters arrays

    Return:
        <Array>
            <Array> path
            <String> action name

    Example:

    Execution: unscheduled

    Effect: Local

    Public: true
*/

//adds an action to the specified category
params [
    ["_object", objNull]
    , ["_path", []]
    , "_actionParams"
];
if (isNull _object) exitWith {};
if (isNil "_actionParams") exitWith {};
if (isNil "InteractionSystemInit") then { [] spawn A3A_fnc_interactionInit};

//correct for optionals in action params
_actionParams params [
    ["_name", ""]
    , ["_code", {}]
    , ["_condition", {false}]
    , ["_distance", 50]
    , ["_arguments", {nil}]
    , ["_priority", 3]
    , ["_repeatable", [{true}, {false}]]
    , ["_icon", "\a3\ui_f\data\map\markers\military\dot_ca.paa"]
    , ["_childMenu", []]
];

//fix formating of data
_code = [_code] call A3A_fnc_correctCodeFormat;
_condition = [_condition] call A3A_fnc_correctCodeFormat;
_repeatable = [
    [_repeatable#0] call A3A_fnc_correctCodeFormat
    , [_repeatable#1] call A3A_fnc_correctCodeFormat
];

_actionParams = [_name, _code, _condition, _distance, _arguments, _priority, _repeatable, _icon, _childMenu, _path];

//get the copy of the data for easy setting and a reference to the copy of data down the data stucture
private _interactionMenu = _object getVariable ["RB_InteractionMenu", ["",{},{false},50,{nil},3,[{true},{false}],"\a3\ui_f\data\map\markers\military\dot_ca.paa",[],[]]];
private _parent = [_interactionMenu, _path] call A3A_fnc_getCategory;
private _children = (_parent#8);

//add the new action (actions are a category with a function asigned)
private _index = _children findIf {(_x#0) isEqualTo _name}; //action with same name

if (_index isEqualTo -1) then { //Create new action
    _children pushBack _actionParams;
} else { //modify existing action
    private _child = _children#_index;
    _child set [1, _code];
    _child set [2, _condition];
    _child set [3, _distance];
    _child set [4, _arguments];
    _child set [5, _priority];
    _child set [6, _repeatable];
    _child set [7, _icon];
};
_parent set [8, [_children, [], {_x#5}, "DESCEND"] call BIS_fnc_sortBy];

_object setVariable ["RB_InteractionMenu", _interactionMenu];

[_path, _name]
