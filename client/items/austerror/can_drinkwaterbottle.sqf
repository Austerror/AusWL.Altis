// Sctipt: can_eatcookedmeat.sqf
// Author: Austerror
// September 2014
// Checks if player meets conditions to be able to eat  raw meat (has cookedmeat). Returns True, else False.

#define ERR_NO_WATERBOTTLE "You do not have any cooked meat."
#define ERR_NOT_THIRSTY "You are not thirsty enough."

private ["_error", "_haswaterbottle"];
_error = "";
_haswaterbottle = "sc_waterbottle" in magazines player;
if (!_haswaterbottle) exitWith {_error = ERR_NO_WATERBOTTLE};
if (thirstLevel > 80) exitWith {_error = ERR_NOT_THIRSTY};
_error;