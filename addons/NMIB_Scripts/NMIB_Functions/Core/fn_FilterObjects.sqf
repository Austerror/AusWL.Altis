_Objs = _this select 0;
_Type = _this select 1;

_FilterdObjs = [];
{
	_Obj = _x;
	_CN = typeOf _Obj;
	_ModuleType = (getNumber (configFile >> 'CfgVehicles' >> _CN >> 'iBuild_ModuleType'));
	if (_ModuleType == _Type) then {_FilterdObjs = _FilterdObjs + [_Obj]};		
} forEach _Objs;

_FilterdObjs