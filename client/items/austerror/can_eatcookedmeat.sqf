// Sctipt: can_eatcookedmeat.sqf
// Author: Austerror
// September 2014
// Checks if player meets conditions to be able to eat  raw meat (has cookedmeat). Returns True, else False.

#define ERR_NO_COOKEDMEAT "You do not have any cooked meat."
#define ERR_NOT_HUNGRY "You are not hungry enough."

private ["_error", "_hascookedmeat"];
_error = "";
_hascookedmeat = "sc_cookedmeat" in magazines player;
if (!_hascookedmeat) exitWith {_error = ERR_NO_COOKEDMEAT};
if (hungerLevel > 80) exitWith {_error = ERR_NOT_HUNGRY};
_error;