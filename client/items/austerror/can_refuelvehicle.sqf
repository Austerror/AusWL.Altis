//@file Version: 1.0
//@file Name: can_refuel.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Check if you can refuel the nearest vehicle
//@file Argument: [_vehicle] the vehicle to test
//@file Argument: [] automatically find the nearest vehicle

#define ERR_NO_VEHICLE "No vehicle within range."
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."
#define ERR_FULL "This vehicle is already full"
#define ERR_NO_FUEL "You have no full fuel cans"

aus_jerrycan_nearest_vehicle = {
    _objects = nearestObjects[player, ["LandVehicle", "Air", "Ship"], 5];
    _object = objNull;
    if (count _objects > 0) then {_object = _objects select 0;};
    _object;
};

private ["_vehicle", "_error"];
_vehicle = objNull;
if (count _this == 0) then { // if array empty
    _vehicle = call aus_jerrycan_nearest_vehicle;
} else {
    _vehicle = _this select 0;
};

_error = "";
_hasfuelcanisterfull = false;
_hasfuelcanisterfull = "sc_fuelcanisterfull" in magazines player;
switch (true) do {
    case (vehicle player != player):{_error = ERR_IN_VEHICLE};
	case (isNull _vehicle): {_error = ERR_NO_VEHICLE};
	case (fuel _vehicle > 0.95): {_error = ERR_FULL};
	case (!_hasfuelcanisterfull): {_error = ERR_NO_FUEL};
    default {};
};
_error;