if (player != theBoss) exitWith {["Move HQ", "Only Player Commander is allowed to move HQ assets"] call A3A_fnc_customHint;};
private ["_thingX","_playerX","_sites","_markerX","_size","_positionX"];

_thingX = _this select 0;
_playerX = _this select 1;

if (!(isNull attachedTo _thingX)) exitWith {["Move HQ", "The asset you want to move is being moved by another player"] call A3A_fnc_customHint;};
if (vehicle _playerX != _playerX) exitWith {["Move HQ", "You cannot move HQ assets while in a vehicle"] call A3A_fnc_customHint;};

if ({!(isNull _x)} count (attachedObjects _playerX) != 0) exitWith {["Move HQ", "You have other things attached, you cannot move this"] call A3A_fnc_customHint;};
_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
_markerX = [_sites,_playerX] call BIS_fnc_nearestPosition;
_size = [_markerX] call A3A_fnc_sizeMarker;
_positionX = getMarkerPos _markerX;
if (_playerX distance2D _positionX > _size) exitWith {["Move HQ", "This asset needs to be closer to it relative zone center to be able to be moved"] call A3A_fnc_customHint;};

_thingX setVariable ["objectBeingMoved", true];

private _spacing = 2 max (1 - (boundingBoxReal _thingX select 0 select 1));
private _height = 0.1 - (boundingBoxReal _thingX select 0 select 2);
private _helper = createSimpleObject ["\A3\Structures_F\Items\Food\Can_V1_F.p3d", [0,0,0]]; //cant use vanilla actions on attached object
hideObjectGlobal _helper;
_helper attachTo [_playerX, [0, _spacing, _height]];
_thingX attachTo [_helper, [0,0,0]];

private _fnc_placeObject = {
	params [["_thingX", objNull], ["_playerX", objNull], ["_dropAction", ["Drop Here"]]];
	private _helper = attachedTo _thingX;

	if (isNull _thingX) exitWith {diag_log "[Antistasi] Error, trying to place invalid HQ object"};
	if (isNull _playerX) exitWith {diag_log "[Antistasi] Error, trying to place HQ object with invalid player"};

	if (!(_thingX getVariable ["objectBeingMoved", false])) exitWith {};

	if (_playerX == attachedTo _helper && _helper == attachedTo _thingX) then {
		_playerX setVelocity [0,0,0];
		_helper setVelocity [0,0,0];
		_thingX setVelocity [0,0,0];
		detach _helper;
		detach _thingX;
		deleteVehicle _helper;
	};

	//remove action
	[_thingX, false, _playerX, _dropAction] spawn A3A_fnc_actionManager;

	// Can't find a case where this is ever true, but we'll make sure
	// On a DS, object locality changes when detached, so we have to remoteexec
	if (local _thingX) then {
		if (isNull group _thingX) then { [_thingX, 2] remoteExec ["setOwner", 2] }
		else { [group _thingX, 2] remoteExec ["setGroupOwner", 2] };
	};

	// Some objects never lose (and even regain) their velocity when detached, becoming lethal
	[_thingX, [0,0,0]] remoteExec ["setVelocity", _thingX];

	// Without this, non-unit objects often hang in mid-air
	[_thingX, surfaceNormal position _thingX] remoteExec ["setVectorUp", _thingX];

	// Place on closest surface
	private _pos = getPosASL _thingX;
	private _intersects = lineIntersectsSurfaces [_pos, _pos vectorAdd [0,0,-100], _thingX];
	if (count _intersects > 0) then {
		_thingX setPosASL (_intersects select 0 select 0);
	};

	// _thingX setPosATL [getPosATL _thingX select 0,getPosATL _thingX select 1,0.1];

	_thingX setVariable ["objectBeingMoved", false];
};

//add drop action
[_thingX, true, _playerX, ["Drop Here", {
	params ["_object", "_caller", "_action", "_fnc_placeObject"];
	[_object, _caller, "Drop Here"] call _fnc_placeObject;
}, "_this isEqualTo theBoss", 6, _fnc_placeObject, 0]] spawn A3A_fnc_actionManager;



waitUntil {sleep 1; (_playerX != attachedTo _helper) or (vehicle _playerX != _playerX) or (_playerX distance2D _positionX > (_size-3)) or !([_playerX] call A3A_fnc_canFight) or (!isPlayer _playerX)};

[_thingX, _playerX, "Drop Here"] call _fnc_placeObject;

if (vehicle _playerX != _playerX) exitWith {["Move HQ", "You cannot move HQ assets while in a vehicle"] call A3A_fnc_customHint;};

if  (_playerX distance2D _positionX > _size) exitWith {["Move HQ", "This asset cannot be moved more far away for its zone center"] call A3A_fnc_customHint;};
