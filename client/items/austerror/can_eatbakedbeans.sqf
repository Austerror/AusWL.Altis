// Sctipt: can_eatcookedmeat.sqf
// Author: Austerror
// September 2014
// Checks if player meets conditions to be able to eat  raw meat (has cookedmeat). Returns True, else False.

#define ERR_NO_BAKEDBEANS "You do not have any baked beans."
#define ERR_NOT_HUNGRY "You are not hungry enough."

private ["_error", "_hasbakedbeans"];
_error = "";
_hasbakedbeans = "sc_bakedbeans" in magazines player;
if (!_hasbakedbeans) exitWith {_error = ERR_NO_BAKEDBEANS};
if (hungerLevel > 80) exitWith {_error = ERR_NOT_HUNGRY};
_error;