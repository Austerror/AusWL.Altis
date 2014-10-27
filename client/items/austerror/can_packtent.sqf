//@file Version: 1.0
//@file Name: can_chop.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 21/7/2013 16:00
//@file Modified: 17/8/2014 19:20
//@file Description: Check if you can chop wood
//@file Argument: Returns true if tree in range (set in austerror\init.sqf[mf_chop_nearest_tree])

#define ERR_NO_TENT "You are not near a tent."
#define ERR_NOT_OWNER "You are not the owner."
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."

private ["_tents","_tent","_error","_tentOwnerId","_uid"];
_error = "";
_tent = objNull;
_uid = getPlayerUID player;
_tents = nearestObjects[player, ["Aus_Tent_Pitched"], 2];
if (count _tents > 0) then {_tent = _tents select 0};
if (isNull _tent) exitWith {_error = ERR_NO_TENT};
_tentOwnerId = _tent getVariable "ownerUID";
if (_uid != _tentOwnerId) exitWith {_error = ERR_NOT_OWNER};
if (vehicle player != player) exitWith {_error = ERR_IN_VEHICLE};
_error;
