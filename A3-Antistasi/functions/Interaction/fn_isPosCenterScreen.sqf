/*
    Author: Håkon
    Last Edited: Håkon - 2020-10-23
    Function:
        find if the position is in the center of the screen, rotatet based on the IMTarget and the player

    Arguments:
        0. <Array> Model relative position

    Return:
        <Bool> Is the position center screen, tollerance +-0.05

    Example:

    Execution: unscheduled

    Effect: Local

    Public: false
*/
params ["_worldPos"];
if (isNil "_worldPos") exitWith {false};
private _screenPos = worldToScreen _worldPos;
if (_screenPos isEqualTo []) exitWith {false};
_screenPos distance2D [0.5,0.5] < 0.05;
