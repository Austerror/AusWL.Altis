#define respawn_dialog 3400
#define respawn_Content_Text 3401
#define respawn_MissionUptime_Text 3402
#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407
#define respawn_PlayersInTown_Text0 3408
#define respawn_PlayersInTown_Text1 3409
#define respawn_PlayersInTown_Text2 3410
#define respawn_PlayersInTown_Text3 3411
#define respawn_PlayersInTown_Text4 3412
#define respawn_Random_Button 3413
#define respawn_LoadTowns_Button 3414
#define respawn_LoadBeacons_Button 3415


	class RespawnSelectionDialog {
		idd = respawn_dialog;
		movingEnable = false;
		enableSimulation = true;
		onLoad = "uiNamespace setVariable ['RespawnSelectionDialog', _this select 0]";
	
	class controlsBackground {

		class MainBackground: w_RscPicture
		{
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "#(argb,8,8,3)color(1,1,1,0.09)";

			x = 0.2745 * safezoneW + safezoneX;
			y = 0.166 * safezoneH + safezoneY;
			w = 0.455 * safezoneW;
			h = 0.620 * safezoneH;
		};

		class TopBar: w_RscPicture
		{
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "#(argb,8,8,3)color(0.95,0.1,0.76,0.8)";

			x = 0.2745 * safezoneW + safezoneX;
			y = 0.166 * safezoneH + safezoneY;
			w = 0.455 * safezoneW;
			h = 0.072 * safezoneH;
		};

		class RespawnMenuTitle: w_RscText
		{
			idc = -1;
			text = "Respawn Menu";
			sizeEx = 0.06;

			x = 0.442 * safezoneW + safezoneX;
			y = 0.185 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.035 * safezoneH;
		};

		class RespawnStructuredText: w_RscStructuredText
		{
			idc = respawn_Content_Text;
			text = "";

			x = 0.350 * safezoneW + safezoneX;
			y = 0.246 * safezoneH + safezoneY;
			w = 0.300 * safezoneW;
			h = 0.060 * safezoneH;
		};

		class TopLine: w_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";

			x = 0.328 * safezoneW + safezoneX;
			y = 0.360 * safezoneH + safezoneY;
			w = 0.343 * safezoneW;
			h = 0.0025 * safezoneH;
		};

		class MiddleLine: w_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";

			x = 0.328 * safezoneW + safezoneX;
			y = 0.426 * safezoneH + safezoneY;
			w = 0.343 * safezoneW;
			h = 0.0025 * safezoneH;
		};

		class BottomLine: w_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";

			x = 0.328 * safezoneW + safezoneX;
			y = 0.693 * safezoneH + safezoneY;
			w = 0.343 * safezoneW;
			h = 0.0025 * safezoneH;
		};

		class MissionUptimeText: w_RscStructuredTextLeft
		{
			idc = respawn_MissionUptime_Text;
			text = "Mission Uptime: 00:00:00";

			x = 0.540 * safezoneW + safezoneX;
			y = 0.719 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.025 * safezoneH;
		};
	};

	class controls {
		class RandomSpawnButton: w_RscButton
		{
			idc = respawn_Random_Button;
			onButtonClick = ""; // Action is now set dynamically in loadRespawnDialog.sqf using buttonSetAction
			text = "Respawn";

			x = 0.460* safezoneW + safezoneX;
			y = 0.310 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
