/*
    Author: [Håkon]
    [Description]
        if an object requires a specific offset to feel more natural add them by classname and offset here

    Arguments:
    0. <Object> Object you want offset off

    Return Value:
    <Array> Model center relative offset

    Scope: Any
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: private _offset = [_object] call A3A_fnc_getTypeOffset;
*/
params ["_object"];
if (isNil "_object") exitWith {[0,0,0]};

private ["_type", "_isObject"];
if (_object isEqualType objNull) then {_type = typeOf _object; _isObject = true} else {_type = _object; _isObject = false};

switch (true) do {
    case ((_type isKindOf "CAManBase") && hasAce && _isObject): { _object selectionPosition "spine2" }; //upper torso
    case (_type isKindOf "FlagCarrierCore"): { [-0.12,-0.38,-2.5] }; //Flag
    case (_type isEqualTo "Land_TentSolar_01_olive_F"): { [0,0,0.3] }; //tent
    case (_type isEqualTo "MapBoard_seismic_F"): { [0,-0.2,0.5] }; //map
    default { [0,0,0.15] };
};
