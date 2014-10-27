_ModuleType = (getText (configFile >> 'CfgVehicles' >> (NMIB_SetName+'_'+(_this select 0)) >> 'iBuild_Type'));
_WallSide = (_this select 1);
_State = (_this select 2);
_Position = (_this select 3);
_TargetModule = (_this select 4);
diag_log format ["_ModuleType = %1, _WallSide = %2, _State = %3, _Position = %4, _TargetModule = %5",_ModuleType,_WallSide,_State,_Position,_TargetModule];
if (isNil ('NMIB_InitiatedPos')) then {NMIB_InitiatedPos = [getPos player select 0,getPos player select 1,0]};
diag_log format["NMIB_InitiatedPos = %1",NMIB_InitiatedPos];
if (([getPos player select 0,getPos player select 1,0] distance NMIB_InitiatedPos) <= 0.9 && str(_State) != str(NMIB_StateBad)) then
{
	if (_ModuleType in ['Foundation','Floor','Elevation','Wall','Roof']) then //TODO: remove statement as no longer required!
	{
		// Start build process.
		if (str(_State) == str(NMIB_StateGood) && NMIB_BuildTime == 0) then
		{
			NMIB_BuildDuration = (getNumber (configFile >> 'CfgVehicles' >> ('iBuild_'+(_this select 0)) >> 'iBuild_BuildDuration'));
			NMIB_BuildTime = time + NMIB_BuildDuration;
			NMIB_State = NMIB_StateBuild;
			//NMIB_InitiatedPos = [getPos player select 0,getPos player select 1,0];
		};
		
		// Build module
		if (str(_State) != str(NMIB_StateBuilt) && NMIB_BuildProgress == 1) then
		{
			_Block = (getText (configFile >> 'CfgVehicles' >> ('iBuild_'+(_this select 0)) >> 'iBuild_SolidCN')) createVehicle [0,0,0];
			_Block setVectorUp [0,0,1];
			_Block setDir getDir NMIB_ModuleGhost;
			_Block setPosASL (getPosASL NMIB_ModuleGhost);
			
			if (_ModuleType == 'Foundation') then {_Block say3D 'Built0'} else {_Block say3D 'Built1'};
			
			NMIB_State = NMIB_StateBuilt;
		};
	};
} else {
	// Cancel build process.
	NMIB_BuildTime = 0;
	NMIB_BuildProgress = 0;
	NMIB_State = NMIB_StateGood;
	NMIB_InitiatedPos = nil;
};