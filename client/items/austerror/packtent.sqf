//@file Version: 1.0
//@file Name: chopwood.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 23/7/2013 16:00
//@file Modified: 17/8/2014 19:25
//@file Description: Chops wood from the nearest tree

#define DURATION 10
#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_NO_TENT "You are not near a tent."
#define ERR_NOT_OWNER "You are not the owner."
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."
#define ERR_CANCELLED "Packing cancelled."

private ["_checks", "_success", "_pos", "_canoffood","_tents","_tent","_uid","_tentOwnerId"];

_checks = {
    private ["_progress","_failed", "_text"];
    _progress = _this select 0;
    _text = "";
    _failed = true;
	_tent = objNull;
	_tents = nearestObjects[player, ["Aus_Tent_Pitched"], 2];
	_uid = getPlayerUID player;
	if (count _tents > 0) then {_tent = _tents select 0;_tentOwnerId = _tent getVariable "ownerUID";};
    switch (true) do {
        case not(alive player): {}; // player is dead, no need for a notification
        case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
        case (isNull _tent): {_text = ERR_NO_TENT};
        case (_uid != _tentOwnerId): {_text = ERR_NOT_OWNER};
        default {
            _text = format["Packing Tent %1%2 Complete", round(100 * _progress), "%"];
            _failed = false;
        };
    };
    [_failed, _text];
};

_success = [DURATION, ANIM, _checks, [_tent]] call a3w_actions_start;

if (_success) then {
	//pvar_spawn_beacons = pvar_spawn_beacons - [_tent];
	//publicVariable "pvar_spawn_beacons";
	// lets dump contents of tent onto ground.
	_tentPos = getPosATL _tent;
	_weapons = (getWeaponCargo _tent) call cargoToPairs;
	_magazines = (getMagazineCargo _tent) call cargoToPairs;
	_items = (getItemCargo _tent) call cargoToPairs;
	_backpacks = (getBackpackCargo _tent) call cargoToPairs;
	deleteVehicle _tent;
	_lootholder = createVehicle ["GroundWeaponHolder", _tentPos, [], 0, "CAN_COLLIDE"];
	_lootholder setPosATL _tentPos;
	{
		_lootholder addWeaponCargoGlobal [_x select 0, _x select 1];
	} forEach _weapons;
	{
		_lootholder addMagazineCargoGlobal [_x select 0, _x select 1];
	} forEach _magazines;

	{
		_lootholder addItemCargoGlobal [_x select 0, _x select 1];
	} forEach _items;
	{
		_lootholder addBackpackCargoGlobal [_x select 0, _x select 1];
	} forEach _backpacks;
	player addMagazine ["sc_packedtent", 1];
	["You have added a packed tent to your inventory. Any contents of the tent have been left on the ground.", 5] call mf_notify_client;
};
false;