//	@file Version: 1.1
//	@file Name: boatSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer) exitWith {};

private ["_count", "_position", "_marker", "_numToSpawn", "_spawnMarkers", "_markerUsed"];
_numToSpawn = 0;
_count = 0;
_numToSpawn = maxBoatSpawn - objectCountBoats;
_spawnMarkers = [];
currentStaticBoats = [];
_marker = "boatSpawn_1";
{
	if (["boatSpawn_", _x] call fn_findString == 0) then
	{
		_spawnMarkers = _spawnMarkers + [_x];
	};
} forEach allMapMarkers;
diag_log format["WASTELAND SERVER - Boat Markers = %1", _spawnMarkers];
while {_count <= _numToSpawn} do {
	_marker = _spawnMarkers call BIS_fnc_selectRandom;
	_markerUsed = _marker in currentStaticBoats;
	if (!_markerUsed) then // marker hasn't spawned a heli.
	{
		_position = markerPos _marker;
		[_position] call boatCreation;
		currentStaticBoats set [count currentStaticBoats, _marker];
		_count = _count + 1;
	};
};

diag_log format["WASTELAND SERVER - %1 Boats Spawned",_count];
