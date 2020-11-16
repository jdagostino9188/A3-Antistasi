params ["_vehicle"];

private _type = typeOf _vehicle;

if (_type in vehAPCs || _type in vehTanks || _type in vehAA) exitWith {
	[_vehicle, true, 0, ["Breach Vehicle", A3A_fnc_startBreachVehicle, "(isPlayer _this) && (_this == vehicle _this)", 5, {nil}, 4]] spawn A3A_fnc_actionManager;
};
