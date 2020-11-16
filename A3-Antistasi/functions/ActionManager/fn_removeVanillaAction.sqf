/*
    Author: [Håkon]
    [Description]
        Removes the vanilla action from the client

    Arguments:
    0. <Object> Object the action is on
    1. <String> Name of the action

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_object, _name] remoteExecCall ["A3A_fnc_removeVanillaAction", 0];
*/
params ["_object", "_actionName"];
_actionID = -1;
{
    private _params = _object actionParams _x;
    if ((_params#0) isEqualTo _actionName) exitWith {_actionID = _x}; //check action name
}forEach actionIDs _object;
_object removeAction _actionID
