_Key = _this;

_ID = _Key;

_MTSobjs = ['Foundation','Floor','Ramp','GenWallA','GenWindowA','GenDoorA'];
//_MTS = (getArray (configFile >> 'CfgVehicles' >> 'iBuild_ModuleInfo' >> 'iBuild_Modules'));
_MTS = (_MTSobjs select _ID-2);

if (NMIB_ModuleCN != _MTS) then
{	
	NMIB_ModuleCN = _MTS;
	deleteVehicle NMIB_ModuleGhost;	
	NMIB_ModuleGhost = (getText (configFile >> 'CfgVehicles' >> (NMIB_SetName+'_'+NMIB_ModuleCN) >> 'iBuild_GhostCN')) createVehicleLocal (position player);
	NMIB_State = NMIB_StateGood;

	//Get module type
	NMIB_ModuleType = (getText (configFile >> 'CfgVehicles' >> (NMIB_SetName+'_'+NMIB_ModuleCN) >> 'iBuild_Type'));
	
	// Get selected module name
	_CN = (getText (configFile >> 'CfgVehicles' >> (NMIB_SetName+'_'+NMIB_ModuleCN) >> 'iBuild_SolidCN'));
	NMIB_ModuleName = (getText (configFile >> 'CfgVehicles' >> _CN >> 'displayName'));
	
	//NMIB_ModuleGhost setObjectTexture [0,(format['#(argb,8,8,3)color(%1,%2,%3,0.25)',NMIB_State select 0,NMIB_State select 1,NMIB_State select 2])];
};