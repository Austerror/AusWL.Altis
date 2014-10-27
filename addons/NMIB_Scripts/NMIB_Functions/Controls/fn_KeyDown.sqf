_Key = _this;

// 15 should be TAB
if (_Key in [15] && NMIB_iBuildEnabled) then
{
	[NMIB_ModuleCN,NMIB_WallSide,NMIB_State,NMIB_GridSlotPos,NMIB_TargetModule] call NMIB_fnc_ConstructModule;
	diag_log format ["NMIB_ModuleCN = %1, NMIB_WallSide = %2, NMIB_State = %3, NMIB_GridSlotPos = %4, NMIB_TargetModule = %5",NMIB_ModuleCN,NMIB_WallSide,NMIB_State,NMIB_GridSlotPos,NMIB_TargetModule];
};

if (NMIB_iBuildEnabled) then
{
	if (_Key in [2,3,4,5,6,7,8,9,10]) then
	{
		if (NMIB_BuildProgress == 0) then {_Key call NMIB_fnc_SelectModule};
	};
};

if (_Key in ([41,2,3,4,5,6,7,8,9,10])) then {true}; // 41 should be `