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
if (_object isKindOf "CAManBase") exitWith {[0,0,1.3]};

switch (typeOf _object) do {
    case ("Flag_FIA_F"): { [-0.12,-0.38,-2.5] }; //Flag
    case ("MapBoard_seismic_F"): { [0,-0.2,0.5] };
    default { [0,0,0] };
};
