params ["_vehicle"];

private _type = typeOf _vehicle;

if (_type in vehAPCs || _type in vehTanks || _type in vehAA) exitWith {
	[_vehicle, "breach"] remoteExec ["A3A_fnc_commonActions", 2]; //this can be called from client
};
