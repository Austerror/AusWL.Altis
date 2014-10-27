//	@file Version: 1.0
//	@file Name: planeSpawning.sqf
//	@file Author: AgentRev
//	@file Created: 21/09/2013 17:13
//	@file Args:

if (!isServer) exitWith {};

private ["_count", "_position", "_marker", "_numToSpawn", "_spawnMarkers", "_markerUsed"];
_numToSpawn = 0;
_count = 0;
_numToSpawn = maxPlaneSpawn - objectCountPlanes;
_spawnMarkers = [];
currentStaticPlanes = [];
{
	if (["planeSpawn_", _x] call fn_findString == 0) then
	{
		_spawnMarkers = _spawnMarkers + [_x];
	};
} forEach allMapMarkers;
diag_log format["WASTELAND SERVER - Plane Markers = %1", _spawnMarkers];
while {_count <= _numToSpawn} do {
	_marker = _spawnMarkers call BIS_fnc_selectRandom;
	_markerUsed = _marker in currentStaticPlanes;
	if (!_markerUsed) then // marker hasn't spawned a heli.
	{
		_noBuzzard = ["_noBuzzard", _marker] call fn_findString != -1;
		[markerPos _marker, markerDir _marker, _noBuzzard] call planeCreation;
		currentStaticPlanes set [count currentStaticPlanes, _marker];
		_count = _count + 1;
	};
};

diag_log format["WASTELAND SERVER - %1 Planes Spawned",_count];

