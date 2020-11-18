private _filename = "A3A_fnc_setInteraction";
/*
    Author: Håkon
    Last Edited: Håkon - 2020-09-18
    Function:
        Sets a interaction on an object, used by players with the "F" key

    Arguments:
        0. <Object> Object to attach interaction to
        1. <String> Text to display                     (default: "")
        2. <String> Code to execute                     (default: {})
        3. <String> Condition to allow action           (default: false)
        4. <Int> Distance to show action                (default: 50)
        3. <Any> Arguments to pass to code              (default: nil)
        4. <String> Condition if can repeat             (default: True)

    Return:
        <Bool> Action added

    Example:
        [
            _unit,                              //Target
            "Say hi!",                          //Action text
            "Hint 'Test'",                      //code
            "player distance cursorTarget < 3", //condition
            50,                                 //Distance
            {nil},                              //arguments
            [{true}, {true}]                    //can repeat
        ] call A3A_fnc_setInteraction;

    Execution: unscheduled

    Effect: Local

    Public: true
*/

params ["_obj", ["_text", ""], ["_code", {}], ["_condition", {false}], ["_distance", 50], ["_arguments", {nil}], ["_repeatable", [{true}, {true}]], ["_icon", "\a3\ui_f\data\map\markers\military\dot_ca.paa"]];
if (isNil "_obj" || {isNull _obj}) exitWith {false};
if (isNil "InteractionSystemInit") then {[] spawn A3A_fnc_interactionInit};

//fix formating of data
_code = [_code] call A3A_fnc_correctCodeFormat;
_condition = [_condition] call A3A_fnc_correctCodeFormat;
_repeatable = [
    [_repeatable#0] call A3A_fnc_correctCodeFormat
    , [_repeatable#1] call A3A_fnc_correctCodeFormat
];

//set action data
private _interactionMenu = _obj getVariable ["A3A_InteractionMenu", ["",{},{false},50,{nil},3,[{true}, {false}],"\a3\ui_f\data\map\markers\military\dot_ca.paa",[],[]]];
_interactionMenu set [0, _text];
_interactionMenu set [1, _code];
_interactionMenu set [2, _condition];
_interactionMenu set [3, _distance];
_interactionMenu set [4, _arguments];
_interactionMenu set [6, _repeatable];
_interactionMenu set [7, _icon];
_obj setVariable ["A3A_InteractionMenu", _interactionMenu, call (_repeatable#1)];

true;
