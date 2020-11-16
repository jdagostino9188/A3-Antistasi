/*
    Author: [Håkon]
    [Description]
        Initialize the object with its class actions, and inherited class actions

    Arguments:
    0. <Object> Object to initialize

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [_object] call A3A_fnc_initClassActions;
*/
params [["_object", objNull]];
if (isNull _object) exitWith {};
if !(isServer) exitWith { _this remoteExecCall ["A3A_fnc_initClassActions", 2] };

//find inherited class actions and add to object
if !(isNil "A3A_AM_inheritedClassActions") then {
    private _inheritedClassArrays = A3A_AM_inheritedClassActions select { _object isKindOf (_x#0) };
    {
        {
            _x params ["_action", "_optionalArguments"];
            [_object, true, 0, _action, _optionalArguments] spawn A3A_fnc_actionManager;
        } forEach (_x#1);
    } forEach _inheritedClassArrays;
};

//find class actions
if (isNil "A3A_AM_ClassActions") exitWith {};//no class actions exists yet
private _index = A3A_AM_ClassActions findIf { (_x#0) isEqualTo typeOf _object};
if (_index isEqualTo -1) exitWith {};

//add actions to object
private _actionArray = A3A_AM_ClassActions#_index#1;
{
    _x params ["_action", "_optionalArguments"];
    [_object, true, 0, _action, _optionalArguments] spawn A3A_fnc_actionManager;
} forEach _actionArray;
