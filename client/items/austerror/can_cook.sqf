// Sctipt: can_cook.sqf
// Author: Austerror
// September 2014
// Checks if player meets conditions to be able to cook raw meat (has raw meat, near fireplace). Returns True, else False.

#define ERR_NO_RAWMEAT "You do not have any raw meat to cook."
#define ERR_NO_CAMPFIRE "You are not close enough to a campfire."
#define ERR_NOT_LIT "The campfire is not lit."
#define ERR_CANCELLED "Wood Cutting Cancelled!"

private ["_campfires", "_campfire","_error","_hasrawmeat"];
_error = "";
_campfires = nearestObjects[player, ["Land_Campfire_F", "Land_FirePlace_F"], 5];
_hasrawmeat = "sc_rawmeat" in magazines player;
if (!_hasrawmeat) exitWith {_error = ERR_NO_RAWMEAT};
if (count _campfires == 0) exitWith {_error = ERR_NO_CAMPFIRE};
_campfire = _campfires select 0;
if (!inflamed _campfire) exitWith {_error = ERR_NOT_LIT};
_error;
