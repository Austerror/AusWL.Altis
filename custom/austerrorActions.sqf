// Austerror Custom actions
// Author Austerror

// Parachute from helicopter.
aus_canParachute = compileFinal preProcessFileLineNumbers "custom\canParachute.sqf";
private ["_label", "_execute", "_condition", "_action"];
_label = "Parachute Out";							// Action Label / Icon.
_execute = {[(getPos player select 0) - 5, (getPos player select 1) - 5, (getPos player select 2) - 5] call "custom\parachute.sqf"};										// Script to call that performs action.
_condition = format["[] call %1 == ''", aus_canParachute];									// Check if action is possible.
_action = [_label, _execute, [], 1, false, false, "", _condition];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["parachute-out", _action] call mf_player_actions_set;