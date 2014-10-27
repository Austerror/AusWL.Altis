//	@file Version: 1.0
//	@file Name: staticHeliSpawning.sqf
//	@file Author: [404] Costlyy, AgentRev
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static helis
//	@file Args:

if (!isServer) exitWith {};

private ["_count", "_position", "_marker", "_numToSpawn", "_spawnMarkers", "_markerUsed"];
_numToSpawn = 0;
_count = 0;
_numToSpawn = maxHeliSpawn - objectCountHelis;
_spawnMarkers = [];
{
	if (["heliSpawn_", _x] call fn_findString == 0) then
	{
		_spawnMarkers = _spawnMarkers + [_x];
	};
} forEach allMapMarkers;
diag_log format["WASTELAND SERVER - Heli Markers = %1", _spawnMarkers];
while {_count <= _numToSpawn} do {
	_marker = _spawnMarkers call BIS_fnc_selectRandom;
	_markerUsed = _marker in currentStaticHelis;
	if (!_markerUsed) then // marker hasn't spawned a heli.
	{
		_position = markerPos _marker;
		[0, _position] call staticHeliCreation;
		currentStaticHelis set [count currentStaticHelis, _marker];
		_count = _count + 1;
	};
};

diag_log format["WASTELAND SERVER - %1 Helis Spawned",_count];