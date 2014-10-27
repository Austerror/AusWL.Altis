//if (str(NMIB_State) == str(NMIB_StateBuilt)) exitWith {}; // Skip check if module is already built

_Ghost = NMIB_ModuleGhost;
_GhostPosASL = getPosASL _Ghost;

_CentreStart = [(_GhostPosASL select 0)+(2.5)*sin(getDir _Ghost),(_GhostPosASL select 1)+(2.5)*cos(getDir _Ghost),(_GhostPosASL select 2)+0.3];
_CentreEnd = [_CentreStart select 0,_CentreStart select 1,(_CentreStart select 2)+3-0.4];

_LeftStart = [(_CentreStart select 0)+(2.5)*sin((getDir _Ghost)-90),(_CentreStart select 1)+(2.5)*cos((getDir _Ghost)-90),_CentreStart select 2];
_LeftEnd = [_LeftStart select 0,_LeftStart select 1,(_CentreEnd select 2)];

_RightStart = [(_CentreStart select 0)+(2.5)*sin((getDir _Ghost)+90),(_CentreStart select 1)+(2.5)*cos((getDir _Ghost)+90),_CentreStart select 2];
_RightEnd = [_RightStart select 0,_RightStart select 1,(_CentreEnd select 2)];	

_PillarsCentre = lineIntersectsWith [_CentreStart, _CentreEnd, player, _Ghost, true];
_PillarsLeft = lineIntersectsWith [_LeftStart, _LeftEnd, player, _Ghost, true];
_PillarsRight = lineIntersectsWith [_RightStart, _RightEnd, player, _Ghost, true];

_PillarsCentre = [_PillarsCentre,3] call NMIB_fnc_FilterObjects;
_PillarsLeft = [_PillarsLeft,3] call NMIB_fnc_FilterObjects;
_PillarsRight = [_PillarsRight,3] call NMIB_fnc_FilterObjects;

_CentreCol = switch (count _PillarsCentre) do
{
	case 0:{[1,0.75,0,0.5]};
	default {[0,0,0,0]};
};	
_LeftCol = switch (count _PillarsLeft) do
{
	case 0: {[1,0,0,1]};
	default {[0,1,0,1]};
};	
_RightCol = switch (count _PillarsRight) do
{
	case 0: {[1,0,0,1]};
	default {[0,1,0,1]};
};

_ModuleVariations = (getArray (configFile >> 'CfgVehicles' >> (NMIB_SetName+'_'+NMIB_ModuleCN) >> 'iBuild_Variations'));

_GhostA = (getText (configFile >> 'CfgVehicles' >> (NMIB_SetName+'_'+(_ModuleVariations select 0)) >> 'iBuild_GhostCN'));
_GhostB = (getText (configFile >> 'CfgVehicles' >> (NMIB_SetName+'_'+(_ModuleVariations select 1)) >> 'iBuild_GhostCN'));
_GhostC = (getText (configFile >> 'CfgVehicles' >> (NMIB_SetName+'_'+(_ModuleVariations select 2)) >> 'iBuild_GhostCN'));		
_GhostD = (getText (configFile >> 'CfgVehicles' >> (NMIB_SetName+'_'+(_ModuleVariations select 3)) >> 'iBuild_GhostCN'));		

_WallState = switch true do
{
	case (str(_CentreCol) == str([0,0,0,0])):
	{
		//A
		[_GhostA,NMIB_StateBad,(_ModuleVariations select 0)];			
	};	
	case (str(_LeftCol) != str([0,1,0,1]) && str(_RightCol) != str([0,1,0,1])):
	{
		//A
		[_GhostA,NMIB_StateGood,(_ModuleVariations select 0)];			
	};
	case (str(_LeftCol) == str([0,1,0,1]) && str(_RightCol) != str([0,1,0,1])):
	{
		//B
		[_GhostB,NMIB_StateGood,(_ModuleVariations select 1)];	
	};	
	case (str(_LeftCol) == str([0,1,0,1]) && str(_RightCol) == str([0,1,0,1])):
	{
		//C
		[_GhostC,NMIB_StateGood,(_ModuleVariations select 2)];
	};
	case (str(_LeftCol) != str([0,1,0,1]) && str(_RightCol) == str([0,1,0,1])):
	{
		//D
		[_GhostD,NMIB_StateGood,(_ModuleVariations select 3)];	
	};
};

_GhostCN = (_WallState select 0);
_GhostColour = (_WallState select 1);
_ModuleCN = (_WallState select 2);
NMIB_ModuleCN = _ModuleCN;

//Check for support wall or floor
_A = [(_GhostPosASL select 0)+(2.4)*sin(getDir _Ghost),(_GhostPosASL select 1)+(2.4)*cos(getDir _Ghost),(_GhostPosASL select 2)+0.5];
_B = [(_GhostPosASL select 0)+(2.4)*sin(getDir _Ghost),(_GhostPosASL select 1)+(2.4)*cos(getDir _Ghost),(_GhostPosASL select 2)-0.5];

_C = [(_GhostPosASL select 0)+(2.6)*sin(getDir _Ghost),(_GhostPosASL select 1)+(2.6)*cos(getDir _Ghost),(_GhostPosASL select 2)+0.5];
_D = [(_GhostPosASL select 0)+(2.6)*sin(getDir _Ghost),(_GhostPosASL select 1)+(2.6)*cos(getDir _Ghost),(_GhostPosASL select 2)-0.5];

_CentreSupports = 0;
{
	_E = _x select 0;
	_F = _x select 1;
	
	_CentreSupport = lineIntersectsWith [_E, _F, player, _Ghost, true];
	_Foundations = [_CentreSupport,1] call NMIB_fnc_FilterObjects;
	_Floors = [_CentreSupport,2] call NMIB_fnc_FilterObjects;
	_Walls = [_CentreSupport,3] call NMIB_fnc_FilterObjects;
	
	_CentreSupports = (_CentreSupports+(count _Foundations)+(count _Floors)+(count _Walls));
} forEach [[_A,_B],[_C,_D]];

if (_CentreSupports == 0) then {_GhostColour = NMIB_StateBad};

if (typeOf _Ghost != _GhostCN) then
{
	deleteVehicle _Ghost;
	_Ghost = _GhostCN createVehicleLocal [0,0,0];
	_Ghost setVectorUp [0,0,1];
	NMIB_ModuleGhost = _Ghost;
};

if (str(_GhostColour) == str(NMIB_StateGood) && NMIB_BuildTime > 0) exitWith {}; // No change detected so skip state update.

NMIB_State = _GhostColour;

/* //drawLine3D [ASLToATL _CentreStart,ASLToATL _CentreEnd, [1,0,0,1]];
drawIcon3D ["", [1,0,0,1], ASLToATL _CentreStart, 0.15, 0.15, 0, "Start", 0, 0.05, "PuristaLight"];
drawIcon3D ["", [1,0,0,1], ASLToATL _CentreEnd, 0.15, 0.15, 0, "Start", 0, 0.05, "PuristaLight"];

//drawLine3D [ASLToATL _LeftStart,ASLToATL _LeftEnd, _LeftCol];
drawIcon3D ["", _LeftCol, ASLToATL _LeftStart, 0.15, 0.15, 0, "LeftStart", 0, 0.05, "PuristaLight"];
drawIcon3D ["", _LeftCol, ASLToATL _LeftEnd, 0.15, 0.15, 0, "LeftEnd", 0, 0.05, "PuristaLight"];

//drawLine3D [ASLToATL _RightStart,ASLToATL _RightEnd, _RightCol];
drawIcon3D ["", _RightCol, ASLToATL _RightStart, 0.15, 0.15, 0, "RightStart", 0, 0.05, "PuristaLight"];
drawIcon3D ["", _RightCol, ASLToATL _RightEnd, 0.15, 0.15, 0, "RightEnd", 0, 0.05, "PuristaLight"]; */