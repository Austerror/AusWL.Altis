//@file Version: 1.0
//@file Name: lightfire.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 21/7/2013 16:00
//@file Modified: 17/8/2014 19:10
//@file Description: Unpack a Camp Fire from your inventory

#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define DURATION 5
#define ERR_NO_CAMPFIRE "You don't have a campfire to deploy."
#define ERR_NO_MATCHES "You need matches to make a campfire."
#define ERR_CANCELLED "Set-up of campfire was cancelled."

private ["_campfire", "_error", "_hasFailed", "_success", "_pos"];

_hasFailed = {
	private ["_progress", "_failed", "_text"];
	_progress = _this select 0;
	_text = "";
	_failed = true;
	switch (true) do {
		case not(alive player): {}; // player dead, no error msg needed
		case (doCancelAction): {doCancelAction = false; _text = ERR_CANCELLED};
		default {
			_text = format["Campfire %1%2 Set-up", round(_progress*100), "%"];
			_failed = false;
        };
    };
    [_failed, _text];
};

_success =  [DURATION, ANIM, _hasFailed, []] call a3w_actions_start;
    
if (_success) then {
	//_pos = getPosATL player;
	_pos = [player, 1, getDir player] call BIS_fnc_relPos;
	_campfire = "Land_Campfire_F" createVehicle _pos;
    _campfire setPosATL _pos;
	_campfire setVectorUp [0,0,1];
	// remove 1 from sc_matchbook variable matchcount
	player removeMagazine "sc_woodenlog";
    ["You successfully set-up a campfire", 5] call mf_notify_client;
};
false;