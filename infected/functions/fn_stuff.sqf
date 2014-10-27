private ["_civilianCloth","_me","_civiliancloth","_chosencloth","_chosenface"];
_me=_this select 0;

_civilianCloth=["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poor_1"];
_aus_surv_items = ["sc_canteenfull", "sc_canteenempty", "sc_bakedbeans"]; // multiple items like food/drink
removeAllWeapons _me;
removeAllItems _me;
removeAllAssignedItems _me;
removeUniform _me;
removeVest _me;
removeBackpack _me;
removeHeadgear _me;
removeGoggles _me;
_me setMimic "dead";

_chosencloth = _civiliancloth call BIS_fnc_selectRandom;
_me forceAddUniform _chosencloth;


_loops = floor random 3;
_loop = 1;
while {_loop <= _loops} do {
	_surv_item = _aus_surv_items call BIS_fnc_selectRandom;
	_me addMagazine _surv_item;
	_loop = _loop + 1;
};
if (floor random 2 == 0) then {
	_me addItem "FirstAidKit";
};
setZomboyFace = 
{
	_me2 = _this select 0;
	_face = _this select 1;
	_me2 setFace _face;
	_me2 setObjectMaterial [0, "A3\Characters_F\Common\Data\basicbody_injury.rvmat"];
};
_chosenFace = ["infected2","infected1","zombi","zomboy"] call BIS_fnc_selectRandom;
[[_me,_chosenFace], "setZomboyFace", true] call BIS_fnc_MP;
