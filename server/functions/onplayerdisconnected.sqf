_id = _this select 0; 
_pname = _this select 1; 
_puid  = _this select 2;

_isAlive = player getVariable ["isAlive", 0];
if (_isAlive == 1) then {
	deleteVehicle player;
};

/*
call cleanNearItems;

cleanNearItems = {	
	if (_pname != "__SERVER__") then {
		
		_player = objNull;
		{
			if (getPlayerUID _x == _puid) exitWith
			{
				deleteVehicle _x;
			};
		} forEach playableUnits;
	};
};

*/