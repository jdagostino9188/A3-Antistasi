private _filename = "A3A_fnc_correctCodeFormat";
/*
    Author: Håkon
    Last Edited: Håkon - 2020-10-23
    Function:
        correct format of input to be executable code

    Arguments:
        0. <Bool/String/Code> To correct format

    Return:
        <Code> compiled code ready for execution

    Example:

    Execution: unscheduled

    Effect: Local

    Public: false
*/
params ["_code"];
if !(_code isEqualTypeAny [true, "", {}]) exitWith { [1, format ["Invalid input type: %1 | Ecspected: Bool/String/Code", _code], _filename] call A3A_fnc_log; {false} };
if (_code isEqualType {}) exitWith {_code};
compile format ["%1", _code];
