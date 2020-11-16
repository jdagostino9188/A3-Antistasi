/*
    Author: [Håkon]
    [Description]
        removes JIP messages of null objects

    Arguments:

    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example: remoteExecCall ["A3A_fnc_cleanActionJIP",2]
*/
private _newActionJIPRec = +actionJIPRec; //make copy as you dont want to modify array your iterating trough
{
    _x params ["_object", "_JIPMessage"];
    if (isNull _object) then {
        actionJIPRec deleteAt (actionJIPRec find _x)
        remoteExecCall ["", 0, _JIPMessage];
    }; //delete element in original array and clear JIP
} forEach _newActionJIPRec;
