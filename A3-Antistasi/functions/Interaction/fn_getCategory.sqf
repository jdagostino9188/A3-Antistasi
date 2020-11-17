private _filename = "A3A_fnc_getCategory";
/*
    Author: Håkon
    Last Edited: Håkon - 2020-10-23
    Function:
        Get a reference to the child action/category based of the path and name, if adding a action categorys can be created by this

    Arguments:
        0. <Array> Parent
        0. <Array> Parent
        0. <Bool> Block creation of category along the path (default: false)

    Return:
        <Array/Int> Child refrence or -1 if it couldnt find it

    Example:

    Execution: unscheduled

    Effect: Local

    Public: false
*/
params ["_interactionMenu", "_path", ["_blockCreate", false]];
if (isNil "_interactionMenu") exitWith {};
private _parent = _interactionMenu;

private _getChildrenNames = {
    params ["_parent"];
    private _childNames = [];
    private _childCategory = (_parent#8);
    {
        _childNames pushBack (_x#0);
    } forEach _childCategory;
    _childNames
};

private _createChild = {
    params ["_parent", "_childName"];
    private _inheritance = if (_interactionMenu isEqualto _parent) then {[]} else {(_parent#8) + [_parent#0]};
    (_parent#8) pushBack [_childName,{},{true},50,{nil},3,[{true}, {false}],"\a3\ui_f\data\map\markers\military\dot_ca.paa",[],_inheritance];
    (_parent#8)#(count (_parent#8) -1);
};

//dig my way to the proper category
{
    private _name = _x;
    private _childNames = [_parent] call _getChildrenNames;
    private _index = _childNames find _name;
    if ((_index isEqualTo -1) && _blockCreate) exitWith {_parent = -1}; //cant remove action from non existing category
    if (_index isEqualTo -1) then {
        _parent = [_parent, _name] call _createChild;
    } else {
        _parent = _parent#8#_index;
    };
} forEach _path;

_parent
