//	@file Version: 1.2
//	@file Name: oSave.sqf
//	@file Author: [GoT] JoSchaap, AgentRev
//	@file Description: Basesaving save script

if (!isServer) exitWith {};

#include "functions.sqf"

_damagePositions =
	[
		'HitLFWheel',
		'HitLBWheel',
		'HitLMWheel',
		'HitLF2Wheel',
		'HitRFWheel',
		'HitRBWheel',
		'HitRMWheel',
		'HitRF2Wheel',
		'HitEngine',
		'HitEngine2',		// (engine #2)
		'HitEngine3',		// (engine #3)
		'HitHRotor',		// (main rotor)
		'HitVRotor',		// (tail rotor)
		'HitBatteries',		// (electrical systems)
		'HitLight',			// (landing light)
		'HitHydraulics',	// (entire hydraulics system)
		'HitTransmission',	// (engine transmission)
		'HitGear',			// (landing gear)
		'HitFuel',			// (all fuel tanks)
		'HitHStabilizerL1',	// (first left horizontal stabilizer)
		'HitHStabilizerR1',	// (first right horizontal stabilizer)
		'HitVStabilizer1',	// (first vertical stabilizer)
		'HitTail',			// (tail boom)
		'HitPitotTube',		// (all pitot tubes)
		'HitStaticPort',	// (all static ports)
		'HitStarter1',		// (starter for engine #1)
		'HitStarter2',		// (starter for engine #2)
		'HitStarter3',		// (starter for engine #3)
		'HitAvionics',
		'HitHull',
		'HitMissiles',
		'HitRGlass',
		'HitLGlass',
		'HitGlass1',
		'HitGlass2',
		'HitGlass3',
		'HitGlass4',
		'HitGlass5',
		'HitGlass6'
	];
	
_saveableObjects = [];

_isSaveable =
{
	_result = false;
	{ if (_this == _x) exitWith { _result = true } } forEach _saveableObjects;
	_result
};

// Add objectList & general store objects
{
	_index = _forEachIndex;
	
	{
		_obj = _x;
		if (_index > 0) then { _obj = _x select 1 };
		
		if (!(_obj isKindOf "ReammoBox_F") && {!(_obj call _isSaveable)}) then
		{
			[_saveableObjects, _obj] call BIS_fnc_arrayPush;
		};
	} forEach _x;
} forEach [objectList, call genObjectsArray];

_fileName = "Objects" call PDB_databaseNameCompiler;

// If file doesn't exist, create Info section at the top
if !(_fileName call iniDB_exists) then
{
	[_fileName, "Info", "ObjCount", 0] call iniDB_write;
};

while {true} do
{
	sleep 60;
	
	_oldObjCount = [_fileName, "Info", "ObjCount", "NUMBER"] call iniDB_read;
	_objCount = 0;
	{
		_obj = _x;
		
		if (alive _obj) then
		{
			_class = typeOf _obj;
			_ownerUID = _obj getVariable "ownerUID";

			if (_obj getVariable ["objectLocked", false] && {(_baseSavingOn && {_class call _isSaveable}) || {_boxSavingOn && {_obj isKindOf "ReammoBox_F"}}} || 
			   {_warchestSavingOn && {_obj call _isWarchest}} || {_beaconSavingOn && {_obj call _isBeacon}} || {!isNil "_ownerUID" && {_ownerUID != ""}} || 
			   {_obj isKindOf "Car"} || {_obj isKindOf "Tank"} || {_obj isKindOf "Air"} || {_obj isKindOf "Ship"}) then
			{
				_netId = netId _obj;
				_pos = getPosATL _obj;
				_dir = [vectorDir _obj, vectorUp _obj];
				_allowDamage = if (_obj getVariable ["allowDamage", false]) then { 1 } else { 0 };

				_indDamage = [];
				if (_obj isKindOf "AllVehicles") then {
					_class = typeOf _obj;
					_allHitPoints = [];
					_hitpointsCfg = configFile >> "CfgVehicles" >> _class >> "HitPoints";
					for[{_j = 0}, {_j < count(_hitpointsCfg)}, {_j=_j+1}] do
					{
						_hitPointCFG = _hitpointsCfg select _j;
						_allHitPoints = _allHitPoints + [configName(_hitPointCFG)];
					};
					_allowDamage = 0;
					{
						if (_x in _allHitPoints) then {
							_objectDamage = _obj getHitPointDamage _x;
							_indDamage = _indDamage + [[_x, _objectDamage]];
							_objectDamage = 0;
						};
					} forEach _damagePositions;
					//diag_log format ["Building Complete _indDamage = %1", _indDamage];
				};
				_damage = damage _obj;

				
				if (isNil {_obj getVariable "baseSaving_spawningTime"}) then
				{
					_obj setVariable ["baseSaving_spawningTime", diag_tickTime];
				};
				
				_hoursAlive = (_obj getVariable ["baseSaving_hoursAlive", 0]) + ((diag_tickTime - (_obj getVariable "baseSaving_spawningTime")) / 3600);

				_variables = [];
				
				if (_obj isKindOf "AllVehicles") then {
					[_variables, ["vehicleFuel", fuel _obj]] call BIS_fnc_arrayPush;
				};
				
				_ownerUID = _obj getVariable ["ownerUID", ""];
				if (_ownerUID != "") then
				{
					[_variables, ["ownerUID", _ownerUID]] call BIS_fnc_arrayPush;
				};
				
				_vehTex = _obj getVariable ["vehicleTexture", ""];
				if (_vehTex != "") then {
					[_variables, ["vehicleTexture", _vehTex]] call BIS_fnc_arrayPush;
				};
				
				switch (true) do
				{
					case (_obj call _isWarchest):
					{
						[_variables, ["a3w_warchest", true]] call BIS_fnc_arrayPush;
						[_variables, ["R3F_LOG_disabled", true]] call BIS_fnc_arrayPush;
						[_variables, ["side", str (_obj getVariable ["side", sideUnknown])]] call BIS_fnc_arrayPush;
					};
					case (_obj call _isBeacon):
					{
						[_variables, ["a3w_spawnBeacon", true]] call BIS_fnc_arrayPush;
						[_variables, ["R3F_LOG_disabled", true]] call BIS_fnc_arrayPush;
						[_variables, ["side", str (_obj getVariable ["side", sideUnknown])]] call BIS_fnc_arrayPush;
						//[_variables, ["ownerName", (_obj getVariable ["ownerName", "[Beacon]"]) call iniDB_Base64Encode]] call BIS_fnc_arrayPush;
						[_variables, ["ownerName", _obj getVariable ["ownerName", "[Beacon]"]]] call BIS_fnc_arrayPush;
						[_variables, ["packing", false]] call BIS_fnc_arrayPush;
						[_variables, ["groupOnly", _obj getVariable ["groupOnly", false]]] call BIS_fnc_arrayPush;
					};
				};
				
				_weapons = [];
				_magazines = [];
				_items = [];
				_backpacks = [];
				
				//if ((getNumber (configFile >> "CfgVehicles" >> _class >> "maximumLoad") > 0)) then
				//{
					// Save weapons & ammo
					_weapons = (getWeaponCargo _obj) call cargoToPairs;
					_magazines = (getMagazineCargo _obj) call cargoToPairs;
					_items = (getItemCargo _obj) call cargoToPairs;
					_backpacks = (getBackpackCargo _obj) call cargoToPairs;
				//};
				//diag_log format ["_items Build for comparison = %1", _items];
				_objCount = _objCount + 1;
				_objName = format ["Obj%1", _objCount];

				[_fileName, _objName, "Class", _class] call iniDB_write;
				[_fileName, _objName, "Position", _pos] call iniDB_write;
				[_fileName, _objName, "Direction", _dir] call iniDB_write;
				[_fileName, _objName, "HoursAlive", _hoursAlive] call iniDB_write;
				[_fileName, _objName, "Damage", _damage] call iniDB_write;
				[_fileName, _objName, "IndDamage", _indDamage] call iniDB_write;
				[_fileName, _objName, "AllowDamage", _allowDamage] call iniDB_write;
				[_fileName, _objName, "Variables", _variables] call iniDB_write;
				
				[_fileName, _objName, "Weapons", _weapons] call iniDB_write;
				[_fileName, _objName, "Magazines", _magazines] call iniDB_write;
				[_fileName, _objName, "Items", _items] call iniDB_write;
				[_fileName, _objName, "Backpacks", _backpacks] call iniDB_write;
				
				sleep 0.01;
			};
		};
	} forEach allMissionObjects "All";
	
	[_fileName, "Info", "ObjCount", _objCount] call iniDB_write;
	
	_fundsWest = 0;
	_fundsEast = 0;
	
	if (["A3W_warchestMoneySaving"] call isConfigOn) then
	{
		_fundsWest = ["pvar_warchest_funds_west", 0] call getPublicVar;
		_fundsEast = ["pvar_warchest_funds_east", 0] call getPublicVar;
	};
	
	[_fileName, "Info", "WarchestMoneyBLUFOR", _fundsWest] call iniDB_write;
	[_fileName, "Info", "WarchestMoneyOPFOR", _fundsEast] call iniDB_write;
	
	diag_log format ["A3W - %1 baseparts and objects have been saved with iniDB", _objCount];
	
	// Reverse-delete old objects
	if (_oldObjCount > _objCount) then
	{
		for [{_i = _oldObjCount}, {_i > _objCount}, {_i = _i - 1}] do
		{
			[_fileName, format ["Obj%1", _i]] call iniDB_deleteSection;
		};
	};
};
