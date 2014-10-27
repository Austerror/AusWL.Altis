//@file Version: 1.0
//@file Name: chopwood.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 23/7/2013 16:00
//@file Modified: 17/8/2014 19:25
//@file Description: Chops wood from the nearest tree

#define DURATION 5
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_NO_ANIMAL "You are not close enough to a corpse."
#define ERR_TOO_FAR_AWAY "You moved too far away from the corpse."
#define ERR_CANCELLED "Gutting Cancelled!"
#define ITEM_COUNT(ITEMID) ITEMID call mf_inventory_count

private ["_checks", "_success", "_pos", "_canoffood", "_cangut"];
_cangut = call mf_gut_nearest_animal;

_checks = {
    private ["_progress","_failed", "_text", "_corpse"];
    _progress = _this select 0;
	_corpse = _this select 1;
    _text = "";
    _failed = true;
    switch (true) do {
        case not(alive player): {}; // player is dead, no need for a notification
        case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
        case (alive _corpse): {_text = ERR_CANCELLED; doCancelAction = false;};
        default {
            _text = format["Gutting %1%2 Complete", round(100 * _progress), "%"];
            _failed = false;
        };
    };
    [_failed, _text];
};
_success = [DURATION, ANIMATION, _checks, [_cangut]] call a3w_actions_start;

if (_success) then {
	deleteVehicle _canGut;
	player addMagazine ["sc_rawmeat", 1];		// Add Raw meat to players real inventory (as itemWatch).
	_playerExp = player getVariable["experience",0];
	player setVariable ["experience", (_playerExp + 1), true];
	["You have added 1 raw meat to your inventory.", 5] call mf_notify_client;
};
false;