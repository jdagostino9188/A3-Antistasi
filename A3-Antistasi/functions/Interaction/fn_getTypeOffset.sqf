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
//if an object requires a specific offset to feel more natural add them by classname and offset here (only do hight)
params [["_object", objNull]];
if (isNull _object) exitWith {[0,0,0]};

switch (true) do {
    case ((_object isKindOf "CAManBase") && hasAce): { _object selectionPosition "spine3" }; //upper torso
    case ((_object isKindOf "LandVehicle") && hasAce): { _object selectionPosition "commander_turret"}; //ace being stupid, actions dosnt show otherwise (dont know why, out of reach?)
    case (_object isKindOf "FlagCarrier"): { [-0.12,-0.38,-2.5] }; //Flag
    case (typeOf _object isEqualTo "MapBoard_seismic_F"): { [0,-0.2,0.5] }; //map
    default { [0,0,0] };
};
