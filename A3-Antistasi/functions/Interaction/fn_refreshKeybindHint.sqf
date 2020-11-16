/*
    Author: [Håkon]
    [Description]
        refreshes keybind hint used displayed in Quick interaction rendering

    Arguments:

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [] call A3A_fnc_refreshKeybindHint;
*/
IMKeyName = actionKeysNames ["User13",1];
if (IMKeyName isEqualTo "") then {
	IMKeyName = "Open Menu: [ Left Windows ] (Hold)";
	IMKeyBound = false;
} else {
	IMKeyName = format ["Open Menu: [ %1 ] (Hold)", call compile IMKeyName];
	IMKeyBound = true;
};

//quick interaction key
QIKeyName = actionKeysNames ["User14",1];
if (QIKeyName isEqualTo "") then {
	QIKeyName = "[ F ]";
	QIKeyBound = false;
} else {
	QIKeyName = format ["[ %1 ]", call compile QIKeyName];
	QIKeyBound = true;
};
