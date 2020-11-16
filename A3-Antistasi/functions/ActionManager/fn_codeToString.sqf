/*
    Author: [Håkon]
    [Description]
        converts executable code to its string counterpart

    Arguments:
    0. <code> code to convert

    Return Value:
    <string> code converted to string

    Scope: Any
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [_code] call A3A_fnc_codeToString;
*/
params ["_code"];
_code = toArray str _code;
_code deleteAt 0;
_code deleteAt (count _code -1);
toString _code;
