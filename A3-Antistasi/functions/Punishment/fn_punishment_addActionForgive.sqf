/*
Function:
	A3A_fnc_punishment_addActionForgive

Description:
	Adds action to the Admin to forgive the detainee;
	Adds action to the detainee to refresh the Admin's action.

Scope:
	<GLOBAL> Execute on all players.

Environment:
	<ANY>

Parameters:
	<OBJECT> The detainee that the actions pertains to.

Returns:
	<BOOLEAN> True if hasn't crashed; nothing if it has crashed.

Examples:
	[_detainee] remoteExec ["A3A_fnc_punishment_addActionForgive",0,false];

Author: Caleb Serafin
Date Updated: 29 May 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_detainee"];

private _addAction_parameters = [
	"Refresh Admin Action",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_arguments] remoteExec ["A3A_fnc_punishment_removeActionForgive",0,false];
		sleep 1;
		[_arguments] remoteExec ["A3A_fnc_punishment_addActionForgive",0,false];
	},
	_detainee,
	7
];
_detainee addAction _addAction_parameters;

if ([] call BIS_fnc_admin > 0 || isServer && hasInterface) then {
	private _addAction_parameters = [
		format["[Forgive FF] ""%1""",name _detainee],
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_arguments,"forgive"] call A3A_fnc_punishment_release;
		},
		_detainee,
		0.1
	];
	player addAction _addAction_parameters;
};
true;