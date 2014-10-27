//@file Version: 1.0
//@file Name: repair.sqf
//@file Author: MercyfulFate
//@file Created: 23/7/2013 16:00
//@file Description: Repair the nearest Vehicle

#define DURATION 7
#define REPAIR_RANGE 6;
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_NO_VEHICLE "You are not close enough to a vehicle that needs repairing"
#define ERR_IN_VEHICLE "Repairing Failed! You can't do that in a vehicle"
#define ERR_FULL_HEALTH "Repairing Failed! The vehicle is already repaired"
#define ERR_DESTROYED "The vehicle is too damaged to repair"
#define ERR_TOO_FAR_AWAY "Repairing Failed! You moved too far away from the vehicle"
#define ERR_CANCELLED "Repairing Cancelled!"

private ["_vehicles", "_vehicle", "_hitPoints", "_checks", "_success", "_isDamage", "_tyreDamage", "_wheelPositions", "_tyreToFix", "_vehiclePos", "_vehicleDir"];
_isDamage = false;
_tyreDamage = 0;
_vehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 5];
_vehicle = _vehicles select 0;
_tyreToFix = ["HitLFWheel", 0.004]; // [_wheelposition, _tyreDamage] If script doesn't work, maybe try a default wheel to fix?
_wheelPositions =
	[
		"HitLFWheel",
		"HitLBWheel",
		"HitLMWheel",
		"HitLF2Wheel",
		"HitRFWheel",
		"HitRBWheel",
		"HitRMWheel",
		"HitRF2Wheel"
	];
if (!isNull _vehicle) then {
	{
		_tyreDamage = _vehicle getHitPointDamage _x;
		if (_tyreDamage > 0.2) then {
			_isDamage = true;
			if (count _tyreToFix > 0) then {
				if (_tyreToFix select 1 < _tyreDamage) then {
					_tyreToFix = [_x,_tyreDamage];
				};
			} else {
				_tyreToFix = [_x,_tyreDamage];
			};
		};
		_tyreDamage = 0;
	} forEach _wheelPositions;
};

_checks = {
    private ["_progress","_failed", "_text"];
    _progress = _this select 0;
    _vehicle = _this select 1;
    _text = "";
    _failed = true;
    switch (true) do {
        case not(alive player): {}; // player is dead, no need for a notification
        case (vehicle player != player): {_text = ERR_IN_VEHICLE};
        case (isNull _vehicle): {_text = ERR_NO_VEHICLE};
        case (player distance _vehicle > (sizeOf typeOf _vehicle) / 1.8): {_text = ERR_TOO_FAR_AWAY};
        case (!alive _vehicle): {_error = ERR_DESTROYED};
		case (!_isDamage): {_error = ERR_FULL_HEALTH}; // 0.2 is the threshold at which wheel damage causes slower movement
        case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
        default {
            _text = format["Repairing %1%2 Complete", round(100 * _progress), "%"];
            _failed = false;
        };
    };
    [_failed, _text];
};

_success = [DURATION, ANIMATION, _checks, [_vehicle]] call a3w_actions_start;

if (_success) then {
	serverRepairVehicle = [_vehicle, _tyreToFix];
	publicVariableServer "serverRepairVehicle";
	player removeMagazine "sc_cartyre";
	_playerExp = player getVariable["experience",0];
	player setVariable ["experience", (_playerExp + 1), true];
	["Repairing complete!", 5] call mf_notify_client;
};
false;