#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'client\systems\crafting\item_list.sqf'";
	
	class controlsBackground {
		
		class MainBG : w_RscPicture {
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "#(argb,8,8,3)color(0,0,0,0.6)";
			moving = true;
			x = 0.0; y = 0.1;
			w = .745; h = 0.65;
		};

		class TopBar: w_RscPicture
		{
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "#(argb,8,8,3)color(0.25,0.51,0.96,0.8)";

			x = 0;
			y = 0.1;
			w = 0.745;
			h = 0.05;
		};
		
		class MainTitle : w_RscText {
			idc = -1;
			text = "Crafting Menu (coming soon)";
			sizeEx = 0.04;
			shadow = 2;		
			x = 0.260; y = 0.1;
			w = 0.3; h = 0.05;
		};
		
		class waterIcon : w_RscPicture {
	  		idc = -1;
        	text = "client\icons\water.paa";
        	x = 0.022; y = 0.21;
			w = 0.04 / (4/3); h = 0.04;
		};
		
		class uptimeText : w_RscText {	
			idc = uptime_text;
			text = "";
			sizeEx = 0.030;
			x = 0.52; y = 0.69;
			w = 0.225; h = 0.03;
		};			
	};
	
	class controls {

		class itemList : w_Rsclist {
			idc = recipe_list;
			x = 0.022; y = 0.185;
			w = 0.235; h = 0.325;
		};
		
		class itemList : w_Rsclist {
			idc = ingredient_list;
			x = 0.49; y = 0.185;
			w = 0.235; h = 0.325;
		};
		
		class DropButton : w_RscButton {
			idc = -1;
			text = "Drop";
			onButtonClick = "[1] execVM 'client\systems\crafting\itemfnc.sqf'";
			x = 0.610; y = 0.525;
			w = 0.116; h = 0.033 * safezoneH;
		};
		
		class UseButton : w_RscButton {
			idc = -1;
			text = "Use";
			onButtonClick = "[0] execVM 'client\systems\crafting\itemfnc.sqf'";
			x = 0.489; y = 0.525;
			w = 0.116; h = 0.033 * safezoneH;	
		};

		class CloseButton : w_RscButton {
			idc = close_button;
			text = "Close";
			onButtonClick = "[] execVM 'client\systems\crafting\closePlayerMenu.sqf'";
			x = 0.02; y = 0.66;
			w = 0.125; h = 0.033 * safezoneH;
		};

	};
};
