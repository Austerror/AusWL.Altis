//	@file Name: s_setupPlayerDB.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

fn_loadAccount = "persistence\players\s_loadAccount.sqf" call mf_compile;

"savePlayerData" addPublicVariableEventHandler
{
	_array = _this select 1;

	_UID = _array select 0;
	_info = _array select 1;
	_data = _array select 2;
	_player = _array select 3;

	if (!isNull _player) then
	{
		{
			[_UID call PDB_databaseNameCompiler, "PlayerInfo", _x select 0, _x select 1] call iniDB_write;
		} forEach _info;

		{
			[_UID call PDB_databaseNameCompiler, "PlayerSave", _x select 0, _x select 1] call iniDB_write;
		} forEach _data;
	};
	if (!isNull _player && !alive _player) then
	{
		_player setVariable ["isAlive", 0, true];
	};
};

"requestPlayerData" addPublicVariableEventHandler
{
	_player = _this select 1;
	_UID = getPlayerUID _player;

	if ((_UID call PDB_databaseNameCompiler) call iniDB_exists) then
	{
		private ["_name", "_type", "_section", "_value"];
		_data = [];
		_checkAlive = [];
		_checkAlive = ["IsAlive", "NUMBER"];
		_isAlive = 0;
		_name = _checkAlive select 0;
		_type = _checkAlive select 1;
		_section = [_checkAlive, 2, "PlayerSave"] call BIS_fnc_param;
		_isAlive = [_UID call PDB_databaseNameCompiler, _section, _name, _type] call iniDB_read;
		if (_isAlive == 1) then {
			applyPlayerData = _UID call fn_loadAccount;
		} else {
			_section = [["Exp", "NUMBER"], 2, "PlayerSave"] call BIS_fnc_param;
			_player setVariable ["experience", [_UID call PDB_databaseNameCompiler, _section, "Exp", "NUMBER"] call iniDB_read, true];
			_section = [["Lvl", "NUMBER"], 2, "PlayerSave"] call BIS_fnc_param;
			_player setVariable ["level", [_UID call PDB_databaseNameCompiler, _section, "Lvl", "NUMBER"] call iniDB_read, true];
			applyPlayerData = [];
		};
	}
	else
	{
		_player setVariable ["experience", 0];
		_player setVariable ["level", 0];
		applyPlayerData = [];
	};

	(owner _player) publicVariableClient "applyPlayerData";
};
