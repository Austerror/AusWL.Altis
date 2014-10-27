// Sctipt: can_eatcookedmeat.sqf
// Author: Austerror
// September 2014
// Checks if player meets conditions to be able to eat  raw meat (has cookedmeat). Returns True, else False.

#define ERR_NO_TENT "You do not have a tent to pitch."
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."

private ["_error", "_hastent"];
_error = "";
_hastent = "sc_packedtent" in magazines player;
if (!_hastent) exitWith {_error = ERR_NO_TENT};
if (vehicle player != player) exitWith {_error = ERR_IN_VEHICLE};
_error;