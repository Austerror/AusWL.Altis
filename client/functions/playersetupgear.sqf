//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles"];
_player = _this;

// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_vest = [_player, "vest"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
// if (_vest != "") then { _player addVest _vest }; // Vest removed.
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

_player addBackpack "B_AssaultPack_rgr";
_player addItem "FirstAidKit";
_player addItem "ToolKit";
//_player addItem "ItemMap";
//_player assignItem "ItemMap";
_player addMagazine "sc_canteenfull";
_player addMagazine "sc_bakedbeans";
