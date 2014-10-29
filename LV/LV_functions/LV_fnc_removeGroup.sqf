//ARMA3Alpha function LV_fnc_removeGroup v0.2 - by SPUn / lostvar
//removes fillHouse or militarize units 
//Syntax: nul = [LVgroup*] execVM "LV\LV_functions\LV_fnc_removeGroup.sqf";
// * = id number (which is defined in fillHouse or militarize, so if ID is 10 = LVgroup10)
private["_grp","_vehToDel"];
_grp = _this select 0;
_vehToDel = objNull;
if(isNil("_grp"))exitWith{};
{
	if (vehicle _x != _x) then { _vehToDel = vehicle _x; };
	deleteVehicle _x;
}forEach units _grp;
// Delete groups vehicle (if any).
if (!isNill _vehToDel) then { deleteVehicle _vehToDel; };