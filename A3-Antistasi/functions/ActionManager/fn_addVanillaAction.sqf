/*
    Author: [Håkon]
    [Description]
        adds the action as a vanilla action for the client

    Arguments:
    0. <Object> Object to add the action to
    1. <Array>  Vanilla action array

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_object, _action] remoteExecCall ["A3A_fnc_addVanillaAction", 0];
*/
params ["_object", "_paramaters"];
if (isNull _object) exitWith {remoteExecCall ["A3A_fnc_cleanActionJIP",2]};
_object addAction _paramaters;
