//@file Version: 1.0
//@file Name: can_chop.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 21/7/2013 16:00
//@file Modified: 17/8/2014 19:20
//@file Description: Check if you can chop wood
//@file Argument: Returns true if tree in range (set in austerror\init.sqf[mf_chop_nearest_tree])

#define ERR_NO_TREE "You are not close enough to a tree."
#define ERR_NO_AXE "You do not have an axe."
#define ERR_ENOUGH_WOOD "You already have too much wood."
#define ERR_CANCELLED "Wood Cutting Cancelled!"
#define ITEM_COUNT(ITEMID) ITEMID call mf_inventory_count
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."

mf_chop_nearest_tree = {
	private ["_treeobjects", "_objects", "_tree", "_objdmg", "_found"];
	_treeobjects = ["t_broussonetiap1s_f", "t_ficusb1s_f", "t_ficusb2s_f", "t_fraxinusav2s_f", "t_oleae1s_f", "t_oleae2s_f", "t_phoenixc1s_f", "t_phoenixc3s_f", "t_pinuss1s_f", "t_pinuss2s_b_f", "t_pinuss2s_f", "t_pinusp3s_f", "t_poplar2f_dead_f", "t_populusn3s_f", "t_quercusir2s_f"];
    _objects = nearestObjects[player, [], 5];
	_tree = false;
	{
		_y = _x;
		{
			//_obdmg = getDammage _x;
			if ((getDammage _x) != 1) then {
				_found=[_y,_x] call FNC_instring2;
				if  (_found) exitWith {
					_tree = true;
				};
			};
		} forEach _objects;
	} foreach _treeobjects;
	_tree;
};

private ["_tree","_error","_hasaxe"];
_error = "";
_tree = false;
_tree = call mf_chop_nearest_tree;
if (!_tree) exitWith {_error = ERR_NO_TREE};
_hasaxe = "sc_axe" in magazines player;
if (!_hasaxe) exitWith {_error = ERR_NO_AXE};
if (ITEM_COUNT(MF_ITEMS_WOOD) >= 5) exitWith {_error = ERR_ENOUGH_WOOD};
if (vehicle player != player) exitWith {_error = ERR_IN_VEHICLE};
_error;
