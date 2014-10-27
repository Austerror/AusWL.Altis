//if (str(NMIB_State) == str(NMIB_StateBuilt)) exitWith {}; // Skip check if module is already built

_Ghost = NMIB_ModuleGhost;
_GhostPosASL = getPosASL _Ghost;
_State = nil;

//_Start = [(_GhostPosASL select 0)+(2.5)*sin(getDir Ghost - 90),(_GhostPosASL select 1)+(2.5)*cos(getDir Ghost - 90),(_GhostPosASL select 2)];
_Apos = [(_GhostPosASL select 0),(_GhostPosASL select 1),(_GhostPosASL select 2)+0.1];
_Bpos = [(_Apos select 0),(_Apos select 1),(_Apos select 2)+3];
_Intersected = [[_Apos,_Bpos,[2,9]]] call NMIB_fnc_ModuleCheck;
_Ramps = (_Intersected select 0);

if (count _Ramps == 0) then {_State = NMIB_StateGood} else {_State = NMIB_StateBad};

if (str(_State) == str(NMIB_StateGood) && NMIB_BuildTime > 0) exitWith {}; // No change detected so skip state update.

NMIB_State = _State;