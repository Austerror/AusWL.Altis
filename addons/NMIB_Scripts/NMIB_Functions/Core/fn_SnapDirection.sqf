_ModuleClass = _this select 0;
_Unit = _this select 1;
_Ghost = _this select 2;

_PlayerDir = (getDir Player);
_GhostDir = (getDir _Ghost);
_FoundationDir = (getDir NMIB_NearestFoundation);

_Ghost setDir _FoundationDir;

if (_ModuleClass in ["Foundation","Floor"]) exitWith {};

_DirDifference = _PlayerDir - _FoundationDir;
if (_DirDifference < -180) then {_DirDifference = _DirDifference + 360};
if (_DirDifference > 180) then {_DirDifference = _DirDifference - 360};

if (_DirDifference > 45 && _DirDifference < 135) then {_Ghost setDir (_FoundationDir + 90)};
if (_DirDifference < -45 && _DirDifference > -135) then {_Ghost setDir (_FoundationDir - 90)};
if (_DirDifference > 135 || _DirDifference < -135) then {_Ghost setDir (_FoundationDir + 180)};