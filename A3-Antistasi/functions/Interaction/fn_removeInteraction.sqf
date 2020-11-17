/*
    Author: Håkon
    Last Edited: Håkon - 2020-10-23
    Function:
        find if the position is in the center of the screen, rotatet based on the IMTarget and the player

    Arguments:
        0. <object>
        1. <Array> actionID
            <Array> Path
                <String> names of Action/category to the action you want to remove
            <String> Action name

    Return:
        <Bool> if the action was removed

    Example:

    Execution: unscheduled

    Effect: Local

    Public: true
*/
params [
    ["_object", objNull]
    , ["_action", [[], ""]]
];
if (isNull _object) exitWith {};
_action params [
    ["_path", []]
    , ["_actionName", ""]
];

private _interactionMenu = _object getVariable ["RB_InteractionMenu", ["",{},{false},50,{nil},3,[{true}, {false}],"\a3\ui_f\data\map\markers\military\dot_ca.paa",[],[]]];
private _parent = [_interactionMenu, _path, true] call A3A_fnc_getCategory;

if (_parent isEqualTo -1) exitWith {false};
_actionID = (_parent#8) findIf {(_x#0) isEqualTo _actionName};
(_parent#8) deleteAt _actionID;
_object setVariable ["RB_InteractionMenu", _interactionMenu];

true
