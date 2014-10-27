//	@file Version: 1.1
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Description: The server init.
//	@file Args:

if (!isServer) exitWith {};
/*
"playableUnitOccupier_PV" addPublicVariableEventHandler { 
	private "_playableUnit"; 
	_playableUnit = [_this,1,objNull] call BIS_fnc_param; 
	if(!isNull _playableUnit) then  
	{ 
		missionNamespace setVariable[getPlayerUID _playableUnit,_playableUnit]; 
	};  
};
["deleteBodyOnPlayerDisccndId", "onPlayerDisconnected", { 
   private "_body"; 
   _body = missionNamespace getVariable [_uid,objNull]; 
   if (!isNull _body) then  
   { 
	   deleteVehicle _body;
	   missionNamespace setVariable[_uid,nil];
   }; 
}] call BIS_fnc_addStackedEventHandler; 
*/

onPlayerDisconnected {
	diag_log [_id, _uid, _name];
	{
		if (getPlayerUID _x == _uid) exitWith {
			if (_x getVariable["isAlive", 0] == 1) then {
				deleteVehicle _x;
			};
		};
	} forEach playableUnits;
};

// Temp place for server repair vehicle script
"serverRepairVehicle" addPublicVariableEventHandler { 
	private ["_repairVeh", "_repairPart", "_repairPartName", "_vehicleRepPos", "_vehicleRepDir", "_repairDataRaw", "_repairData"];
	_repairDataRaw = _this select 1;
	_repairData = _repairDataRaw select 1;
	_repairVeh = _repairDataRaw select 0;
	_repairPart = _repairDataRaw select 1;
	_repairPartName = _repairPart select 0;
	_vehicleRepPos = getPos _repairVeh;
	_vehicleRepDir = getDir _repairVeh;
	_repairVeh setHitPointDamage [_repairPartName, 0];
	_repairVeh setDir _vehicleRepDir;
	_repairVeh setPos [_vehicleRepPos select 0, _vehicleRepPos select 1, 0.05];
	true;
};

externalConfigFolder = "A3Wasteland_settings";

vChecksum = compileFinal format ["'%1'", call generateKey];

//Execute Server Side Scripts.
call compile preprocessFileLineNumbers "server\antihack\setup.sqf";
[] execVM "server\admins.sqf";
[] execVM "server\functions\serverVars.sqf";
_serverCompileHandle = [] execVM "server\functions\serverCompile.sqf";
[] execVM "server\functions\broadcaster.sqf";
[] execVM "server\functions\relations.sqf";
[] execVM (externalConfigFolder + "\init.sqf");

waitUntil {scriptDone _serverCompileHandle};

// Broadcast server rules
if (loadFile (externalConfigFolder + "\serverRules.sqf") != "") then
{
	[[[call compile preprocessFileLineNumbers (externalConfigFolder + "\serverRules.sqf")], "client\functions\defineServerRules.sqf"], "BIS_fnc_execVM", true, true] call TPG_fnc_MP;
};

diag_log "WASTELAND SERVER - Server Compile Finished";

"requestCompensateNegativeScore" addPublicVariableEventHandler { (_this select 1) call removeNegativeScore };

// load default config
call compile preprocessFileLineNumbers "server\default_config.sqf";

// load external config
if (loadFile (externalConfigFolder + "\main_config.sqf") != "") then
{
    call compile preprocessFileLineNumbers (externalConfigFolder + "\main_config.sqf");
}
else
{
	diag_log format["[WARNING] A3W configuration file '%1\main_config.sqf' was not found. Using default settings!", externalConfigFolder];
	diag_log "[WARNING] For more information go to http://a3wasteland.com/";
};

A3W_showGunStoreStatus = compileFinal str A3W_showGunStoreStatus;
A3W_gunStoreIntruderWarning = compileFinal str A3W_gunStoreIntruderWarning;
A3W_combatAbortDelay = compileFinal str A3W_combatAbortDelay;

// Broadcast config variables
publicVariable "A3W_startingMoney";
publicVariable "A3W_showGunStoreStatus";
publicVariable "A3W_gunStoreIntruderWarning";
publicVariable "A3W_playerSaving";
publicVariable "A3W_combatAbortDelay";

_playerSavingOn = ["A3W_playerSaving"] call isConfigOn;
_baseSavingOn = ["A3W_baseSaving"] call isConfigOn;
_boxSavingOn = ["A3W_boxSaving"] call isConfigOn;
_warchestSavingOn = ["A3W_warchestSaving"] call isConfigOn;
_warchestMoneySavingOn = ["A3W_warchestMoneySaving"] call isConfigOn;
_beaconSavingOn = ["A3W_spawnBeaconSaving"] call isConfigOn;
_serverSavingOn = (_baseSavingOn || {_boxSavingOn} || {_warchestSavingOn} || {_warchestMoneySavingOn} || {_beaconSavingOn});

_setupPlayerDB = [] spawn {}; // blank script to feed scriptDone a non-nil value

// Do we need any persistence?
if (_playerSavingOn || {_serverSavingOn}) then
{
	// Our custom iniDB methods which fixes some issues with the current iniDB addon release
	call compile preProcessFileLineNumbers "persistence\fn_inidb_custom.sqf";
	
	_verIniDB = call iniDB_version;
	
	if (_verIniDB == "") then
	{
		diag_log "[INFO] ### ERROR ### A3W NOT running with iniDB!";
		diag_log "[INFO] ### ERROR ### Make sure iniDB.dll is in your Arma 3 folder, or otherwise that you have the @inidbi mod enabled!";
	}
	else
	{
		diag_log format ["[INFO] A3W running with iniDB v%1", _verIniDB];
	};

	// Have we got player persistence enabled?
	if (_playerSavingOn) then
	{
		_setupPlayerDB = execVM "persistence\players\s_setupPlayerDB.sqf";
	};

	// Have we got server persistence enabled?
	if (_serverSavingOn) then
	{
		_loadingDB = execVM "persistence\world\oLoad.sqf";
		diag_log "[INFO] Loading Database...";
		waitUntil {sleep 0.1; scriptDone _loadingDB};
	};
	
	diag_log format ["[INFO] A3W player saving is %1", if (_playerSavingOn) then { "ENABLED" } else { "DISABLED" }];
	diag_log format ["[INFO] A3W base saving is %1", if (_baseSavingOn) then { "ENABLED" } else { "DISABLED" }];
	diag_log format ["[INFO] A3W box saving is %1", if (_boxSavingOn) then { "ENABLED" } else { "DISABLED" }];
	diag_log format ["[INFO] A3W warchest saving is %1", if (_warchestSavingOn) then { "ENABLED" } else { "DISABLED" }];
	diag_log format ["[INFO] A3W warchest money saving is %1", if (_warchestMoneySavingOn) then { "ENABLED" } else { "DISABLED" }];
	diag_log format ["[INFO] A3W spawn beacon saving is %1", if (_beaconSavingOn) then { "ENABLED" } else { "DISABLED" }];
};

_setupPlayerDB spawn
{
	waitUntil {sleep 0.1; scriptDone _this};
	A3W_serverSetupComplete = compileFinal "true";
	publicVariable "A3W_serverSetupComplete";
};

if (!isNil "A3W_startHour" || !isNil "A3W_moonLight") then
{
	private ["_monthDay", "_startHour"];
	_monthDay = if (["A3W_moonLight"] call isConfigOn) then { 10 } else { 25 };
	_startHour = ["A3W_startHour", date select 2] call getPublicVar;
	setDate [2035, 6, _monthDay, _startHour, 0];
};
if (["A3W_buildingLoot"] call isConfigOn) then
{
	diag_log "[INFO] A3W loot spawning is ENABLED";
	fn_getBuildingstospawnLoot = "custom\Lootspawner\fn_LSgetBuildingstospawnLoot.sqf" call mf_compile; 
	LSdeleter = "custom\Lootspawner\LSdeleter.sqf" call mf_compile;
	execVM "custom\Lootspawner\Lootspawner.sqf";
};

_realTime = [] execVM "custom\realTimeSync.sqf";
waitUntil {sleep 0.1; scriptDone _realTime};

[] execVM "server\functions\serverTimeSync.sqf";

if (["A3W_serverSpawning"] call isConfigOn) then
{
    diag_log "WASTELAND SERVER - Initializing Server Spawning";
	maxHeliSpawn = 5;
	maxVehicleSpawn = 100;
	maxPlaneSpawn = 5;
	maxBoatSpawn = 15;
	if (["A3W_heliSpawning"] call isConfigOn) then
	{
		_heliSpawn = [] execVM "server\functions\staticHeliSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _heliSpawn};
	};
	
	if (["A3W_vehicleSpawning"] call isConfigOn) then
	{
		_vehSpawn = [] execVM "server\functions\vehicleSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _vehSpawn};
	};
	
	if (["A3W_planeSpawning"] call isConfigOn) then
	{
		_planeSpawn = [] execVM "server\functions\planeSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _planeSpawn};
	};
	
	if (["A3W_boatSpawning"] call isConfigOn) then
	{
		_boatSpawn = [] execVM "server\functions\boatSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _boatSpawn};
	};
	/*
	if (["A3W_baseBuilding"] call isConfigOn) then
	{
		_objSpawn = [] execVM "server\functions\objectsSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _objSpawn};
	};
	
	if (["A3W_boxSpawning"] call isConfigOn) then
	{
		_boxSpawn = [] execVM "server\functions\boxSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _boxSpawn};
	};
	*/
};

// Hooks for new players connecting, in case we need to manually update state
["A3W_onPlayerConnected", "onPlayerConnected", { [_id, _name] execVM "server\functions\onPlayerConnected.sqf" }] call BIS_fnc_addStackedEventHandler;
onPlayerDisconnected { [_id, _name, _uid] call compile preProcessFileLineNumbers "server\functions\onplayerdisconnected.sqf" };
if (count (["config_territory_markers", []] call getPublicVar) > 0) then
{
	diag_log "[INFO] A3W territory capturing is ENABLED";
	[] execVM "territory\server\monitorTerritories.sqf";
}
else
{
	diag_log "[INFO] A3W territory capturing is DISABLED";
};

//Execute Server Missions.

if (["A3W_serverMissions"] call isConfigOn) then
{
	//diag_log "WASTELAND SERVER - Initializing Missions";
    //[] execVM "server\missions\sideMissionController.sqf";
    //sleep 5;
    //[] execVM "server\missions\mainMissionController.sqf";
	//sleep 5;
	//[] execVM "server\missions\moneyMissionController.sqf";
};

// Start clean-up loop
[] execVM "server\WastelandServClean.sqf";
