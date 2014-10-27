//ARMA3Alpha function LV_fnc_fullVehicle v1.1 - by SPUn / lostvar
//Spawns random vehicle full of random units and returns driver 
private ["_BLUhq","_BLUgrp","_veh","_grp","_OPFhq","_OPFgrp","_man1","_man","_i","_pos","_side","_BLUveh","_OPFveh","_INDveh","_men","_veh1","_vehSpots","_pos1","_vehicle","_vCrew","_allUnitsArray","_crew","_driver"];
_pos = _this select 0;
_side = _this select 1;

_veh = ["B_Boat_Transport_01_F","B_SDV_01_F","B_Lifeboat","B_Boat_Armed_01_minigun_F"];
_men = ["C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F"];
_CIVgrp = createGroup civilian;
switch(_side)do{
	case 0:{
		_BLUgrp = createGroup civilian;
		_grp = _BLUgrp;
	};
	case 1:{
		_OPFgrp = createGroup east;
		_grp = _OPFgrp;
	};
	case 2:{
		_INDgrp = createGroup independent;
		_grp = _INDgrp;
	};
};


_veh1 = _veh select (floor(random(count _veh)));
_vehSpots = getNumber (configFile >> "CfgVehicles" >> _veh1 >> "transportSoldier");

_pos1 = _pos; 

_vehicle = createVehicle [_veh1, _pos1, [], 0, "NONE"];
_vehicle setPos _pos1;

_vCrew = [_vehicle, _grp] call BIS_fnc_spawnCrew;
//_allUnitsArray set [(count _allUnitsArray), _vehicle];
_crew = crew _vehicle;
{
	[_x] joinSilent _grp;
	_x call LV_ReGear;
	_x addEventHandler ["Killed", {_this call LV_Killed; (_this select 1) call removeNegativeScore}];

} forEach _crew;

if(_vehSpots > 0)then{
	_i = 1; 
	for "_i" from 1 to _vehSpots do {
		_man1 = _men select (floor(random(count _men)));
		_man = _CIVgrp createUnit [_man1, _pos1, [], 0, "NONE"];
		
		_man addEventHandler ["Killed",
		{
			_deadNPC = _this select 0;
			_npcKiller = _this select 1;
			_moneydrop = [5,10,15,20,25,30,35,40,45,50];
			_m = createVehicle ["Land_Money_F", _deadNPC call fn_getPos3D, [], 0.5, "CAN_COLLIDE"];
			_m setVariable ["cmoney", (_moneydrop call BIS_fnc_selectRandom), true];
			_m setVariable ["owner", "world", true];
		}];
		_man call LV_ReGear;

		[_man] joinSilent _grp;		
		
		_man moveInCargo _vehicle;
		sleep 0.3 ;
	};
};

_driver = driver _vehicle;
_driver

