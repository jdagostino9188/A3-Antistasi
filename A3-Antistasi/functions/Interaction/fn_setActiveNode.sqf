/*
    Author: Håkon
    Last Edited: Håkon - 2020-10-23
    Function:
        Sets the model relative position data and interaction data, for rendering and execution

    Arguments:

    Return:
        <Nil>

    Example:

    Execution: Draw3D

    Effect: Local

    Public: true
*/
params ["_parentPos", "_parentEntryAngle", "_nodeActionData"];
_nodeActionData params ["_text", "_action", "_condition", "_distance", "_arguments", "_priority", "_repeatable", "_icon", "_childMenu", "_inheritance"];

//overide for conditions
private _target = IMTarget;
private _this = player;
private _originalTarget = _target;

private _hyp = 0.15 * (IMTarget distance player);
private _setChildModelPosData = {
    params ["_pPos", "_entryAngle", "_angleOffset", "_angleDiff", "_childActionData"];
    private _angle = _angleOffset + _angleDiff - _entryAngle;
    private _offset = _pPos vectorAdd [cos _angle * _hyp, 0, sin _angle * _hyp];

    _modelPosData pushBack [_offset, 180-_angle, _childActionData];
    if (_nodeActionData isEqualTo _childActionData) then {_parentModelPos = _offset; _parentEntryAngle = 180-_angle};
};

//model relative position data
private _currentNodeData = IMTarget getVariable ["A3A_InteractionMenu", ["",{},{false},50,{nil},3,[{true},{false}],"\a3\ui_f\data\map\markers\military\dot_ca.paa",[],[]]];
private _parentModelPos = [0,0,0];

//set path model relative position data
private _children = (_currentNodeData#8) select {call (_x#2) && (IMTarget distance player < (_x#3))};
private _modelPosData = [[[0,0,0], 0, _currentNodeData]];
{
    //set current node children data
    private _index = _modelPosData findif { (_x#2) isEqualTo _currentNodeData };
    private _currentNode = _modelPosData#_index;
    _currentNode params ["_modelPos", "_eAngel"];
    _angle = 0; //reset angle
    [_children] call A3A_fnc_getAngleSpan params ["_angleDiff", "_angleOffset"];
    {
        _angle = _angle + _angleDiff;
        [_modelPos, _eAngel, _angleOffset, _angle, _x] call _setChildModelPosData;
    } forEach _children;

    //set to next node in inheritance
    private _nodeName = _x;
    private _index = _children findIf { (_x#0) isEqualTo _nodeName};
    if (_index isEqualTo -1) exitWith {};
    _currentNodeData = _children#_index;
    _children = _currentNodeData #8;

} forEach _inheritance + [_text]; //to render active node added empty path on the end

//set active node children model relative position data
private _parentValidNode = call _condition && IMTarget distance player < _distance;// dont show children if parent isnt shown
private _children = _childMenu select { call (_x#2) && (IMTarget distance player < (_x#3)) && _parentValidNode};
[_children] call A3A_fnc_getAngleSpan params ["_angleDiff", "_angleOffset"];
_angle = 0;
{
    _angle = _angle + _angleDiff;
    [_parentModelPos, _parentEntryAngle, _angleOffset, _angle, _x] call _setChildModelPosData;
} forEach _children;

//convert model pos to world pos
private _dir = IMTarget getDir Player;
private _dirTarget = getDirVisual IMTarget;
private _rotateOffset = if (IMTarget isEqualTo attachedTo player) then {_dir} else {_dir - _dirTarget};
private _newIMRenderData = [];
{
    _x params ["_modelRelPos", "_eAngle", "_nodeData"];
    private _rotatedModelPos = [_modelRelPos, _rotateOffset, 2] call BIS_fnc_rotateVector3D;
    private _pos = IMTarget modelToWorldVisual (_rotatedModelPos vectorAdd IMTypeOffset);
    _newIMRenderData pushBack [_pos, _eAngle, _nodeData];
    if (_nodeActionData isEqualTo _nodeData) then {_parentPos = _pos};
} forEach _modelPosData;

//set global node (render)data
IMRenderData = _newIMRenderData;
ActiveNodeData = [_parentPos, _parentEntryAngle, _nodeActionData];
