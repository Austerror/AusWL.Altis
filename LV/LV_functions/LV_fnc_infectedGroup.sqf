//ARMA3Alpha function LV_fnc_menGroup v1.3 - by SPUn / lostvar
//Spawn infantry group and returns leader
private ["_newGroup","_BLUmen3","_OPFarrays","_BLUarrays","_INDgrp","_INDhq","_INDmen","_OPFmen2","_BLUmen2","_pos","_side","_size","_BLUmen","_OPFmen","_men","_amount","_BLUhq","_BLUgrp","_OPFhq","_OPFgrp","_grp","_i","_man1","_man","_leader","_sponser"];
_pos = _this select 0;
_side = _this select 1;
_size = _this select 2;
_grpId = if (count _this > 3) then { _this select 3;} else {nil};	
_men = ["C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F"];
_CIVgrp = createGroup civilian;
if(typeName _size == "ARRAY")then{
	_amount = ((random (_size select 0)) + (_size select 1));
}else{
	_amount = _size;
};
_INFgrp = createGroup independent;
_grp = _INFgrp;


_i = 0; 
_newGroup = [];
for "_i" from 0 to _amount do {
	_man1 = _men select (floor(random(count _men)));
	_man = _CIVgrp createUnit [_man1, _pos, [], 0, "NONE"];
	_man addEventHandler ["Killed", {_this call LV_Killed; (_this select 1) call removeNegativeScore}];
	_newGroup = _newGroup + [_man];
	if(isNil "infected_init")then {call INF_fnc_infinit;};
	_initialPos=getPos _man;
	_man disableAI "FSM";
	_man disableAI "AUTOTARGET";
	_man disableAI "TARGET";
	_man setBehaviour "CARELESS";
	_man enableFatigue false;
	_man setVariable ["BIS_noCoreConversations", true];
	_man disableConversation true;
	[_man] spawn INF_fnc_Stuff;
	_man addEventHandler ["hit",{
		[[_this select 0,"hurt"], "INF_fnc_NextSound"] call BIS_fnc_MP;
		(_this select 0) lookAt (_this select 1);
		_nextTarget = [] + [_this select 1];
		missionNamespace setVariable [format ["%1_nextTarget",_this select 0], _nextTarget];
	}];
	infectedCount = infectedCount + 1;
	[_man,_initialPos] spawn INF_fnc_Edroam;
};
{
	[_x] joinSilent _grp;
} forEach _newGroup;

if(!isNil("_grpId"))then{
	call compile format ["LVgroup%1 = _grp",_grpId];
};

_leader = leader _grp;
_leader