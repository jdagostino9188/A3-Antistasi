/*
    Author: Håkon
    Last Edited: Håkon - 2020-10-23
    Function:
        Renders the Interaction menu or Quick interaction based on context and data in IMRenderData and ActiveNodeData

    Arguments:

    Return:
        <Nil>

    Example:

    Execution: Draw3D

    Effect: Local

    Public: false
*/

//overide for condition
_this = player;
private _originalTarget = IMTarget;
private _target = vehicle _originalTarget;

//Rotation data
private _dir = IMTarget getDir Player;
private _dirTarget = getDirVisual IMTarget;
private _rotateOffset = if (IMTarget isEqualTo attachedTo player) then {_dir} else {_dir - _dirTarget};

//draw selector
if (!isNil "ActiveNodeData" && IMNodeSelected) then {
    ActiveNodeData params ["_pos", "_entryAngle", "_actionData"];
    _actionData params ["", "_action", "_condition", "_distance", "", "", "", ""];

    //display formating
    private _category = _action isEqualTo {} || !(call _condition && _target distance _this < _distance);
    private _iconSize = if (_category) then {0.8} else {0.6};

    //rendering
    drawIcon3D ["\a3\ui_f\data\igui\cfg\holdactions\idle\idle_1_ca.paa", [1,1,1,0.5], _pos, _iconSize, _iconSize, IMSelectedRotation, "", true, 0.03, "TahomaB", "left"];
    IMSelectedRotation = IMSelectedRotation - 1;
    if (IMSelectedRotation isEqualTo 0) then {IMSelectedRotation = 360};
} else {
    IMSelectedRotation = 360;
};

//draw nodes
{
    _x params ["_pos", "_entryAngle", "_actionData"];
    _actionData params ["_text", "_action", "_condition", "_distance", "", "", "", "_icon"];

    //display formating
    private _category = _action isEqualTo {} || !(call _condition && _target distance _this < _distance);
    private _textSize = if (_category) then {0.04} else {0.03};
    private _color = if (_category) then {[0.7,0.7,0.7,1]} else {[1,1,1,1]};
    private _iconSize = if (_category) then {0.8} else {0.6};
    private _displayText = if (call _condition && _target distance _this < _distance) then {_text} else {""};

    //rendering
    drawIcon3D [_icon, _color, _pos, _iconSize, _iconSize, 0, _displayText, true, _textSize, "TahomaB", "center"];
} forEach IMRenderData;
