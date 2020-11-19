params [["_location", []]];

private _oldPetros = if (isNil "petros") then {objNull} else {petros};
private _groupPetros = if (!isNull _oldPetros && {side group _oldPetros == teamPlayer}) then {group _oldPetros} else {createGroup teamPlayer};

// Hack-fix for bugged case where petros is killed by enemy while being moved
if (count _location > 0 && count units _groupPetros > 1) then { _groupPetros = createGroup teamPlayer };

private _position = if (count _location > 0) then {
	_location
} else {
	if (getPos _oldPetros isEqualTo [0,0,0]) then {
		getMarkerPos respawnTeamPlayer
	} else {
		getPos _oldPetros
	};
};

petros = [_groupPetros, typePetros, _position, [], 10, "NONE"] call A3A_fnc_createUnit;
publicVariable "petros";

deleteVehicle _oldPetros;		// Petros should now be leader unless there's a player in the group

private _name = if (worldName == "Tanoa") then {"Maru"} else {"Petros"};
[petros, "friendlyX"] remoteExec ["setIdentity", 0];
[petros, _name] remoteExec ["setName", 0];

//all petros actions
[petros, true, 0, ["Mission Request", {CreateDialog "mission_menu";}, "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and ([_this] call A3A_fnc_isMember) and (petros == leader group petros)", 6, {nil}, 0], true] spawn A3A_fnc_actionManager;
[petros, true, 0, ["HQ Management", {[] spawn A3A_fnc_dialogHQ}, "(_this == theBoss) and (petros == leader group petros)", 6, {nil}, 0]] spawn A3A_fnc_actionManager;
[petros, true, 0, ["Move this asset", {_this spawn A3A_fnc_moveHQObject}, "(isNull attachedTo _target) and (_this == theBoss) and (petros == leader group petros)", 6, {nil}, 0]] spawn A3A_fnc_actionManager;
[petros, true, 0, ["Build HQ here", {[] spawn A3A_fnc_BuildHQ}, "(_this == _this getVariable ['owner',objNull]) and (_this == theBoss) and (petros != leader group petros)", 6, {nil}, 0]] spawn A3A_fnc_actionManager;


if (petros == leader _groupPetros) then {
	_groupPetros setGroupIdGlobal ["Petros","GroupColor4"];
	petros disableAI "MOVE";
	petros disableAI "AUTOTARGET";
	petros setBehaviour "SAFE";
};

call A3A_fnc_initPetros;
