//@file Version: 1.0
//@file Name: chopwood.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 23/7/2013 16:00
//@file Modified: 17/8/2014 19:25
//@file Description: Chops wood from the nearest tree

#define DURATION 3
#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_NO_TENT "You are not near a tent."
#define ERR_NOT_OWNER "You are not the owner."
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."
#define ERR_CANCELLED "Renaming cancelled."
#define ERR_NONAME "No tent name given."

private ["_checks", "_success", "_pos", "_canoffood","_tents","_tent","_uid","_tentOwnerId"];
_tent = objNull;
_tents = nearestObjects[player, ["Aus_Tent_Pitched"], 2];
_uid = getPlayerUID player;
if (count _tents > 0) then {_tent = _tents select 0;_tentOwnerId = _tent getVariable "ownerUID";};
if (!isNull _tent) then {
	tentName = _tent getVariable["ownerName",""];
};
_createDialogWindow = createDialog "RenameTent";
ctrlSetText [3662,tentName];
waitUntil {!dialog};
//tentName = ctrlText idc;
	
_checks = {
    private ["_progress","_failed", "_text"];
    _progress = _this select 0;
    _text = "";
    _failed = true;
    switch (true) do {
        case not(alive player): {}; // player is dead, no need for a notification
        case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
        case (isNull _tent): {_text = ERR_NO_TENT};
        case (tentName == ""): {_text = ERR_NONAME};
        case (_uid != _tentOwnerId): {_text = ERR_NOT_OWNER};
        default {
            _text = format["Renaming Tent %1%2 Complete", round(100 * _progress), "%"];
            _failed = false;
        };
    };
    [_failed, _text];
};

_success = [DURATION, ANIM, _checks, []] call a3w_actions_start;

if (_success) then {
	_tent setVariable ["ownerName", tentName, true];
	[format["You have renamed the tent to %1.", tentName], 5] call mf_notify_client;
};
false;