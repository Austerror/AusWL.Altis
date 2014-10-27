//	@file Version: 2
//	@file Name: vehicleSpawning.sqf
//	@file Author: [GoT] JoSchaap, AgentRev
//  new one, no longer requires Spawn_ markers but uses the town's radius in config.sqf to pick the ammount of vehicles

#define A3W_TOWN_SPAWNING_METERS_PER_VEHICLE 50 // This defines a fraction of the town's radius for which to spawn a vehicle (ex.: 20 meters per vehicle in town with 100m radius = 5 vehicles in town)
#include "vehicleBuildings.sqf"
if (!isServer) exitWith {};
/*
_comBuilding_list = [];
_milBuilding_list = [];
_indmaBuilding_list = [];
_medBuilding_list = [];
_resBuilding_list = [];
_indmiBuilding_list = [];

{
	switch (true) do {
		case (_x select 1 == 0): { [_comBuilding_list, _x select 0] call BIS_fnc_arrayPush };
		case (_x select 1 == 1): { [_milBuilding_list, _x select 0] call BIS_fnc_arrayPush };
		case (_x select 1 == 2): { [_indmaBuilding_list, _x select 0] call BIS_fnc_arrayPush };
		case (_x select 1 == 3): { [_medBuilding_list, _x select 0] call BIS_fnc_arrayPush };
		case (_x select 1 == 4): { [_resBuilding_list, _x select 0] call BIS_fnc_arrayPush };
		case (_x select 1 == 5): { [_indmiBuilding_list, _x select 0] call BIS_fnc_arrayPush };
		default { [_resBuilding_list, _x select 0] call BIS_fnc_arrayPush };
	};
} forEach VehicleBuildingtypes_list;
*/

private ["_isWater","_spawnpos","_counter","_townname","_tradius","_pos","_vehammount","_minrad","_maxrad","_lcounter","_spawnedVehicles","_createRandomVehicle","_angleIncr","_langle","_lpos","_building","_buildingPos","_vehType","_buildingType"];
_tradius = 0;
_townname = "debug";
_counter = 1;
_vehammount = 0;
_minrad = 0;
_maxrad = 0;
_lcounter = 0;

_spawnedVehicles = [];

_createRandomVehicle =
{
	private ["_pos", "_minrad", "_maxrad", "_counter", "_vehicleType", "_mindist","_vehType","_building"];
	_pos = _this select 0;
	_minrad = 0;
	_maxrad = 20;
	_counter = _this select 3;
	_vehType = _this select 4;
	_building = _this select 5;
	
	switch (true) do
	{
		case (_vehType == 0): { _vehicleType = comVehicles call BIS_fnc_selectRandom };
		case (_vehType == 1): { _vehicleType = milVehicles call BIS_fnc_selectRandom };
		case (_vehType == 2): { _vehicleType = indmaVehicles call BIS_fnc_selectRandom };
		case (_vehType == 3): { _vehicleType = medVehicles call BIS_fnc_selectRandom };
		case (_vehType == 4): { _vehicleType = resVehicles call BIS_fnc_selectRandom };
		case (_vehType == 5): { _vehicleType = indmiVehicles call BIS_fnc_selectRandom };
		default           { _vehicleType = resVehicles call BIS_fnc_selectRandom };
	};
	
	if (_vehicleType isKindOf "Quadbike_01_base_F") then {
		_mindist = 1.5;
	} else {
		_mindist = 4;
	};
	
	_spawnpos = [_pos, _minrad, _maxrad, _mindist, 0, 60*(pi/180), 0, _vehicleType] call findSafePos;
	diag_log format["WASTELAND - [%4] Spawning vehicle type %1 (Class: %2) at %3(%5)",_vehType,_vehicleType,_spawnpos,_counter,_building];
	[_spawnpos, _vehicleType] call vehicleCreation;
	
	//diag_log format ["Vehicle spawn #%1 done", _counter];
};

_pos = getMarkerPos ("mapMiddle");
_tradius = 16000;
_townname = "Map Middle";
_vehammount = maxVehicleSpawn - objectCountVehicles; // Total amount of vehicles to spawn.
_minrad = 0;
_maxrad = (random _tradius) + 1;

while {_lcounter < _vehammount} do
{
	_langle = random 360;
	_maxrad = (random _tradius);
	_lpos = [_pos, [[_maxrad, 0, 0], _langle] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd;
	_isWater= surfaceIsWater _lpos;
	if (!_isWater) then {
		_building = nearestBuilding _lpos;
		_buildingPos = position _building;
		switch (true) do {
			case (count nearestobjects [_buildingPos, comBuildings_list, 20] > 0): { _vehType = 0 };
			case (count nearestobjects [_buildingPos, milBuildings_list, 20] > 0): { _vehType = 1 };
			case (count nearestobjects [_buildingPos, indmaBuildings_list, 20] > 0): { _vehType = 2 };
			case (count nearestobjects [_buildingPos, medBuildings_list, 20] > 0): { _vehType = 3 };
			case (count nearestobjects [_buildingPos, resBuildings_list, 20] > 0): { _vehType = 4 };
			case (count nearestobjects [_buildingPos, indmiBuildings_list, 20] > 0): { _vehType = 5 };
			default { _vehType = 4 };
		};		
		_spawnedVehicles set [count _spawnedVehicles, [_buildingPos, _minrad, _maxrad, _counter, _vehType, _building] spawn _createRandomVehicle];
		_counter = _counter + 1;
		_lcounter = _lcounter + 1;
	} else {
		diag_log format["WASTELAND - Vehicle Spawning. Position %1 is water, recalculating",_lpos];
	};
};	
//diag_log format["WASTELAND DEBUG - spawned %1 Vehicles in: %2",_lcounter,_townname];
_lcounter = 0;

{
	diag_log format ["Waiting vehicle spawn #%1", _forEachIndex + 1];
	waitUntil {scriptDone _x};
} forEach _spawnedVehicles;

diag_log format["WASTELAND - Vehicle spawning completed - %1 Vehicles Spawned on Altis",_counter - 1];
