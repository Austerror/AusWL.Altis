waitUntil {!isNull (findDisplay 46)};

(findDisplay 46) displayAddEventHandler ["KeyDown","
	
	_Key = (_this select 1);
	
	_Key call NMIB_fnc_KeyDown;
"];

(findDisplay 46) displayAddEventHandler ["KeyUp","
	
	_Key = (_this select 1);

	_Key call NMIB_fnc_KeyUp;
"];

// For debugging purposes only!
(findDisplay 46) displayAddEventHandler ["MouseButtonUp","
	
	_Key = (_this select 1);

	if (_Key == 4 && str(NMIB_State) == str(NMIB_StateGood)) then
	{
		_T = (getText (configFile >> 'CfgVehicles' >> ('iBuild_'+NMIB_ModuleCN) >> 'iBuild_SolidCN')) createVehicle [0,0,0];
		_T setVectorUp [0,0,1];
		_T setDir (getDir NMIB_ModuleGhost);
		_T setPosASL (getPosASL NMIB_ModuleGhost);	
	};
"];