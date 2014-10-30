																																																												asaerw3rw3r4 = 1; Menu_Init_Lol = 1;
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap
//	@file Description: The main init.

#define DEBUG false

enableSaving [false, false];

currMissionDir = compileFinal str call
{
	private "_arr";
	_arr = toArray str missionConfigFile;
	_arr resize (count _arr - 15);
	toString _arr
};

X_Server = false;
X_Client = false;
X_JIP = false;

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml
if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

// Force bypass of briefing
if (!isDedicated) then {
    if (!isNumber (missionConfigFile >> "briefing")) exitWith {};
    if (getNumber (missionConfigFile >> "briefing") == 1) exitWith {};
    0 = [] spawn {
        waitUntil {
            if (getClientState == "BRIEFING READ") exitWith {true};
            if (!isNull findDisplay 53) exitWith {
                ctrlActivate (findDisplay 53 displayCtrl 1);
                findDisplay 53 closeDisplay 1;
                true
            };
            false
        };
    };
};

if (isServer) then {
	X_Server = true;
	[] execVM "custom\realTimeSync.sqf";
};

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";

if (!isDedicated) then
{
	[] spawn
	{
		if (!isNil "A3W_serverSetupComplete") then {
			9999 cutText ["Welcome to Austerror Survivor, please wait for your client to initialize", "BLACK", 0.01];
		} else {
			9999 cutText ["Welcome to Austerror Survivor, server initialisation may take a few minutes, please be patient", "BLACK", 0.01];
		};
		
		waitUntil {!isNull player};
		removeAllWeapons player;
		client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

		// Reset group & side
		[player] joinSilent createGroup playerSide;

		[] execVM "client\init.sqf";
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "WASTELAND SERVER - Initializing Server";
	[] execVM "server\init.sqf";
};

//init 3rd Party Scripts
[] execVM "infected\init.sqf";
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
[] execVM "addons\proving_Ground\init.sqf";
//[] execVM "addons\NMIB_Scripts\iBuild_Init.sqf";
//[] execVM "addons\scripts\DynamicWeatherEffects.sqf";
[] execVM "addons\JumpMF\init.sqf";