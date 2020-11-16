/*
    Author: [Håkon]
    [Description]
        executes interaction node action

    Arguments:
    0. <Object> The object the action is on
    1. <Array>  Interaction menu node array

    Return Value:
    <nil>

    Scope: Clients
    Environment: unscheduled
    Public: [No]
    Dependencies:

    Example: [IMTarget, _actionData] call A3A_fnc_executeAction;
*/
params ["_originalTarget", "_actionData"];

private _target = vehicle _originalTarget;
private _this = player;

_actionData params ["_text", "_action", "_condition", "_distance", "_arguments", "_priority", "_repeatableArray", "_icon", "_children", "_path"];
_repeatableArray params ["_isRepeatable", "_isLocal"];
private _isQuickInteraction = isNull IMTarget;

if (_target distance _this > _distance || InteractionActionCD > time) exitWith {};
if (call _condition) then {
    InteractionActionCD = time + 0.1; //spam protection
    [_target, _this, {nil}, _arguments] spawn _action;

    //self removal functionality
    switch (true) do {
        case (_isQuickInteraction && !(call _isRepeatable)): { //Quick interaction
            if (call _isLocal) then {
                [_target, "", {}, false, 50, {nil}, [false, false]] call A3A_fnc_setInteraction;
            } else {
                [_target, false, 0, [_text], true] remoteExec ["A3A_fnc_actionManager", 0];
            };
        };
        case (!_isQuickInteraction && !(call _isRepeatable)): { //Menu
            if (call _isLocal) then {
                [IMTarget, [_path, _text]] call A3A_fnc_removeInteraction;
            } else {
                [_target, false, 0, [_text], _path] remoteExec ["A3A_fnc_actionManager", 0];
            };
        };
    };
};
