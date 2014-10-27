_IntersectedObjsArray = [];

{
	_StartPos = _x select 0;
	_EndPos = _x select 1;
	
	_IntersectedObjs = lineIntersectsWith [_StartPos, _EndPos, player, NMIB_ModuleGhost, true];
	
	_FilteredObjsArray = [];
	{
		_FilteredObjs = [_IntersectedObjs,_x] call NMIB_fnc_FilterObjects;
		_FilteredObjsArray = _FilteredObjsArray + _FilteredObjs;
	} forEach (_x select 2);
	
	_IntersectedObjsArray = _IntersectedObjsArray + [_FilteredObjsArray];
} forEach _this;

_IntersectedObjsArray