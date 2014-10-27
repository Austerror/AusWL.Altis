//@file Version: 1.0
//@file Name: can_gut.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 21/7/2013 16:00
//@file Modified: 17/8/2014 19:20
//@file Description: Check if you can gut a corpse
//@file Argument: Returns true if tree in range (set in austerror\init.sqf[mf_chop_nearest_tree])

#define ERR_NO_CORPSE "You are not close enough to a corpse."
#define ERR_NOT_DEAD "The animal is not dead."
#define ERR_NO_KNIFE "You do not have a knife."
#define ERR_CANCELLED "Wood Cutting Cancelled!"
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."

mf_gut_nearest_animal = {
	private ["_objects", "_animal", "_supply", "_return"];
    _objects = nearestObjects[player, ["Sheep_random_F", "Rabbit_F", "Goat_random_F", "Cock_random_F", "Hen_random_F"], 5];
	_animal = objNull;
	_supply = 0;
	if (count _objects != 0) then {
		_animal = _objects select 0;
		switch (_animal) do {
			case "Sheep_random_F": { _supply = 3 };
			case "Rabbit_F": { _supply = 1 };
			case "Goat_random_F": { _supply = 1 };
			case "Cock_random_F": { _supply = 1 };
			case "Hen_random_F": { _supply = 1 };
			default { _supply = 1 };
		};
	};
	_return = [_animal, _supply];
	_animal;
};

private ["_corpse","_error","_hasknife", "_exists"];
_error = "";
_corpse = objNull;
_hasknife = "sc_knife" in magazines player;
if (!_hasknife) exitWith {_error = ERR_NO_KNIFE};
_corpse = call mf_gut_nearest_animal;
_exists = _corpse;
if (isNull _exists) exitWith {_error = ERR_NO_CORPSE};
if (alive _exists) exitWith {_error = ERR_NOT_DEAD};
if (vehicle player != player) exitWith {_error = ERR_IN_VEHICLE};
_error;