//@file Version: 1.0
//@file Name: paintvehicle[x].sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Paints the vehicle a colour

#define DURATION 10 // seconds
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_IN_VEHICLE "Painting Failed! You can't do that while in a vehicle"
#define ERR_TOO_FAR_AWAY "Painting Failed! You moved too far away from the vehicle"
#define ERR_CANCELLED "Painting Cancelled!"

private ["_vehicle", "_error"];
_vehicle = call aus_nearest_vehicle;
_error = [_vehicle] call mf_can_paintvehiclecamoorange;
if (_error != "") exitWith {[_error, 5] call mf_notify_client; false;};

_checks = {
	private ["_progress","_vehicle","_failed", "_text"];
	_progress = _this select 0;
	_vehicle = _this select 1;
    _text = "";
	_failed = true;
	switch (true) do {
		case not(alive player): {}; //player is dead, no need for a notification
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (player distance _vehicle > 5): {_text = ERR_TOO_FAR_AWAY};
		case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
		default {
			_text = format["Painting vehicle %1%2 Complete", round(100 * _progress), "%"];
			_failed = false;
	    };
	};
	[_failed, _text];
};
_success = [DURATION, ANIMATION, _checks, [_vehicle]] call a3w_actions_start;
if (_success) then {
	player removeMagazine "sc_spraypaintcamoorange";
	[_vehicle, "client\images\vehicleTextures\camo_fack.jpg"] call applyVehicleTexture;
	_vehicle setVariable ["vehicleTexture", "client\images\vehicleTextures\camo_fack.jpg", true];
    ["Painting complete!", 5] call mf_notify_client;
};
false;