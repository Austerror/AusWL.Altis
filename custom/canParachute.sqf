//@file Version: 1.0
//@file Name: canParachute.sqf
//@file Author: Austerror
//@file Created: 29/9/2013 02:23
//@file Description: Check if you can parachute from helicopter
//@file Argument: Returns true if possible

#define ERR_NO_CHOPPER "You are not in a helicopter."
#define ERR_NO_ALTITUDE "You are not above 60ft."

private ["_helicopters","_error","_hasAltitude","_playerVehicle"];
_error = "";
_helicopters =
	[
		"CSJ_GyroC",
		"B_Heli_Light_01_F",
		"I_Heli_light_03_unarmed_F",
		"B_Heli_Attack_01_F",
		"O_Heli_Attack_02_black_F",
		"B_Heli_Light_01_armed_F",
		"O_Heli_Light_02_unarmed_F",
		"I_Heli_Transport_02_F",
		"B_Heli_Transport_01_F",
		"B_Heli_Transport_01_camo_F",
		"I_Heli_light_03_F",
		"O_Heli_Attack_02_F"
	];
_playerVehicle = vehicle player;
if (vehicle player in _helicopters) exitWith {
	_error = ERR_NO_CHOPPER;
	//diag_log format ["_error =  $%1, vehicle player = %2", _error, _playerVehicle];
};
if (getPos player select 2 < 60) exitWith {
	_error = ERR_NO_ALTITUDE;
	//diag_log format ["_error =  $%1, getPos player select 2 = %2", _error, getPos player select 2];
};
_error;