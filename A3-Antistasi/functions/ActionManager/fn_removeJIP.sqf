/*
    Author: [Håkon]
    [Description]
        removes a specific action JIP message

    Arguments:
    0. <Object> Object the action is/was on
    1. <Array>  Path array including name of action

    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_object, _fullPath] remoteExecCall ["A3A_fnc_removeJIP", 2];
*/
params [["_object", objNull], "_fullPath"];

if (!isServer) exitWith {};
if (isNull _object) exitWith {};

//extract path to action and action name
private _countPath = count _fullPath;
private ["_name"];
if (_countPath isEqualTo 1) then {
    _name = _fullPath#0;
} else {
    _name = _fullPath#(_countPath - 1);
};
private _path = _fullPath - [_name];
private _optionalArgument = if (_path isEqualTo []) then {false} else {_path};

//fix object string for JIP
private _objectString = toArray str _object; //need to remove ':' as it breaks JIP
_objectString deleteAt (_objectString find 58);
_objectString = toString _objectString;

private _JIPMessage = format ["%1_%2_%3", _objectString, _optionalArgument, _name];

remoteExecCall ["", 0, _jipMessage];
actionJIPRec deleteAt (actionJIPRec find [_object, _jipMessage]);
