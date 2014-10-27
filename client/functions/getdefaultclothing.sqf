//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_item", "_side", "_isSniper", "_isDiver", "_defaultVest", "_result", "_randomUniform", "_randomHeadgear", "_randomGoggles"];

_randomUniform = 
[
	"U_C_Poloshirt_blue",			// Commoner Clothes
	"U_C_Poloshirt_burgundy",		// ''
	"U_C_Poloshirt_stripped",		// ''
	"U_C_Poloshirt_tricolour",		// ''
	"U_C_Poloshirt_salmon",			// ''
	"U_C_Poloshirt_redwhite",		// ''
	"U_C_Poor_1"					// Worn Clothes
] call BIS_fnc_selectRandom;

_randomHeadgear = 
[
	"H_Cap_blk",
	"H_Cap_grn",
	"H_Cap_tan",
	"H_Cap_red",
	"H_Hat_tan",
	"H_Hat_grey",
	"H_StrawHat",
	"H_Watchcap_blk"
] call BIS_fnc_selectRandom;

_randomGoggles = 
[
	"G_Shades_Red",
	"G_Shades_Black",
	"G_Shades_Blue",
	"G_Shades_Green"
] call BIS_fnc_selectRandom;

_unit = _this select 0;
_item = _this select 1;

_defaultVest = "V_Rangemaster_Belt";

_result = "";
// diag_log format ["Random Uniform: %1" _randomUniform];
if (_item == "uniform") then { _result = _randomUniform };
if (_item == "headgear") then { _result = _randomHeadgear };
if (_item == "goggles") then { _result = _randomGoggles };
if (_item == "vest") then { _result = _defaultVest };

_result
