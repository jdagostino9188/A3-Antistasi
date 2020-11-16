/*
    Author: [Håkon]
    [Description]
        local ace addAction with nuill obj protection and JIP cleanup

    Arguments:
    0. <Object> Object to add ace action to

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_object] call A3A_fnc_addAceAction;
*/
params ["_object"];
if (isNull _object) exitWith {remoteExecCall ["A3A_fnc_cleanActionJIP",2]};
_this call ace_interact_menu_fnc_addActionToObject;
