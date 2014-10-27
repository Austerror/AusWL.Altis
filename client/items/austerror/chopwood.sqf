//@file Version: 1.0
//@file Name: chopwood.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 23/7/2013 16:00
//@file Modified: 17/8/2014 19:25
//@file Description: Chops wood from the nearest tree

#define DURATION 10
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_NO_TREE "You are not close enough to a tree."
#define ERR_TOO_FAR_AWAY "You moved too far away from the tree."
#define ERR_CANCELLED "Wood Cutting Cancelled!"


mf_is_tree = {
	private ["_unkobject","_treeobjects", "_objects", "_tree", "_objdmg", "_found"];
	_treeobjects = ["t_broussonetiap1s_f", "t_ficusb1s_f", "t_ficusb2s_f", "t_fraxinusav2s_f", "t_oleae1s_f", "t_oleae2s_f", "t_phoenixc1s_f", "t_phoenixc3s_f", "t_pinuss1s_f", "t_pinuss2s_b_f", "t_pinuss2s_f", "t_pinusp3s_f", "t_poplar2f_dead_f", "t_populusn3s_f", "t_quercusir2s_f"];
	_unkobject = _this;
	_tree = false;
	_y = _x;
	{
		if ([_x,_y] call FNC_instring2) then {
			_tree = true;
		};	
	} forEach _treeobjects;
	_tree;
};

private ["_canchop", "_error", "_trees", "_tree", "_checks", "_success","_playerExp"];

_checks = {
    private ["_progress","_failed", "_text"];
    _progress = _this select 0;
    _text = "";
    _failed = true;
    switch (true) do {
        case not(alive player): {}; // player is dead, no need for a notification
        case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
        default {
            _text = format["Wood Cutting %1%2 Complete", round(100 * _progress), "%"];
            _failed = false;
        };
    };
    [_failed, _text];
};

_success = [DURATION, ANIMATION, _checks, []] call a3w_actions_start;

if (_success) then {
	// Remove tree if we can (to be added)
	trees = nearestObjects [player,[],5];
	{
		//if (_x setDamage 1) exitWith {};
		_unkobjectname = format ["%1", _x];
		if (_unkobjectname call mf_is_tree) exitWith {playSound "treefall"; _x setDamage 1};
	} forEach trees;
	// Maybe??
	player addMagazine ["sc_woodenlog", 1];
	_playerExp = player getVariable["experience",0];
	player setVariable ["experience", (_playerExp + 1), true];
	["You have added 1 wood to your inventory.", 5] call mf_notify_client
};
false;