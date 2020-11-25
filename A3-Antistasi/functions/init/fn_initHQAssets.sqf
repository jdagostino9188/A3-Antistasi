//server only, adds all actions with JIP to hq assets
#include "..\Garage\defineGarage.inc"
//Arsenal
[BoxX, true, 0, [localize "STR_A3_Arsenal", JN_fnc_arsenal_handleAction, {alive _target}, 5], true] spawn A3A_fnc_actionManager;

[boxX, true, 0, ["Transfer cargo to Ammobox", {[] spawn A3A_fnc_empty;}, {true}, 50, {nil}, 3]] spawn A3A_fnc_actionManager;

[boxX, true, 0, ["Move this asset", {_this spawn A3A_fnc_moveHQObject}, "isNull attachedTo _target && _this isEqualTo theBoss", 6, {nil}, 0]] spawn A3A_fnc_actionManager; //ToDo: fix moveHQObject (in Dialogs)

//flag
[flagX, true, 0, ["Unit Recruitment",
	{if ([player,300] call A3A_fnc_enemyNearCheck) then {["Recruit Unit", "You cannot recruit units while there are enemies near you"] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; }}
	, "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"
, 50, {nil}, 1], true] spawn A3A_fnc_actionManager;

[flagX, true, 0, ["Move this asset", {_this spawn A3A_fnc_moveHQObject}, "isNull attachedTo _target && _this isEqualTo theBoss", 6, {nil}, 0]] spawn A3A_fnc_actionManager;

//Vehicle box
[vehicleBox, true, 0, [
	"Heal, Repair and Rearm"
	, {call A3A_fnc_healAndRepair;}
	, "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"
	, 4
], true] spawn A3A_fnc_actionManager;

[vehicleBox, true, 0, ["Vehicle Arsenal", JN_fnc_arsenal_handleAction, "alive _target && vehicle _this != _this", 10, {nil}, 6]] spawn A3A_fnc_actionManager;

if (isMultiplayer) then {
	[vehicleBox, true, 0, [
		"Personal Garage"
		, {[GARAGE_PERSONAL] spawn A3A_fnc_garage;}
		, "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"
		, 4, {nil}, 4
	]] spawn A3A_fnc_actionManager;
};

[vehicleBox, true, 0, ["Move this asset", {_this spawn A3A_fnc_moveHQObject}, "isNull attachedTo _target && _this isEqualTo theBoss", 6, {nil}, 0]] spawn A3A_fnc_actionManager;

[vehicleBox, true, 0, ["Faction Garage", {[GARAGE_FACTION] spawn A3A_fnc_garage;}, "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4, {nil}, 5]] spawn A3A_fnc_actionManager;

[vehicleBox, true, 0, [
	"Buy Vehicle"
	, {if ([player,300] call A3A_fnc_enemyNearCheck) then {["Purchase Vehicle", "You cannot buy vehicles while there are enemies near you"] call A3A_fnc_customHint;} else {nul = createDialog "vehicle_option"}}
	, "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"
	, 4, {nil}, 6
]] spawn A3A_fnc_actionManager;

if (LootToCrateEnabled) then {
	[vehicleBox, true, 0, ["Buy loot box for 10€", {_this call A3A_fnc_spawnCrate}, "isNull attachedTo _target && (_this == _this getVariable ['owner',objNull]) && (side (group _this) == teamPlayer)", 4, {nil}, 1]] spawn A3A_fnc_actionManager;
};

//map
[mapX, true, 0, ["Game Options", {
	["Game Options", format ["Antistasi - %1<br/><br/>Version: %2<br/><br/>Difficulty: %3<br/>Unlock Weapon Number: %4<br/>Limited Fast Travel: %5",worldName,localize "STR_antistasi_credits_generic_version_text",if (skillMult == 2) then {"Normal"} else {if (skillMult == 1) then {"Easy"} else {"Hard"}},minWeaps,if (limitedFT) then {"Yes"} else {"No"}]] call A3A_fnc_customHint;
	nul=CreateDialog "game_options";
}, "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4, {nil}, 4]] spawn A3A_fnc_actionManager;
[mapX, true, 0, ["Map Info", A3A_fnc_cityinfo, "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4, {nil}, 2], true] spawn A3A_fnc_actionManager;
[mapX, true, 0, ["Move this asset", {_this spawn A3A_fnc_moveHQObject}, "isNull attachedTo _target && _this isEqualTo theBoss", 6, {nil}, 0]] spawn A3A_fnc_actionManager;
if (isMultiplayer) then {[mapX, true, 0, ["AI Load Info", { [] remoteExec ["A3A_fnc_AILoadInfo",2];}, "((_this == theBoss) || (serverCommandAvailable ""#logout""))", 50, {nil}, 1]] spawn A3A_fnc_actionManager};

//tent
[fireX, true, 0, ["Rest for 8 Hours", A3A_fnc_skiptime, "_this isEqualTo theBoss", 6, {nil}, 0]] spawn A3A_fnc_actionManager;
[fireX, true, 0, ["Clear Nearby Forest", A3A_fnc_clearForest, "_this isEqualTo theBoss", 6, {nil}, 0]] spawn A3A_fnc_actionManager;
[fireX, true, 0, ["I hate the fog", { [10,0] remoteExec ["setFog",2]; }, "_this isEqualTo theBoss", 6, {nil}, 0]] spawn A3A_fnc_actionManager;
[fireX, true, 0, ["Rain rain go away", { [10,0] remoteExec ["setRain",2]; }, "_this isEqualTo theBoss", 6, {nil}, 0]] spawn A3A_fnc_actionManager;
[fireX, true, 0, ["Move this asset", {_this spawn A3A_fnc_moveHQObject}, "isNull attachedTo _target && _this isEqualTo theBoss", 6, {nil}, 0]] spawn A3A_fnc_actionManager;
