//server executed single time, adds LTC actions as class actions to all LTC boxes
if (!isServer) exitWith {};
if (!isNil "A3A_LTCInit") exitWith {};

["Box_IND_Wps_F", true, 0, [
	"Load loot to crate",
	{[_this#0, clientOwner] remoteExecCall ["A3A_fnc_canLoot", 2]}
	, {attachedTo _target isEqualTo objNull}
	, 3
], true] spawn A3A_fnc_actionManager;

["Box_IND_Wps_F", true, 0, [
	"Load loot from crate to vehicle",
	{[_this#0, clientOwner] remoteExecCall ["A3A_fnc_canTransfer", 2]}
	, {attachedTo _target isEqualTo objNull}
	, 3
	, {nil}
	, 1.5
]] spawn A3A_fnc_actionManager;

["Box_IND_Wps_F", true, 0, [
	"Carry Crate",
	{[_this#0, true] call A3A_fnc_carryCrate;}
	, {(attachedTo _target isEqualTo objNull) && ({!(isNull _x)} count attachedObjects _this isEqualTo 0)}
	, 3
	, {nil}
	, 1
]] spawn A3A_fnc_actionManager;

["Box_IND_Wps_F", true, 0, [
	"Drop Crate",
	{[nil, false] call A3A_fnc_carryCrate;}
	, {(attachedTo _target isEqualTo _this)}
	, 3
	, {nil}
	, 1
]] spawn A3A_fnc_actionManager;

A3A_LTCInit = true;
