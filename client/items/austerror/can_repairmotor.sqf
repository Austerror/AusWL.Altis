//@file Version: 1.0
//@file Name: can_repair.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Check if you can repair the nearest vehicle
//@file Argument: [_vehicle] the vehicle to test
//@file Argument: [] automatically find the nearest vehicle

#define ERR_NO_VEHICLE "No vehicle close enough."
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."
#define ERR_FULL_HEALTH "There are no damaged tyres"
#define ERR_DESTROYED "The vehicle is too damaged to repair"
#define ERR_NO_MOTOR "You have no motor part"

private ["_vehicle", "_hitPoints", "_error", "_hasmotor", "_motorPositions", "_motorDamage", "_isDamage"];
_motorPositions = ["HitEngine","HitEngine2","HitEngine3","HitHRotor","HitVRotor","HitTransmission","HitAvionics","HitHStabilizerR1","HitVStabilizer1","HitHydraulics","HitHStabilizerL1"];
_isDamage = false;
_motorDamage = 0;
_vehicle = objNull;
_vehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 5];
if (count _vehicles > 0) then {
	_vehicle = _vehicles select 0;
};
if (!isNull _vehicle) then {
	{
		_motorDamage = _vehicle getHitPointDamage _x;
		//diag_log format ["_motorDamage, _x = %1, %2", _motorDamage, _x];
		if (_motorDamage > 0.2) then {_isDamage = true};
		_motorDamage = 0;
	} forEach _motorPositions;
};

_hasmotor = false;
_hasmotor = "sc_motor" in magazines player;
_error = "";

switch (true) do {
    case (vehicle player != player):{_error = ERR_IN_VEHICLE};
	case (isNull _vehicle): {_error = ERR_NO_VEHICLE};
	case (!alive _vehicle): {_error = ERR_DESTROYED};
	case (!_isDamage): {_error = ERR_FULL_HEALTH}; // 0.2 is the threshold at which wheel damage causes slower movement
	case (!_hasmotor): {_error = ERR_NO_MOTOR};
    default {};
};
//diag_log format ["can_repairtyre.sqf _error = %1", _error];
_error;
