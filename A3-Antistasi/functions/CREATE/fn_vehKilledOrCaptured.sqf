/*
	Updates enemy vehicle reserve pool, city support and aggro for vehicle destruction or capture

	Params:
	1. Object: Vehicle object
	2. Side: Side of unit that captured or destroyed the vehicle
	2. Bool (default false): True if captured, else destroyed
*/

params ["_veh", "_sideEnemy", ["_captured", false]];

private _type = typeof _veh;
private _side = _veh getVariable ["ownerSide", teamPlayer];

if (_side == Occupants or _side == Invaders) then
{
	_type call A3A_fnc_removeVehFromPool;
	if (_sideEnemy != teamPlayer) exitWith {};

	private _value = {
		if (_type in vehAPCs) exitWith {8};
		if (_type in vehTanks) exitWith {15};
		if (_type in vehAA or _type in vehMRLS) exitWith {15};
		if (_type in vehAttackHelis) exitWith {15};
		if (_type in vehTransportAir) exitWith {6};
		if (_type in vehFixedWing) exitWith {15};		// transportAir must be above this
		if (_type in vehBoats) exitWith {3};
		if (_type isKindOf "StaticWeapon") exitWith {1};
		2;		// trucks, light attack, boats, UAV etc
	};
	
	if (_side == Occupants) then {
		[-_value/3, _value/3, position _veh] remoteExec ["A3A_fnc_citySupportChange", 2];
		[[_value, 15], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
	}
	else {
		[[0, 0], [_value, 15]] remoteExec ["A3A_fnc_prestige",2];
	};
};

// maybe have an adjustment for stealing civ vehicles here?
// it's somewhere else at the moment
