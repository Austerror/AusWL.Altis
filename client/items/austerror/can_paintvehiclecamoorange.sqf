//@file Version: 1.0
//@file Name: can_chop.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 21/7/2013 16:00
//@file Modified: 17/8/2014 19:20
//@file Description: Check if you can chop wood
//@file Argument: Returns true if tree in range (set in austerror\init.sqf[mf_chop_nearest_tree])

#define ERR_NO_VEHICLE "No vehicle close enough."
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."
#define ERR_EMPTY "The vehicle is empty"
#define ERR_NO_SPRAYPAINT "You don't have any spray paint"
#define ERR_VEHICLE_LOCKED "Vehicle is locked/disabled"

aus_nearest_vehicle = {
    _objects = nearestObjects[player, ["LandVehicle", "Air", "Ship"], 5];
    _object = objNull;
    if (count _objects > 0) then {_object = _objects select 0;};
    _object;
};

private ["_vehicle", "_error", "_hasspraypaint"];
_vehicle = objNull;
if (count _this == 0) then { // if array empty
    _vehicle = call aus_nearest_vehicle;
} else {
    _vehicle = _this select 0;
};
_hasspraypaint = "sc_spraypaintcamoorange" in magazines player;

_error = "";
switch (true) do {
    case (vehicle player != player):{_error = ERR_IN_VEHICLE};
	case (isNull _vehicle): {_error = ERR_NO_VEHICLE};
    case (locked _vehicle > 1): {_error = ERR_VEHICLE_LOCKED};
	case (!_hasspraypaint): {_error = ERR_NO_SPRAYPAINT};
    default {};
};
_error;
