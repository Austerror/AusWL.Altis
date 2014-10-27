//	@file Version: 1.1
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev

waituntil {!isnil "bis_fnc_init"};

private ["_townName", "_randomLoc", "_pos", "_rad", "_chute", "_posFound", "_langle", "_maxrad", "_isWater", "_lpos", "_playerPos"];
ctrlSetText [3413, "Spawning"];

if (isNil "client_firstSpawn") then
{
	execVM "client\functions\firstSpawn.sqf";
};

_pos = getMarkerPos ("mapMiddle");
//_rad = _randomLoc select 1;
_townName = "Austerror Survivor";

//_playerPos = [_pos,5,_rad,1,0,0,0] call findSafePos;

_posFound = false;
while {!_posFound} do {
	_langle = random 360;
	_maxrad = (random 16000);
	_lpos = [_pos, [[_maxrad, 0, 0], _langle] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd;
	_isWater= surfaceIsWater _lpos;
	if (!_isWater) then {
		_posFound = true;
	};
};
_playerPos = [_lpos,5,25,1,0,0,0] call findSafePos;

waitUntil {sleep 0.1; preloadCamera _playerPos};

player setPos _playerPos;
_chute = "Steerable_Parachute_F" createVehicle [0,0,0]; 
_chute setPos [getPos player select 0, getPos player select 1, 400];
player moveIndriver _chute;
player allowDamage true;
respawnDialogActive = false;
closeDialog 0;

_hour = date select 3;
_mins = date select 4;
["Wasteland", _townName, format ["%1:%3%2", _hour, _mins, if (_mins < 10) then {"0"} else {""}]] spawn BIS_fnc_infoText;
