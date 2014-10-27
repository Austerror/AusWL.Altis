#define ERR_CANCELLED "Eating Cancelled";
#define ANIMATION "AinvPknlMstpSnonWnonDnon_healed_1"
private ["_hasFailed"];
_hasFailed = {
	private ["_progress","_failed", "_text"];
	_progress = _this select 0;
	_text = "";
	_failed = true;
	switch (true) do {
		case not(alive player) : {}; // player is dead, not need for a error message
		case (doCancelAction): {doCancelAction = false; _text = ERR_CANCELLED;};
		default {
			_failed = false;
			_text = format["Eating %1%2 Complete", round(100*_progress), "%"];
		};
	};
	[_failed, _text];
};

_success = [5, ANIMATION, _hasFailed, []] call a3w_actions_start;
if (_success) then {
	hungerLevel = (hungerLevel + 45) min 100;
	player removeMagazine "sc_bakedbeans";		// Add Cooked meat to players real inventory (as itemWatch).
	_playerExp = player getVariable["experience",0];
	player setVariable ["experience", (_playerExp + 1), true];
	["Your hunger has eased", 5] call mf_notify_client;
};
_success;