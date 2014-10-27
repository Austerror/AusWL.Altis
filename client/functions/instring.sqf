// place this nect lin in init.sqf
//FNC_instring = compile preprocessFileLineNumbers "instring.sqf";
//
// save file as instring.sqf
//
// ret=[array,"search"] call FNC_instring // ret = true/false

private ["_count","_inc","_word","_found2","_find","_array"];
_find = "";
_count = 0;
_inc = 0;
_word = "";
_found2 = false;
_array = _this select 0; // All nearby objects
_sizearray = count _array;

_find = _this select 1; // find

//diag_log format ["Instring: _find = %1", _find];

_i = 0;
{
	_word = _array select _i;
	
	//diag_log format ["Instring: _word = %1", _word];
	
	_i = _i + 1;
	
	
	_found2 = [_find, _word] call FNC_instring2;
	
	//diag_log format ["Instring: match = %1", _found2];
	
	if (_found2) exitWith {_found2};
	
	
	if ((_i - 1) >= _sizearray) exitWith {};
	
	
}forEach _array;

_found2;
