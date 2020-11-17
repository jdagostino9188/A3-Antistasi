private _filename = "A3A_fnc_getAngleSpan";
/*
    Author: Håkon
    Last Edited: Håkon - 2020-10-23
    Function:
        Get the angle span between nodes and the offset from 0 based on the number of child nodes

    Arguments:
        0. <Array> Children

    Return:
        <Array>
            <Int> Angle span
            <Int> Angle offset

    Example:

    Execution: unscheduled

    Effect: Local

    Public: false
*/
params ["_children"];

private _count = count _children;
private ["_angleAllowance", "_angleOffset"];
switch (true) do {
    case (_count > 3): {_angleAllowance = 270; _angleOffset = 45};
    case (_count > 6): {_angleAllowance = 360; _angleOffset = 0};
    Default {_angleAllowance = 180; _angleOffset = 90};
};

[_angleAllowance / (_count + 1), _angleOffset];
