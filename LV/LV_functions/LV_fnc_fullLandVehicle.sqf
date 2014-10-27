//ARMA3Alpha function LV_fnc_fullLandVehicle v1.2 - by SPUn / lostvar
//Spawns random vehicle full of random units and returns driver 
private ["_BLUhq","_BLUgrp","_veh","_grp","_OPFhq","_OPFgrp","_INDhq","_INDgrp","_roads","_radius","_pos1","_man1","_man","_i","_pos","_side","_BLUveh","_OPFveh","_INDveh","_men","_veh1","_vehSpots","_roadFound","_vehicle","_vCrew","_allUnitsArray","_crew","_driver"];
_pos = _this select 0;
_side = _this select 1;

_veh = [];
_rareVeh = ["O_G_Offroad_01_armed_F"];
_uncVeh = ["RDS_S1203_Civ_03","C_Van_01_transport_F","RDS_Gaz24_Civ_03","RDS_Golf4_Civ_01","RDS_Hatchback_01_F","RDS_Ikarus_Civ_01","RDS_Ikarus_Civ_02","RDS_Octavia_Civ_01"];
_commonVeh = ["O_G_Quadbike_01_F","I_G_Offroad_01_F","O_G_Offroad_01_F","C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Kart_01_Red_F"];

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
_vehRarity = random 100;
if (_vehRarity > 90) then {
	_veh = _rareVeh;
} else {
	if (_vehRarity > 60) then {
		_veh = _uncVeh;
	} else {
		_veh = _commonVeh;
	};
};
_veh1 = _veh select (floor(random(count _veh)));
_vehSpots = floor random (getNumber (configFile >> "CfgVehicles" >> _veh1 >> "transportSoldier")) min 5;

_radius = 40;
_roads = [];
while{(count _roads) == 0}do{
	_roads = _pos nearRoads _radius;
	_radius = _radius + 10;
};
if(((_roads select 0) distance _pos)<200)then{
	_pos = getPos(_roads select 0);
	_pos1 = [_pos,0,25,5,0,1,0] call BIS_fnc_findSafePos;
}else{
	_pos1 = [_pos,0,200,5,0,1,0] call BIS_fnc_findSafePos;
};
_pos = [_pos1 select 0, _pos1 select 1, 0];

sleep 0.5;

_vehicle = createVehicle [_veh1, _pos, [], 0, "NONE"];
_vehicle setPos _pos;

_vehicle allowDamage false;
sleep 2;
if(((vectorUp _vehicle) select 2) != 0)then{ _vehicle setvectorup [0,0,0]; };
sleep 2;
_vehicle allowDamage true;
[_vehicle] call randomWeapons;
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
		_man = _CIVgrp createUnit [_man1, _pos, [], 0.2, "NONE"];
		_man addEventHandler ["Killed",
		{
			_this call LV_Killed;
			(_this select 1) call removeNegativeScore;
			//_deadNPC = _this select 0;
			//_npcKiller = _this select 1;
		}];
		_man call LV_ReGear;

		[_man] joinSilent _grp;
		
		_man moveInCargo _vehicle;
		sleep 0.3;
	};
};

_driver = driver _vehicle;
_driver