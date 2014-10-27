//@file Version: 1.0
//@file Name: init.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Initialize Wasteland Items
//@file Argument: the path to the directory holding this file.

// All MF_ITEMS in here instead.

MF_ITEMS_AXE = "sc_axe"; 						// austerror (sc)

MF_ITEMS_BAKEDBEANS = "sc_bakedbeans"; 		// austerror (sc)

MF_ITEMS_CAMO_NET = "camonet"; 				// camonet

MF_ITEMS_CANNED_FOOD = "cannedfood"; 		// survival

MF_ITEMS_CANTEEN_FULL = "sc_canteenfull";	// austerror (sc)

MF_ITEMS_CANTEEN_EMPTY = "sc_canteenempty";	// austerror (sc)

MF_ITEMS_CARTYRE = "sc_cartyre";	// austerror (sc)

MF_ITEMS_COOKEDMEAT = "sc_cookedmeat"; 		// survival (sc)

MF_ITEMS_ENERGY_DRINK = "energydrink"; 		// survival

MF_ITEMS_FUELCANISTER_EMPTY = "sc_fuelcanisterempty"; 		// austerror (sc)

MF_ITEMS_FUELCANISTER_FULL = "sc_fuelcanisterfull"; 		// austerror (sc)

MF_ITEMS_JERRYCAN_EMPTY = "jerrycanempty"; 	// jerrycan

MF_ITEMS_JERRYCAN_FULL = "jerrycanfull"; 	// jerrycan

MF_ITEMS_KNIFE = "sc_knife"; 					// austerror (sc)

MF_ITEMS_MATCHES = "sc_matchbook"; 				// austerror

MF_ITEMS_MOTOR = "sc_motor"; 				// austerror

MF_ITEMS_PACKEDTENT = "sc_packedtent"; 				// austerror

MF_ITEMS_PITCHEDTENT = "Aus_Tent_Pitched"; 				// austerror (faux item)

MF_ITEMS_RAWMEAT = "sc_rawmeat"; 				// austerror (sc)

MF_ITEMS_RENAMETENT = "MF_ITEMS_RENAMETENT"; 				// austerror (sc)

MF_ITEMS_REPAIR_KIT = "repairkit"; 			// misc

MF_ITEMS_REPAIRKIT = "ToolKit"; 			// ToolKit

MF_ITEMS_SIPHONHOSE = "sc_siphonhose"; 			// austerror (sc)

MF_ITEMS_SPAWN_BEACON = "spawnbeacon"; 		// beacon

MF_ITEMS_SPRAYPAINT_BLACK = "sc_spraypaintblack";	// austerror (sc)

MF_ITEMS_SPRAYPAINT_BLUE = "sc_spraypaintblue";		// austerror (sc)

MF_ITEMS_SPRAYPAINT_CAMOORANGE = "sc_spraypaintcamoorange";		// austerror (sc)

MF_ITEMS_SPRAYPAINT_CAMOPINK = "sc_spraypaintcamopink";		// austerror (sc)

MF_ITEMS_SPRAYPAINT_DARKBLUE = "sc_spraypaintdarkblue";		// austerror (sc)

MF_ITEMS_SPRAYPAINT_GREY = "sc_spraypaintgrey";		// austerror (sc)

MF_ITEMS_SYPHON_HOSE = "syphonhose"; 		// jerrycan

MF_ITEMS_WATER = "water"; 					// survival

MF_ITEMS_WATERBOTTLE = "sc_waterbottle";	// austerror (sc)

MF_ITEMS_WOODENLOG = "sc_woodenlog"; 		// austerror (sc)

// Non items. Austerror Custom Actions.
AUS_CUSTOM_PARACHUTEOUT = "AUS_CUSTOM_PARACHUTEOUT"; 		// austerror (sc)

[_this, "survival"] call mf_init;
[_this, "jerrycan"] call mf_init;
[_this, "misc"] call mf_init;
[_this, "beacon"] call mf_init;
[_this, "camonet"] call mf_init;
[_this, "warchest"] call mf_init;
[_this, "austerror"] call mf_init;
