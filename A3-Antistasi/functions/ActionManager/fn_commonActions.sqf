/*
    Author: [Håkon]
    [Description]
        Contains common actions to be added/removed to/from object

    Arguments:
    0. <Object> Object to add/remove action to/from
    1. <String> Action(s) to add/remove
    2. <Bool>   Add action (optional - default: true)

    Return Value:
    <Nil>

    Scope: Server
    Environment: Any
    Public: [Yes]
    Dependencies: ActionManager

    Example: [_flag, "SDKFlag"] remoteExec ["A3A_fnc_comonActions",2];
*/
params ["_object", "_action", ["_add", true]];
private _filename = "fn_commonActions";
#include "..\Garage\defineGarage.inc"

switch _action do {

    case "BuyBoat": {
        [_object, _add, 0, ["Buy Boat", {[vehSDKBoat] spawn A3A_fnc_addFIAVeh}, {(isPlayer _this) and (_this == _this getVariable ['owner',objNull])}, 6, {nil}, 6]] spawn A3A_fnc_actionManager;
    };

    case "SDKFlag": {
        [_object, _add, 0, ["Unit Recruitment",
            {if ([player,300] call A3A_fnc_enemyNearCheck) then {["Recruit Unit", "You cannot recruit units while there are enemies near you"] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; }}
            , "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"
        , 50, {nil}, 1]] spawn A3A_fnc_actionManager;

        [_object, _add, 0, ["Faction Garage", {[GARAGE_FACTION] spawn A3A_fnc_garage;}, "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 6, {nil}, 5]] spawn A3A_fnc_actionManager;
        if (isMultiplayer) then {
            [_object, _add, 0, ["Personal Garage", {[GARAGE_PERSONAL] spawn A3A_fnc_garage;}, "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 6, {nil}, 4]] spawn A3A_fnc_actionManager;
        };

        [_object, _add, 0, ["Buy Vehicle"
            , {if ([player,300] call A3A_fnc_enemyNearCheck) then {["Purchase Vehicle", "You cannot buy vehicles while there are enemies near you"] call A3A_fnc_customHint;} else {nul = createDialog "vehicle_option"}}
            , "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"
        , 6, {nil}, 7]] spawn A3A_fnc_actionManager;
    };

    case "take": {
        [_object, _add, 0, [
            "Take the Flag"
            , A3A_fnc_mrkWIN
            , {(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side group _this isEqualTo TeamPlayer)}
            , 5, {nil}, 6, [{true}, {false}]
            , '\A3\ui_f\data\igui\cfg\actions\takeflag_ca.paa'
        ], true] spawn A3A_fnc_actionManager;
    };

    case "moveS": {
        [_object, _add, 0, ["Move this asset", {_this spawn A3A_fnc_moveHQObject}, "isNull attachedTo _target && _this isEqualTo theBoss", 6, {nil}, 0]] spawn A3A_fnc_actionManager;
    };

    case "refugee":
    {
        [_object, _add, 0, ["Liberate", A3A_fnc_liberaterefugee, {(isPlayer _this) and (_this == _this getVariable ['owner',objNull])}, 4, {nil}, 6, [{true}, {false}], '\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa'], true] spawn A3A_fnc_actionManager;
    };

    case "prisonerX":
    {
        [_object, _add, 0, ["Liberate POW", A3A_fnc_liberatePOW, {(isPlayer _this) and (_this == _this getVariable ['owner',objNull])}, 4, {nil}, 6, [{true}, {false}], '\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa'], true] spawn A3A_fnc_actionManager;
    };

    case "captureX":
    {
        // Uses the optional param to determine whether the call of captureX is a release or a recruit
        [_object, _add, 0, ["Release POW", { _this spawn A3A_fnc_captureX; }, {(isPlayer _this) and (_this == _this getVariable ['owner',objNull])}, 4, false, 6, [{true}, {false}], '\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa']] spawn A3A_fnc_actionManager;
        [_object, _add, 0, ["Recruit", { _this spawn A3A_fnc_captureX; }, {(isPlayer _this) and (_this == _this getVariable ['owner',objNull])}, 4, true, 6]] spawn A3A_fnc_actionManager;
        [_object, _add, 0, ["Interrogate", {_this spawn A3A_fnc_interrogate}, {(isPlayer _this) and (_this == _this getVariable ['owner',objNull])}, 4, {nil}, 0]] spawn A3A_fnc_actionManager;
    };

    case "Intel_Small": {
        [_object, _add, 0, ["Search for Intel", A3A_fnc_searchIntelOnLeader, "isPlayer _this", 6, {nil}, 4], true] spawn A3A_fnc_actionManager;
    };

    case "Intel_Medium":
    {
        [_object, _add, 0, ["Search for Intel", A3A_fnc_searchIntelOnDocument, "isPlayer _this", 6, {nil}, 4], true] spawn A3A_fnc_actionManager;
    };
    case "Intel_Large":
    {
        [_object, _add, 0, ["Search for Intel", A3A_fnc_searchIntelOnLaptop, "isPlayer _this", 6, {nil}, 4], true] spawn A3A_fnc_actionManager;
    };

    case "heal": {
        private _icon = if ([_object] call A3A_fnc_fatalWound) then {'\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'} else {'\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'};
        [_object, _add, 0, [format ["Revive %1", name _object], A3A_fnc_actionRevive, "!(_this getVariable [""helping"",false]) and (isNull attachedTo _target) and (_this != _target)", 4, {nil}, 6, [{true}, {false}], _icon]] spawn A3A_fnc_actionManager;
    };

    case "heal1": {
        private _icon = if ([_object] call A3A_fnc_fatalWound) then {'\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'} else {'\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'};
        [_object, _add, 0, [format ["Revive %1", name _object], A3A_fnc_actionRevive, "!(_this getVariable [""helping"",false]) and (isNull attachedTo _target) and (_this != _target)", 4, {nil}, 6, [{true}, {false}], _icon]] spawn A3A_fnc_actionManager;

        [_object, _add, 0, [format ["Carry %1", name _object], A3A_fnc_carry
        , "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (isNull attachedTo _target) and !(_this getVariable [""helping"",false]) and (_this != _target);"
        , 4, {nil}, 5, [{true}, {false}], '\A3\ui_f\data\igui\cfg\actions\take_ca.paa']] spawn A3A_fnc_actionManager;

        if (_add) then {
            [_object] remoteExec ["jn_fnc_logistics_addActionLoad", 0, _object];
        } else {
            private _text = if (_object isKindOf "CAManBase") then {format ["Load %1 in Vehicle",name _object]} else {"Load Cargo in Vehicle"};
            [_object, _text] remoteExec ["A3A_fnc_removeVanillaAction", 0, _object];
        };
    };

    case "breach": {
        [_object, _add, 0, ["Breach Vehicle", {_this spawn A3A_fnc_startBreachVehicle}, {(isPlayer _this) && (_this == vehicle _this)}, 6, {nil}, 4]] spawn A3A_fnc_actionManager;
    };

    default { [1, format ["Invalid action type: %1", _action], _filename, true ] call A3A_fnc_log };
};
