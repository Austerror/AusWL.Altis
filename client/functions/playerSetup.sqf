//	@file Name: playerSetup.sqf
//	@file Author: [GoT] JoSchaap
player groupChat "Player Setup.";
_player = _this;
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];
_player allowDamage false;

enableSentences false;
//player globalchat "Clothing Arrays.";
random_hatlist = 
[
	"H_Cap_blk",
	"H_Cap_grn",
	"H_Cap_tan",
	"H_Cap_red",
	"H_Hat_tan",
	"H_Hat_grey",
	"H_StrawHat",
	"H_Watchcap_blk"
];
random_uniformlist = 
[
	"U_C_Commoner1_1",			// Viable
	"U_C_Commoner1_2",			// Viable
	"U_C_Commoner1_3",			// Viable
	"U_C_HunterBody_grn",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_redwhite",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour",
	"U_C_Poor_1",
	"U_C_Poor_2",
	"U_C_ShirtSurfer_shorts",
	"U_C_TeeSurfer_shorts_1",
	"U_C_TeeSurfer_shorts_2",
	"U_C_WorkerCoveralls",
	"U_Competitor"				// Viable
];
//player globalchat "Removing Default Items.";
removeAllWeapons _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeHeadgear _player;
removeGoggles _player;
//player globalchat "Generating Random Clothing Items.";
_uniform = random_uniformlist select (round (random ((count random_uniformlist) - 1)));
_hat = random_hatlist select (round (random ((count random_hatlist) - 1)));
//player globalchat format["Adding Random Clothing Items. Hat = %1, Uniform = %2.",_hat,_uniform];
_player addUniform _uniform;
_player addHeadgear _hat;
//player globalchat "Rest of Player Setup.";
_player addBackpack "B_AssaultPack_blk";

// remove GPS (GPS is found as loot in buildings)
sleep 0.1;
//_player unAssignItem "ItemRadio";
//_player removeItem "ItemRadio";
_player unassignItem "ItemGPS";
_player removeItem "ItemGPS";

private "_nvgClass";
switch (side _player) do
{
	// case OPFOR:       { _nvgClass = "NVGoggles_OPFOR" };
	// case INDEPENDENT: { _nvgClass = "NVGoggles_INDEP" };
	default           { _nvgClass = "NVGoggles" };
};

// # Remove NVGs #########
{
	if (["NVGoggles", _x] call fn_findString != -1) then
	{
		_player unassignItem _x;
		_player removeItem _x;
	};
} forEach assignedItems _player;
// #######################

// # Add NVGs ############
// _player linkItem _nvgClass;
// #######################

//_player addBackpack "B_AssaultPack_rgr";  // TODO: make this configurable for server admins!
_player addMagazine "16Rnd_9x21_Mag";
_player addWeapon "hgun_P07_F";
_player addMagazine "16Rnd_9x21_Mag";
_player addItem "FirstAidKit";
_player selectWeapon "hgun_P07_F";
_player addrating 9999999;

//sleep 2;
thirstLevel = 100;
hungerLevel = 100;
_player setVariable ["thirstLevel", 100, true];
_player setVariable ["hungerLevel", 100, true];
_player setVariable ["cmoney",100,true];
[objNull, _player] call mf_player_actions_refresh;
[] execVM "client\functions\playerActions.sqf";

_player groupChat format["Wasteland - Initialization Complete"];
playerSetupComplete = true;
