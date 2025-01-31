/*
    Author: [Håkon]
    Description:
        adds an array of classnames to the garage with the lock specified

    Arguments:
    0. <Array> classnames of vehicles
    1. <String> Lock uid, valid values {"", getPlayerUID player}

    Return Value:
    <Bool> Successfull

    Scope: Server
    Environment: unscheduled
    Public: Yes
    Dependencies: HR_GRG_Vehicles

    Example: [_classes, ""] call HR_GRG_fnc_addVehiclesByClass;

    License: APL-ND
*/
params [["_vehicles", [], [[]]], ["_lockUID", "", [""]]];
#include "defines.inc"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {false};
if (isNil "HR_GRG_Vehicles") then { [] call HR_GRG_fnc_initServer };

private _cfg = configFile >> "CfgVehicles";
{
    if (!isClass (_cfg >> _x)) then {Info_1("Invalid class: %1", str _x); continue};
    private _cat = [_x] call HR_GRG_fnc_getCatIndex;
    if (_cat < 0) then {Info_1("Unsoported category: %1", str _x); continue};
    private _vehUID = [] call HR_GRG_fnc_genVehUID;
    (HR_GRG_Vehicles#_cat) set [_vehUID, [cfgDispName(_x), _x, _lockUID, "", [[1,-1,nil],[0,[[],[]],-1],[]], "", [false, false]]];
    Info_2("Vehicle added to garage: %1 | Lock UID: %2", str _x, str _lockUID);
} forEach _vehicles;
true
