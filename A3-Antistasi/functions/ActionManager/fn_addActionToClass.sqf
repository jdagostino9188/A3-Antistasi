/*
    Author: [Håkon]
    [Description]
        Adds the action to the class (optional: and classes inheriting from it) for future and current objects.

    Arguments:
    0. <String> classname to add action to
    1. <Array>  Action array
    2. <Array>  Path of action | <Bool> quick interaction
    3. <Bool>   Use inheritance (any object that inherits from this class will also get hte action)

    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Data structure:
        (inherited)Class Actions: [ClassName, Action Array]
        Action Array: [Action Data array]
        Action Data array: [Action, Arguments]

    Example: [_object, _action, _optionalArgument, _useInheritance] call A3A_fnc_addActionToClass;
*/
params [ "_class", "_action", ["_optionalArgument", false, [ [], false ]], "_useInheritance" ];
if (isNil "_class") exitWith {};
if !(isServer) exitWith { _this remoteExecCall ["A3A_fnc_addActionToClass", 2] };

//define the arrays
if (isNil "A3A_AM_ClassActions") then {A3A_AM_ClassActions = []};
if (isNil "A3A_AM_inheritedClassActions") then {A3A_AM_inheritedClassActions = []};

//decide which array to add action to
private _classActionArray = if (_useInheritance) then {A3A_AM_inheritedClassActions} else {A3A_AM_ClassActions};

//add action to the right array
private _index = _classActionArray findIf { (_x#0) isEqualTo _class };
if (_index isEqualTo -1) then {
    _classActionArray pushBack [ _class, [[_action, _optionalArgument]] ];
} else {
    private _actionArray = (_classActionArray#_index#1);
    if ([_action, _optionalArgument] in _actionArray) exitWith {};
    _actionArray pushBack [_action, _optionalArgument];
};

//get valid objects
_activeObjects = entities [[_class], [], true];

//add action to already active objects
{
    [_x, true, 0, _action, _optionalArgument] spawn A3A_fnc_actionManager;
} forEach _activeObjects;
