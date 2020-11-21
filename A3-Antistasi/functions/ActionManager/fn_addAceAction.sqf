/*
    Author: [Håkon]
    [Description]
        local ace addAction with nuill obj protection and JIP cleanup

    Arguments:
    0. <Object> Object to add the action to
    1. <Int>    Ace menu type
    2. <Array>  Path to the action
    3. <Array>  Ace action array

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_object, 0, ["Antistasi"], _action] call A3A_fnc_addAceAction;
*/
params ["_object", "_type", "_path", "_action"];
if (isNull _object) exitWith {remoteExecCall ["A3A_fnc_cleanActionJIP",2]};
if ((ace_interact_menu_ActNamespace getVariable typeOf _object) findIf {(_x#0#0) isEqualTo "Antistasi"} isEqualTo -1) then {
        private _baseAction = ["Antistasi","Antistasi","\a3\ui_f\data\map\markers\military\dot_ca.paa",{},{true},{},[],{[_target] call A3A_fnc_getTypeOffset},50,[false,false,false,false,false],{}];
        [typeOf _object, 0, [], _baseAction, false] call ace_interact_menu_fnc_addActionToClass;
};

_this call ace_interact_menu_fnc_addActionToObject;
