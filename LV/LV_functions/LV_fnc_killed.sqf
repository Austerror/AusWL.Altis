// LV_fnc_killed.sqf
// By Austerror.

_deadNPC = _this select 0;
_npcKiller = _this select 1;
//if (vehicle _npcKiller != _npcKiller
_playerExp = _npcKiller getVariable["experience",0];
_npcKiller setVariable ["experience", (_playerExp + 10), true];
