// Sctipt: can_eatcookedmeat.sqf
// Author: Austerror
// September 2014
// Checks if player meets conditions to be able to eat  raw meat (has cookedmeat). Returns True, else False.

#define ERR_NO_MATCHES "You do not have any matches."
#define ERR_NO_FIREWOOD "You do not have any firewood."
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."

private ["_error", "_hasmatches", "_hasfirewood"];
_error = "";
_hasmatches = "sc_matchbook" in magazines player;
if (!_hasmatches) exitWith {_error = ERR_NO_MATCHES};
_hasfirewood = "sc_woodenlog" in magazines player;
if (!_hasfirewood) exitWith {_error = ERR_NO_FIREWOOD};
if (vehicle player != player) exitWith {_error = ERR_IN_VEHICLE};
_error;