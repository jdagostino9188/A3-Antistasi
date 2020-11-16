/*
    Author: [Håkon]
    [Description]
        Makes curator placed object initialized with class actions and inherited class actions

    Arguments:
    0. <Object> Curator Logic object

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [_curator] call A3A_fnc_initCuratorObjReg;
*/
params ["_curator"];
_curator addEventHandler ["CuratorObjectPlaced", {
	params ["_curator", "_entity"];
	if (typeOf _entity isEqualTo "zen_modules_moduleAssignZeus") then { [_curator] call A3A_fnc_initCuratorObjReg }; //promote to zues module
	[_entity] call A3A_fnc_initClassActions;
}];
