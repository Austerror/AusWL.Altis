_Ghost = NMIB_ModuleGhost;
_GhostPosASL = getPosASL _Ghost;
_State = NMIB_StateGood;

// Check that no player is in construction area.
_Obstructions = switch NMIB_ModuleType do
{
	case ("Foundation"):
	{
		//Foundations
		count nearestObjects [NMIB_ModuleGhost, ["man"], 3.5];
	};
	default
	{
		0;
	};
};

//Check for existing foundation
_Apos = [_GhostPosASL select 0,_GhostPosASL select 1,(_GhostPosASL select 2)+10];
_Bpos = [_GhostPosASL select 0,_GhostPosASL select 1,(_GhostPosASL select 2)-10];
_Intersected = [[_Apos,_Bpos,[1]]] call NMIB_fnc_ModuleCheck;
_Foundations = (_Intersected select 0);

if (count _Foundations == 0 && _Obstructions == 0) then
{
	_BlockSize = 5;
	
	_NMIB_DiagDist = (((sqrt 2)*_BlockSize)/2);
	{
		_CornerTop = [(_GhostPosASL select 0)+(_NMIB_DiagDist)*sin((getDir _Ghost)+_x),(_GhostPosASL select 1)+(_NMIB_DiagDist)*cos((getDir _Ghost)+_x),_GhostPosASL select 2];
		_CornerBottom = [_CornerTop select 0,_CornerTop select 1,(_CornerTop select 2)-(((boundingBox NMIB_ModuleGhost select 1) select 2)*2)];
		
		_CornerTopHeight = ((ASLToATL _CornerTop) select 2);
		_CornerTopBottom = ((ASLToATL _CornerBottom) select 2);
		
		if (_CornerTopHeight < 0 || _CornerTopBottom > 0) exitWith
		{
			_State = NMIB_StateBad;
		};
	} forEach [45,135,225,315];
} else {
	_State = NMIB_StateBad;
};

if (str(_State) == str(NMIB_StateGood) && NMIB_BuildTime > 0) exitWith {}; // No change detected so skip state update.

NMIB_State = _State;