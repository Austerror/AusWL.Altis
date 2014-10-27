//@file Version: 1.0
//@file Name: fillcanteen.sqf
//@file Author: Austerror
//@file Created: 21/7/2013 16:00
//@file Description: Refill an empty canteen
//@file Argument: [player, player, _actionid, []] the standard "called by an action" values

#define DURATION 5
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_NO_SOURCE "No nearby water source."
#define ERR_TOO_FAR_AWAY "Filling Canteen Failed! You moved to far away"
#define ERR_CANCELLED "Filling Canteen Cancelled!"

_checks = {
    private ["_progress","_failed", "_text"];
    _progress = _this select 0;
    _text = "";
    _failed = true;
    switch (true) do {
        case not(alive player): {}; // player is dead, no need for a notification
        case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
        default {
            _text = format["Filling Canteen %1%2 Complete", round(100 * _progress), "%"];
            _failed = false;
        };
    };
    [_failed, _text];
};

_success = [DURATION, ANIMATION, _checks, []] call a3w_actions_start;

if (_success) exitWith {
	player removeMagazine "sc_canteenempty";
	player addMagazine "sc_canteenfull";
	_playerExp = player getVariable["experience",0];
	player setVariable ["experience", (_playerExp + 1), true];
	["You have filled 1 canteen.", 5] call mf_notify_client;
	true;
};
false;