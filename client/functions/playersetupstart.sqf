//	@file Name: playerSetupStart.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private "_player";
_player = _this;

_player setSkill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];
_player allowDamage false;

enableSentences false;

// Make him naked!
removeAllWeapons _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeGoggles _player;
removeHeadgear _player;
// Remove GPS
_player unlinkItem "ItemGPS";
// Remove radio
_player unlinkItem "ItemRadio";
// Remove map
_player unlinkItem "ItemMap";
// Remove compass
_player unlinkItem "ItemCompass";
// Remove watch
_player unlinkItem "ItemWatch";
// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

thirstLevel = 100;
hungerLevel = 100;