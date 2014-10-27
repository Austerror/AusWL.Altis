/*
*/
_BlockSize = 5;

_Ghost = NMIB_ModuleGhost;

_GhostPosASL = getPosASL _Ghost;

_State = NMIB_StateBad;

//Check for existing foundation
_Apos = [_GhostPosASL select 0,_GhostPosASL select 1,(_GhostPosASL select 2)];
_Bpos = [_GhostPosASL select 0,_GhostPosASL select 1,(_GhostPosASL select 2)-2.8];
_Intersected = [[_Apos,_Bpos,[2,9]]] call NMIB_fnc_ModuleCheck; // Floora & Ramps
_Obstructions = (_Intersected select 0);

if (count _Obstructions == 0) then
{
	// Position is free
	
	_NMIB_DiagDist = (((sqrt 2)*_BlockSize)/2);
	
	// Check for support walls
	_WallsCount = 0;
	{
		_Apos = [(_GhostPosASL select 0)+(_NMIB_DiagDist)*sin((getDir _Ghost)+_x),(_GhostPosASL select 1)+(_NMIB_DiagDist)*cos((getDir _Ghost)+_x),_GhostPosASL select 2];
		_Bpos = [_Apos select 0,_Apos select 1,(_Apos select 2)-3];
		_Intersected = [[_Bpos,_Apos,[3]]] call NMIB_fnc_ModuleCheck;
		_Walls = (_Intersected select 0);		
		
		_WallsCount = _WallsCount + (count _Walls);
	} forEach [45,135,225,315];
	
	// Check for optional support floors
	_FloorsCountNS = 0;
	_FloorsCountEW = 0;
	{
		_Apos = _GhostPosASL;
		_Bpos = [(_GhostPosASL select 0)+(6)*sin((getDir _Ghost)+_x),(_GhostPosASL select 1)+(6)*cos((getDir _Ghost)+_x),_GhostPosASL select 2];
		_Intersected = [[_Apos,_Bpos,[2]]] call NMIB_fnc_ModuleCheck;
		_Floors = (_Intersected select 0);
		
		_FloorsCountNS = _FloorsCountNS + (count _Floors);
	} forEach [0,180];
	{
		_Apos = _GhostPosASL;
		_Bpos = [(_GhostPosASL select 0)+(6)*sin((getDir _Ghost)+_x),(_GhostPosASL select 1)+(6)*cos((getDir _Ghost)+_x),_GhostPosASL select 2];
		_Intersected = [[_Apos,_Bpos,[2]]] call NMIB_fnc_ModuleCheck;
		_Floors = (_Intersected select 0);
		
		_FloorsCountEW = _FloorsCountEW + (count _Floors);
	} forEach [90,270];
	
	_Apos = [_GhostPosASL select 0,_GhostPosASL select 1,(_GhostPosASL select 2)-3.1];
	_Bpos = _GhostPosASL;
	_Intersected = [[_Apos,_Bpos,[2]]] call NMIB_fnc_ModuleCheck;
	_Foundations = (_Intersected select 1);
	
	if (_WallsCount >= 2) exitWith {_State = NMIB_StateGood};
	if (_WallsCount == 1 && (_FloorsCountNS + _FloorsCountEW) >= 2) exitWith {_State = NMIB_StateGood};
	if (_WallsCount == 0 && _FloorsCountNS == 2 || _FloorsCountEW == 2) exitWith {_State = NMIB_StateGood};
	if (_WallsCount == 0 && (_FloorsCountNS + _FloorsCountEW) >= 2 && (count _Foundations) != 0) exitWith {_State = NMIB_StateGood};
} else {
	// Position is taken
	
	_State = NMIB_StateBad;
};

if (str(_State) == str(NMIB_StateGood) && NMIB_BuildTime > 0) exitWith {}; // No change detected so skip state update.

NMIB_State = _State;