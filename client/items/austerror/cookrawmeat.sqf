//@file Version: 1.0
//@file Name: lightfire.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 21/7/2013 16:00
//@file Modified: 17/8/2014 19:10
//@file Description: Unpack a Camp Fire from your inventory

#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define DURATION 5
#define ERR_NO_CAMPFIRE "There's no campfire nearby."
#define ERR_NO_LITCAMPFIRE "The campfire needs to be alight."
#define ERR_NO_RAWMEAT "You don't have any raw meat to cook."
#define ERR_CANCELLED "Cooking raw meat was cancelled."
#define ITEM_COUNT(ITEMID) ITEMID call mf_inventory_count

private ["_hasFailed", "_success", "_campfires", "_campfire"];

/* Commented out for real inventory items (Scorch)
if (MF_ITEMS_RAWMEAT call mf_inventory_count <= 0) exitWith {
    [ERR_NO_RAWMEAT,5] call mf_notify_client;
    false;
};

_campfires = nearestObjects[player, ["Land_Campfire_F", "Land_FirePlace_F"], 5];
_campfire = objNull;
if (count _campfires == 0) exitWith {
	[ERR_NO_CAMPFIRE,5] call mf_notify_client;
    false;
};

_campfire = _campfires select 0;


if (!inflamed _campfire) exitWith {
    [ERR_NO_LITCAMPFIRE,5] call mf_notify_client;
    false;
};
*/

_hasFailed = {
	private ["_progress", "_failed", "_text"];
	_progress = _this select 0;
	_text = "";
	_failed = true;
	switch (true) do {
		case not(alive player): {}; // player dead, no error msg needed
		case (doCancelAction): {doCancelAction = false; _text = ERR_CANCELLED};
		default {
			_text = format["Cooking raw meat %1%2 complete.", round(_progress*100), "%"];
			_failed = false;
        };
    };
    [_failed, _text];
};

_success =  [DURATION, ANIM, _hasFailed, []] call a3w_actions_start;

if (_success) then {
	_playerExp = player getVariable["experience",0];
	player setVariable ["experience", (_playerExp + 1), true];
	player addmagazine "sc_cookedmeat";
	player removemagazine "sc_rawmeat";
	["You have cooked one serving of raw meat.", 5] call mf_notify_client
} else {
	false;
};