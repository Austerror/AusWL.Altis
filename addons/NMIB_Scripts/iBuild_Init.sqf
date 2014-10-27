if (!isDedicated) then
{
	// NMIB Functions
	// HUD
	NMIB_fnc_UpdateHUD = "addons\NMIB_Scripts\NMIB_Functions\HUD\fn_UpdateHUD.sqf" call mf_compile;
	// Controls
	NMIB_fnc_ConstructModule = "addons\NMIB_Scripts\NMIB_Functions\Controls\fn_ConstructModule.sqf" call mf_compile;
	NMIB_fnc_KeyDown = "addons\NMIB_Scripts\NMIB_Functions\Controls\fn_KeyDown.sqf" call mf_compile;
	NMIB_fnc_KeyUp = "addons\NMIB_Scripts\NMIB_Functions\Controls\fn_KeyUp.sqf" call mf_compile;
	NMIB_fnc_SelectModule = "addons\NMIB_Scripts\NMIB_Functions\Controls\fn_SelectModule.sqf" call mf_compile;
	// NMIB Core
	NMIB_fnc_FilterObjects = "addons\NMIB_Scripts\NMIB_Functions\Core\fn_FilterObjects.sqf" call mf_compile;
	NMIB_fnc_GridSnapMechanic = "addons\NMIB_Scripts\NMIB_Functions\Core\fn_GridSnapMechanic.sqf" call mf_compile;
	NMIB_fnc_ModuleCheck = "addons\NMIB_Scripts\NMIB_Functions\Core\fn_ModuleCheck.sqf" call mf_compile;
	NMIB_fnc_NearestFoundation = "addons\NMIB_Scripts\NMIB_Functions\Core\fn_NearestFoundation.sqf" call mf_compile;
	NMIB_fnc_SnapDirection = "addons\NMIB_Scripts\NMIB_Functions\Core\fn_SnapDirection.sqf" call mf_compile;
	NMIB_fnc_UpdateGhostCol = "addons\NMIB_Scripts\NMIB_Functions\Core\fn_UpdateGhostCol.sqf" call mf_compile;
	// NMIB RuleSets
	NMIB_fnc_ElevationRules = "addons\NMIB_Scripts\NMIB_Functions\RuleSets\fn_ElevationRules.sqf" call mf_compile;
	NMIB_fnc_FloorRules = "addons\NMIB_Scripts\NMIB_Functions\RuleSets\fn_FloorRules.sqf" call mf_compile;
	NMIB_fnc_FoundationRules = "addons\NMIB_Scripts\NMIB_Functions\RuleSets\fn_FoundationRules.sqf" call mf_compile;
	NMIB_fnc_WallRules = "addons\NMIB_Scripts\NMIB_Functions\RuleSets\fn_WallRules.sqf" call mf_compile;
	
	
	execVM 'addons\NMIB_Scripts\NMIB_Controls\NMIB_ControlsInit.sqf';
//"NMIB_ModuleCN = Foundation, NMIB_WallSide = any, NMIB_State = [0.5,0.5,0.5,0.5], NMIB_GridSlotPos = any, NMIB_TargetModule = any"
	// iBuild Module Set
	NMIB_SetName = 'iBuild';

	// Core vars
	NMIB_iBuildEnabled = false;
	NMIB_GridSlotPos = nil;
	NMIB_NearestFoundation = nil;

	// Selected Module vars
	NMIB_ModuleType = nil;
	NMIB_ModuleGhost = nil;
	NMIB_ModuleCN = '';
	NMIB_ModuleName = nil;

	// State vars
	NMIB_State = [0,0,0,0];
	NMIB_StateGood = [0.5,0.5,0.5,0.5];
	NMIB_StateBad = [1,0.4,0.4,0.5];
	NMIB_StateBuild = [0.25,0.75,1,0.5];
	NMIB_StateBuilt = [0,0,0,0];

	// Build vars
	NMIB_BuildTime = 0;
	NMIB_BuildProgress = 0;
	NMIB_BuildDuration = 1;
	NMIB_InitiatedPos = nil;

	addMissionEventHandler ["Draw3D",
	{
		//Clean up when iBuild is disabled or Player is deceased
		if (!NMIB_iBuildEnabled || !alive player) exitWith {deleteVehicle NMIB_ModuleGhost;NMIB_iBuildEnabled = false;};
		
		//Display iBuild UI
		titleRsc ["NMIB_HUD","PLAIN"];

		// Update HUD info
		call NMIB_fnc_UpdateHUD;
		
		// Execute if not building module
		if (NMIB_BuildTime == 0) then
		{	
			call NMIB_fnc_NearestFoundation;
			
			//Start foundation free placement if no foundation was found
			if (isNil ('NMIB_GridSlotPos') && NMIB_ModuleType == "Foundation") then
			{
				//Foundation
				_PlayerPos = getPosASL player;
				_GhostPosASL = [(_PlayerPos select 0)+(6)*sin(getDir player),(_PlayerPos select 1)+(6)*cos(getDir player),0];
				_GhostDir = (getDir player);
				
				NMIB_ModuleGhost setDir _GhostDir;
				NMIB_ModuleGhost setPosASL _GhostPosASL;

				_NMP_DiagDist = (((sqrt 2)*5)/2);				
 				_LowestHeight = 0;
				{
					_Position = ASLToATL [(_GhostPosASL select 0)+(_NMP_DiagDist)*sin(_GhostDir+_x),(_GhostPosASL select 1)+(_NMP_DiagDist)*cos(_GhostDir+_x),_GhostPosASL select 2];
					
					_CurrentHeight = (_Position select 2);
					if (_CurrentHeight < _LowestHeight) then {_LowestHeight = _CurrentHeight};
				} forEach [45,135,225,315];
				
				if (surfaceIsWater _GhostPosASL) then
				{
					NMIB_ModuleGhost setPosASL [_GhostPosASL select 0,_GhostPosASL select 1,0.5];
				} else {
					NMIB_ModuleGhost setPosASL [_GhostPosASL select 0,_GhostPosASL select 1,(_GhostPosASL select 2) + 0.2 + (-_LowestHeight)];
				};		
				NMIB_ModuleGhost setDir (getDir player);
			} else {
				//Grid snapping configuration
				_ModuleSQRT = 5;
				_ModuleHeight = 3;

				//Start grid snapping mechanic and store grid location
				_NMP_Positions = [NMIB_GridSlotPos,_ModuleSQRT,_ModuleHeight,NMIB_NearestFoundation,NMIB_ModuleGhost] call NMIB_fnc_GridSnapMechanic;
				_NMP_GridPositions = (_NMP_Positions select 0);
				NMIB_GridSlotPos = (_NMP_Positions select 1);
				
				//Make module ghost snap to direction of player
				[NMIB_ModuleCN,player,NMIB_ModuleGhost] call NMIB_fnc_SnapDirection;
			};
		} else {
			// Constructing Module
			if (NMIB_BuildProgress < 1) then {NMIB_BuildProgress = 1-(((NMIB_BuildTime - time) * 100 / NMIB_BuildDuration)-((NMIB_BuildTime - time) * 100 / NMIB_BuildDuration)%1)/100};
		};
		
		// Skip check if module is already built
		if (str(NMIB_State) != str(NMIB_StateBuilt)) then
		{
			//Determine module rules based on module type
			switch NMIB_ModuleType do
			{
				case ("Foundation"):
				{
					//Foundations
					call NMIB_fnc_FoundationRules;
				};
				case ("Floor"):
				{
					//Floors
					call NMIB_fnc_FloorRules;
				};	
				case ("Wall"):
				{
					//Walls
					call NMIB_fnc_WallRules;
				};
				case ("Elevation"):
				{
					//Elevation
					call NMIB_fnc_ElevationRules;
				};		
			};
		};
		call NMIB_fnc_UpdateGhostCol;
	}];

};