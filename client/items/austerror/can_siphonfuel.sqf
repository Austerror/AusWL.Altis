//@file Version: 1.0
//@file Name: can_syphon.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Check if you can syphon from the nearest vehicle
//@file Argument: [_vehicle] the vehicle to test
//@file Argument: [] automatically find the nearest vehicle

#define ERR_NO_VEHICLE "No vehicle close enough."
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."
#define ERR_EMPTY "The vehicle is empty"
#define ERR_NO_JERRYCAN "You have no empty fuel cans"
#define ERR_NO_SYPHON "You don't have a syphon hose"
#define ERR_VEHICLE_LOCKED "Vehicle is locked/disabled"

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
_hasfuelcanister = false;
_hassiphonhose = false;
_hassiphonhose = "sc_siphonhose" in magazines player;
_hasfuelcanister = "sc_fuelcanisterempty" in magazines player;
switch (true) do {
    case (vehicle player != player):{_error = ERR_IN_VEHICLE};
	case (isNull _vehicle): {_error = ERR_NO_VEHICLE};
    case (locked _vehicle > 1): {_error = ERR_VEHICLE_LOCKED};
	case (!_hasfuelcanister): {_error = ERR_NO_JERRYCAN};
	case (!_hassiphonhose): {_error = ERR_NO_SYPHON};
	case not(fuel _vehicle >= ([_vehicle] call mf_jerrycan_fuel_amount)): {_error = ERR_EMPTY};
    default {};
};
_error;