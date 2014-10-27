#define ERR_CANCELLED "Drinking Cancelled";
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
			_text = format["Drinking %1%2 Complete", round(100*_progress), "%"];
		};
	};
	[_failed, _text];
};

_success = [5, ANIMATION, _hasFailed, []] call a3w_actions_start;
if (_success) then {
	thirstLevel = (thirstLevel + 45) min 100;
	player removeMagazine "sc_waterbottle";		// Remove sc_waterbottle from players real inventory.
	_playerExp = player getVariable["experience",0];
	player setVariable ["experience", (_playerExp + 1), true];
	["Your thirst has eased", 5] call mf_notify_client;
};
_success;