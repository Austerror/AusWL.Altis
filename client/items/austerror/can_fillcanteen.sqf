//@file Version: 1.0
//@file Name: can_gut.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 21/7/2013 16:00
//@file Modified: 17/8/2014 19:20
//@file Description: Check if you can gut a corpse
//@file Argument: Returns true if tree in range (set in austerror\init.sqf[mf_chop_nearest_tree])

#define ERR_NO_SOURCE "You are not close enough to a water source."
#define ERR_NO_CANTEEN "You do not have an empty canteen"
#define ERR_CANCELLED "Wood Cutting Cancelled!"
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."

aus_find_closest_watersource = {
	private ["_sourceobjects", "_objects", "_sourceObject", "_found"];
	_sourceobjects = ["stallwater_f", "waterbarrel_f", "watertank_f", "barrelwater_f", "water_source_f"];
    _objects = nearestObjects[player, [], 5];
	_sourceObject = false;
	{
		_y = _x;
		{
			//_obdmg = getDammage _x;
			if ((getDammage _x) != 1) then {
				_found=[_y,_x] call FNC_instring2;
				if  (_found) exitWith {
					_sourceObject = true;
				};
			};
		} forEach _objects;
	} foreach _sourceobjects;
	_sourceObject;
};

private ["_source","_error","_hascanteen", "_exists"];
_error = "";
_exists = false;
_hascanteen = false;
_hascanteen = "sc_canteenempty" in magazines player;
if (!_hascanteen) exitWith {_error = ERR_NO_CANTEEN};
_exists = call aus_find_closest_watersource;
if (!_exists) exitWith {_error = ERR_NO_SOURCE};
if (vehicle player != player) exitWith {_error = ERR_IN_VEHICLE};
_error;