_Key = _this;

if (_Key in [41]) then
{
	NMIB_iBuildEnabled = !NMIB_iBuildEnabled;
	
	NMIB_GridSlotPos = nil;
	NMIB_NearestFoundation = nil;
	NMIB_ModuleType = nil;
	NMIB_ModuleCN = '';
	NMIB_ModuleName = nil;
	NMIB_BuildTime = 0;
	NMIB_BuildProgress = 0;
	NMIB_State = [0,0,0,0];
};

if (NMIB_iBuildEnabled) then
{	
	if (_Key in [15]) then
	{
		NMIB_BuildTime = 0;
		NMIB_BuildProgress = 0;
		NMIB_State = NMIB_StateGood;
		true
	};
};