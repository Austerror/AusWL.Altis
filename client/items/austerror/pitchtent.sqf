//@file Version: 1.0
//@file Name: lightfire.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 21/7/2013 16:00
//@file Modified: 17/8/2014 19:10
//@file Description: Unpack a Camp Fire from your inventory

#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define DURATION 10
#define ERR_NO_CAMPFIRE "You don't have a tent to deploy."
#define ERR_NO_MATCHES "You need matches to make a tent."
#define ERR_CANCELLED "Set-up of tent was cancelled."

private ["_tent", "_error", "_hasFailed", "_success", "_pos", "_uid"];
//tentName = "";
//_createDialogWindow = createDialog "RenameTent";
//waitUntil {!dialog};
//tentName = ctrlText idc;
//if (tentName == "") then {
//	tentName = format["%1",date];
//};
_hasFailed = {
	private ["_progress", "_failed", "_text"];
	_progress = _this select 0;
	_text = "";
	_failed = true;
	switch (true) do {
		case not(alive player): {}; // player dead, no error msg needed
		case (doCancelAction): {doCancelAction = false; _text = ERR_CANCELLED};
		default {
			_text = format["Tent %1%2 Pitched", round(_progress*100), "%"];
			_failed = false;
        };
    };
    [_failed, _text];
};

_success =  [DURATION, ANIM, _hasFailed, []] call a3w_actions_start;
    
if (_success) then {
	_uid = getPlayerUID player;
	_pos = [player, 2, getDir player] call BIS_fnc_relPos;
	_tent = "Aus_Tent_Pitched" createVehicle _pos;
    _tent setPosATL _pos;
	_tent setDir getDir player;
	_tent setVectorUp [0,0,1];
	_tent setVariable ["allowDamage", true, true];
	_tent setVariable ["objectLocked", true, true];
	_tent setVariable ["ownerUID", _uid, true];
	_tent setVariable ["lockDate", date, true];
	//_tent setVariable ["a3w_spawnBeacon", true, true];
	//_tent setVariable ["R3F_LOG_disabled", true];
	/*
	//_tent setVariable ["ownerName", tentName, true];
    {
        if (_x getVariable ["ownerUID",""] == _uid) then {
            pvar_spawn_beacons = pvar_spawn_beacons - [_x];
        };
    } forEach pvar_spawn_beacons;
	[pvar_spawn_beacons, _tent] call BIS_fnc_arrayPush;
    publicVariable "pvar_spawn_beacons";
	*/
	player removeMagazine "sc_packedtent";
    ["You successfully pitched a tent", 5] call mf_notify_client;
};
false;