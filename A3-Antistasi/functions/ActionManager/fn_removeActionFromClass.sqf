/*
    Author: [Håkon]
    [Description]
        Removes the action from the class (optional: and classes inheriting from it) for future and current objects.

    Arguments:
    0. <String> classname ta add action to
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

    Example: [_object, _action, _optionalArgument, _useInheritance] call A3A_fnc_removeActionFromClass;
*/
params [ ["_class", "N/A"], "_action", ["_optionalArgument", false, [ [], false ]] ];
if !(isServer) exitWith { _this remoteExecCall ["A3A_fnc_removeActionFromClass", 2] };

//find the class actions and remove the action from the list
if (isNil "A3A_AM_ClassActions") exitWith {false};
if (isNil "A3A_AM_inheritedClassActions") exitWith {false};

//decide which array to add action to
private _classActionArray = if (_useInheritance) then {A3A_AM_inheritedClassActions} else {A3A_AM_ClassActions};

private _index = _classActionArray findIf { (_x#0) isEqualTo _class };
if (_index isEqualTo -1) exitWith {false};
private _actionArray = (_classActionArray#_index#1);
_actionArray deleteAt (_actionArray find [_action, _optionalArgument]);

//get valid objects
_activeObjects = entities [[_class], [], true];

//remove action from already active objects
{
    [_x, false, 0, _action, _optionalArgument] spawn A3A_fnc_actionManager;
} forEach _activeObjects;
