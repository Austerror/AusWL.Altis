//@file Version: 1.0
//@file Name: init.sqf
//@file Author: Austerror (original by MercyfulFate)
//@file Created: 21/7/2013 16:00
//@file Modified: 17/8/2014 19:00
//@file Description: Initialize Austerror Items
//@file Argument: the path of the directory holding this file
_path = _this;
// Austerror Additions

// Mini functions
aus_repair_nearest_vehicle = {
    _objects = nearestObjects[player, ["LandVehicle", "Air", "Ship"], 5];
    _object = objNull;
    if (count _objects > 0) then {_object = _objects select 0;};
    _object;
};
aus_jerrycan_nearest_pump = {
	_pump_objects = ["Land_FuelStation_Feed_F", "Land_MetalBarrel_F", "Land_fs_feed_F", "Land_Tank_rust_F"];
    _objects = nearestobjects [player, _pump_objects,  3];
    _object = objNull;
    if (count _objects > 0) then {_object = _objects select 0;};
    _object;
};
aus_jerrycan_nearest_vehicle = {
    _objects = nearestObjects[player, ["LandVehicle", "Air", "Ship"], 5];
    _object = objNull;
    if (count _objects > 0) then {_object = _objects select 0;};
    _object;
};
// -------------

_chopwood = [_path, "chopwood.sqf"] call mf_compile;
_otheritem = [_path, "blank.sqf"] call mf_compile;
_placefireplace = [_path, "placefireplace.sqf"] call mf_compile;
_gutanimal = [_path, "gutanimal.sqf"] call mf_compile;
_cookrawmeat = [_path, "cookrawmeat.sqf"] call mf_compile;
_fillcanteen = [_path, "fillcanteen.sqf"] call mf_compile;
_eatcookedmeat = [_path, "eatcookedmeat.sqf"] call mf_compile;
_eatbakedbeans = [_path, "eatbakedbeans.sqf"] call mf_compile;
_drinkwaterbottle = [_path, "drinkwaterbottle.sqf"] call mf_compile;
_drinkcanteen = [_path, "drinkcanteen.sqf"] call mf_compile;
_paintvehicleblack = [_path, "paintvehicleblack.sqf"] call mf_compile;
_paintvehicleblue = [_path, "paintvehicleblue.sqf"] call mf_compile;
_paintvehiclegrey = [_path, "paintvehiclegrey.sqf"] call mf_compile;
_paintvehiclecamoorange = [_path, "paintvehiclecamoorange.sqf"] call mf_compile;
_paintvehiclecamopink = [_path, "paintvehiclecamopink.sqf"] call mf_compile;
_paintvehicledarkblue = [_path, "paintvehicledarkblue.sqf"] call mf_compile;
_repairvehicle = [_path, "repairvehicle.sqf"] call mf_compile;
_refuelvehicle = [_path, "refuelvehicle.sqf"] call mf_compile;
_refilljerrycan = [_path, "refilljerrycan.sqf"] call mf_compile;
_siphonfuel = [_path, "siphonfuel.sqf"] call mf_compile;
_ausParachuteOut = ["custom", "parachute.sqf"] call mf_compile;
_repairtyre = [_path, "repairtyre.sqf"] call mf_compile;
_repairmotor = [_path, "repairmotor.sqf"] call mf_compile;
_pitchtent = [_path, "pitchtent.sqf"] call mf_compile;
_packtent = [_path, "packtent.sqf"] call mf_compile;
//_renametent = [_path, "renametent.sqf"] call mf_compile;

_knifeicon = "client\icons\repair.paa";
_repairtyreicon = "client\icons\repair.paa";
_repairmotoricon = "client\icons\repair.paa";
_axeicon = "client\icons\axe.paa";
_matchesicon = "client\icons\matches.paa";
_eatcookedmeaticon = "client\icons\rawmeat.paa";
_woodicon = "client\icons\matches.paa";
_rawmeaticon = "client\icons\rawmeat.paa";
_canteenicon = "client\icons\water.paa";
_waterbottleicon = "client\icons\water.paa";
_bakedbeansicon = "client\icons\cannedfood.paa";
_painticon = "client\icons\cannedfood.paa";
_repairicon = "client\icons\repair.paa";
_refuelicon = "client\icons\jerrycan.paa";
_siphonicon = "client\icons\jerrycan.paa";
_pitchtenticon = "client\icons\repair.paa";
_packtenticon = "client\icons\repair.paa";

[MF_ITEMS_AXE, "Fire Axe", _chopwood, "sc_axe", _axeicon, 1] call mf_inventory_create;
[MF_ITEMS_RAWMEAT, "Raw Meat", _cookrawmeat, "sc_rawmeat", _knifeicon, 5] call mf_inventory_create;
[MF_ITEMS_KNIFE, "Knife", _gutanimal, "sc_knife", _knifeicon, 1] call mf_inventory_create;
[MF_ITEMS_COOKEDMEAT, "Cooked Meat", _eatcookedmeat, "sc_cookedmeat", _eatcookedmeaticon, 2] call mf_inventory_create;
[MF_ITEMS_WATERBOTTLE, "Waterbottle", _drinkwaterbottle, "sc_waterbottle", _waterbottleicon, 2] call mf_inventory_create;
[MF_ITEMS_WOODENLOG, "Wooden Log", _placefireplace, "sc_woodenlog", _woodicon, 5] call mf_inventory_create;
[MF_ITEMS_BAKEDBEANS, "Can of Baked Beans", _eatbakedbeans, "sc_bakedbeans", _bakedbeansicon, 5] call mf_inventory_create;
[MF_ITEMS_CANTEEN_EMPTY, "Empty Canteen", _fillcanteen, "sc_canteenempty", _canteenicon, 2] call mf_inventory_create;
[MF_ITEMS_CANTEEN_FULL, "Full Canteen", _drinkcanteen, "sc_canteenfull", _canteenicon, 2] call mf_inventory_create;
[MF_ITEMS_SPRAYPAINT_BLACK, "Black Spray Paint", _paintvehicleblack, "sc_spraypaintblack", _painticon, 2] call mf_inventory_create;
[MF_ITEMS_SPRAYPAINT_BLUE, "Blue Spray Paint", _paintvehicleblue, "sc_spraypaintblue", _painticon, 2] call mf_inventory_create;
[MF_ITEMS_SPRAYPAINT_GREY, "Grey Spray Paint", _paintvehiclegrey, "sc_spraypaintgrey", _painticon, 2] call mf_inventory_create;
[MF_ITEMS_SPRAYPAINT_CAMOORANGE, "Camo Orange Spray Paint", _paintvehiclecamoorange, "sc_spraypaintcamoorange", _painticon, 2] call mf_inventory_create;
[MF_ITEMS_SPRAYPAINT_CAMOPINK, "Camo Pink Spray Paint", _paintvehiclecamopink, "sc_spraypaintcamopink", _painticon, 2] call mf_inventory_create;
[MF_ITEMS_SPRAYPAINT_DARKBLUE, "Dark Blue Spray Paint", _paintvehicledarkblue, "sc_spraypaintdarkblue", _painticon, 2] call mf_inventory_create;
[MF_ITEMS_REPAIRKIT, "Repair Kit", _repairvehicle, "ToolKit", _repairicon, 2] call mf_inventory_create;
[MF_ITEMS_FUELCANISTER_FULL, "Full Fuel Canister", _refuelvehicle, "sc_fuelcanisterfull", _refuelicon, 2] call mf_inventory_create;
[MF_ITEMS_FUELCANISTER_EMPTY, "Empty Fuel Canister", _refilljerrycan, "sc_fuelcanisterfull", _refuelicon, 2] call mf_inventory_create;
[MF_ITEMS_SIPHONHOSE, "Siphon Hose", _siphonfuel, "sc_siphonhose", _siphonicon, 2] call mf_inventory_create;
[AUS_CUSTOM_PARACHUTEOUT, "Parachute Out", _ausParachuteOut, "sc_siphonhose", _siphonicon, 2] call mf_inventory_create;
[MF_ITEMS_CARTYRE, "Car Tyre", _repairtyre, "sc_cartyre", _repairtyreicon, 2] call mf_inventory_create;
[MF_ITEMS_MOTOR, "Motor", _repairmotor, "sc_motor", _repairmotoricon, 2] call mf_inventory_create;
[MF_ITEMS_PACKEDTENT, "Packed Tent", _pitchtent, "sc_packedtent", _pitchtenticon, 2] call mf_inventory_create;
[MF_ITEMS_PITCHEDTENT, "Pitched Tent", _packtent, "Aus_Tent_Pitched", _packtenticon, 2] call mf_inventory_create;
//[MF_ITEMS_RENAMETENT, "Rename Tent", _renametent, "Aus_Tent_Rename", _packtenticon, 2] call mf_inventory_create;

mf_can_chop = compileFinal preProcessFileLineNumbers format["%1\can_chop.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_cook = compileFinal preProcessFileLineNumbers format["%1\can_cook.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_gut = compileFinal preProcessFileLineNumbers format["%1\can_gut.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_eatcookedmeat = compileFinal preProcessFileLineNumbers format["%1\can_eatcookedmeat.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_drinkwaterbottle = compileFinal preProcessFileLineNumbers format["%1\can_drinkwaterbottle.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_drinkcanteen = compileFinal preProcessFileLineNumbers format["%1\can_drinkcanteen.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_placefireplace = compileFinal preProcessFileLineNumbers format["%1\can_placefireplace.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_eatbakedbeans = compileFinal preProcessFileLineNumbers format["%1\can_eatbakedbeans.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_paintvehicleblack = compileFinal preProcessFileLineNumbers format["%1\can_paintvehicleblack.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_paintvehicleblue = compileFinal preProcessFileLineNumbers format["%1\can_paintvehicleblue.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_paintvehiclegrey = compileFinal preProcessFileLineNumbers format["%1\can_paintvehiclegrey.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_paintvehiclecamoorange = compileFinal preProcessFileLineNumbers format["%1\can_paintvehiclecamoorange.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_paintvehiclecamopink = compileFinal preProcessFileLineNumbers format["%1\can_paintvehiclecamopink.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_paintvehicledarkblue = compileFinal preProcessFileLineNumbers format["%1\can_paintvehicledarkblue.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_repairvehicle = compileFinal preProcessFileLineNumbers format["%1\can_repairvehicle.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_refuelvehicle = compileFinal preProcessFileLineNumbers format["%1\can_refuelvehicle.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_refilljerrycan = compileFinal preProcessFileLineNumbers format["%1\can_refilljerrycan.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_siphonfuel = compileFinal preProcessFileLineNumbers format["%1\can_siphonfuel.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_fillcanteen = compileFinal preProcessFileLineNumbers format["%1\can_fillcanteen.sqf", _path];	// Variable name for script that checks if actions is possible.
aus_canParachute = compileFinal preProcessFileLineNumbers format["%1\canParachute.sqf", "custom"];	// Variable name for script that checks if actions is possible.
mf_can_repairtyre = compileFinal preProcessFileLineNumbers format["%1\can_repairtyre.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_repairmotor = compileFinal preProcessFileLineNumbers format["%1\can_repairmotor.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_pitchtent = compileFinal preProcessFileLineNumbers format["%1\can_pitchtent.sqf", _path];	// Variable name for script that checks if actions is possible.
mf_can_packtent = compileFinal preProcessFileLineNumbers format["%1\can_packtent.sqf", _path];	// Variable name for script that checks if actions is possible.

// Setting up chop wood action.
private ["_label", "_execute", "_condition", "_action"];
_label = format["<img image='%1'/> Chop Wood", _axeicon];								// Action Label / Icon.
_execute = {MF_ITEMS_AXE call mf_inventory_use};										// Script to call that performs action.
_condition = format["[] call %1 == ''", mf_can_chop];									// Check if action is possible.
_action = [_label, _execute, [], 1, false, false, "", _condition];						// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["axe-use", _action] call mf_player_actions_set;

// Setting up cooking action.
private ["_label1", "_execute1", "_condition1", "_action1"];
_label1 = format["<img image='%1'/> Cook Raw Meat", _knifeicon];						// Action Label / Icon.
_execute1 = {MF_ITEMS_RAWMEAT call mf_inventory_use};									// Script to call that performs action.
_condition1 = format["[] call %1 == ''", mf_can_cook];									// Check if action is possible.
_action1 = [_label1, _execute1, [], 1, false, false, "", _condition1];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["cook-rawmeat", _action1] call mf_player_actions_set;

// Setting up gutting action.
private ["_label2", "_execute2", "_condition2", "_action2"];
_label2 = format["<img image='%1'/> Gut Corpse", _knifeicon];							// Action Label / Icon.
_execute2 = {MF_ITEMS_KNIFE call mf_inventory_use};										// Script to call that performs action.
_condition2 = format["[] call %1 == ''", mf_can_gut];									// Check if action is possible.
_action2 = [_label2, _execute2, [], 1, false, false, "", _condition2];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["gut-corpse", _action2] call mf_player_actions_set;

// Setting up eating cooked meat action.
private ["_label3", "_execute3", "_condition3", "_action3"];
_label3 = format["<img image='%1'/> Eat Cooked Meat", _eatcookedmeaticon];				// Action Label / Icon.
_execute3 = {MF_ITEMS_COOKEDMEAT call mf_inventory_use};								// Script to call that performs action.
_condition3 = format["[] call %1 == ''", mf_can_eatcookedmeat];							// Check if action is possible.
_action3 = [_label3, _execute3, [], 1, false, false, "", _condition3];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["eat-meat", _action3] call mf_player_actions_set;

// Setting up drinking waterbottle action.
private ["_label4", "_execute4", "_condition4", "_action4"];
_label4 = format["<img image='%1'/> Drink Waterbottle", _waterbottleicon];			// Action Label / Icon.
_execute4 = {MF_ITEMS_WATERBOTTLE call mf_inventory_use};								// Script to call that performs action.
_condition4 = format["[] call %1 == ''", mf_can_drinkwaterbottle];						// Check if action is possible.
_action4 = [_label4, _execute4, [], 1, false, false, "", _condition4];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["drink-waterbottle", _action4] call mf_player_actions_set;

// Setting up placing fireplace action.
private ["_label5", "_execute5", "_condition5", "_action5"];
_label5 = format["<img image='%1'/> Place Fireplace", _matchesicon];					// Action Label / Icon.
_execute5 = {MF_ITEMS_WOODENLOG call mf_inventory_use};															// Script to call that performs action.
_condition5 = format["[] call %1 == ''", mf_can_placefireplace];						// Check if action is possible.
_action5 = [_label5, _execute5, [], 1, false, false, "", _condition5];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["place-fireplace", _action5] call mf_player_actions_set;

// Setting up eating baked beans.
private ["_label6", "_execute6", "_condition6", "_action6"];
_label6 = format["<img image='%1'/> Eat Baked Beans", _bakedbeansicon];					// Action Label / Icon.
_execute6 = {MF_ITEMS_BAKEDBEANS call mf_inventory_use};															// Script to call that performs action.
_condition6 = format["[] call %1 == ''", mf_can_eatbakedbeans];						// Check if action is possible.
_action6 = [_label6, _execute6, [], 1, false, false, "", _condition6];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["eat-bakedbeans", _action6] call mf_player_actions_set;

// Setting up drinking canteen.
private ["_label7", "_execute7", "_condition7", "_action7"];
_label7 = format["<img image='%1'/> Drink Canteen", _waterbottleicon];					// Action Label / Icon.
_execute7 = {MF_ITEMS_CANTEEN_FULL call mf_inventory_use};															// Script to call that performs action.
_condition7 = format["[] call %1 == ''", mf_can_drinkcanteen];						// Check if action is possible.
_action7 = [_label7, _execute7, [], 1, false, false, "", _condition7];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["drink-canteen", _action7] call mf_player_actions_set;

// Setting up spray painting vehicle black.
private ["_label8", "_execute8", "_condition8", "_action8"];
_label8 = format["<img image='%1'/> Spray Vehicle Black", _painticon];					// Action Label / Icon.
_execute8 = {MF_ITEMS_SPRAYPAINT_BLACK call mf_inventory_use};															// Script to call that performs action.
_condition8 = format["[] call %1 == ''", mf_can_paintvehicleblack];						// Check if action is possible.
_action8 = [_label8, _execute8, [], 1, false, false, "", _condition8];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["paintvehicle-black", _action8] call mf_player_actions_set;

// Setting up spray painting vehicle blue.
private ["_label8", "_execute8", "_condition8", "_action8"];
_label8 = format["<img image='%1'/> Spray Vehicle Blue", _painticon];					// Action Label / Icon.
_execute8 = {MF_ITEMS_SPRAYPAINT_BLUE call mf_inventory_use};															// Script to call that performs action.
_condition8 = format["[] call %1 == ''", mf_can_paintvehicleblue];						// Check if action is possible.
_action8 = [_label8, _execute8, [], 1, false, false, "", _condition8];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["paintvehicle-blue", _action8] call mf_player_actions_set;

// Setting up spray painting vehicle grey.
private ["_label8", "_execute8", "_condition8", "_action8"];
_label8 = format["<img image='%1'/> Spray Vehicle Grey", _painticon];					// Action Label / Icon.
_execute8 = {MF_ITEMS_SPRAYPAINT_GREY call mf_inventory_use};															// Script to call that performs action.
_condition8 = format["[] call %1 == ''", mf_can_paintvehiclegrey];						// Check if action is possible.
_action8 = [_label8, _execute8, [], 1, false, false, "", _condition8];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["paintvehicle-grey", _action8] call mf_player_actions_set;

// Setting up spray painting vehicle camo orange.
private ["_label9", "_execute9", "_condition9", "_action9"];
_label9 = format["<img image='%1'/> Spray Vehicle Camo Orange", _painticon];					// Action Label / Icon.
_execute9 = {MF_ITEMS_SPRAYPAINT_CAMOORANGE call mf_inventory_use};															// Script to call that performs action.
_condition9 = format["[] call %1 == ''", mf_can_paintvehiclecamoorange];						// Check if action is possible.
_action9 = [_label9, _execute9, [], 1, false, false, "", _condition9];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["paintvehicle-camoorange", _action9] call mf_player_actions_set;

// Setting up spray painting vehicle camo pink.
private ["_label11", "_execute11", "_condition11", "_action11"];
_label11 = format["<img image='%1'/> Spray Vehicle Camo Pink", _painticon];					// Action Label / Icon.
_execute11 = {MF_ITEMS_SPRAYPAINT_CAMOPINK call mf_inventory_use};															// Script to call that performs action.
_condition11 = format["[] call %1 == ''", mf_can_paintvehiclecamopink];						// Check if action is possible.
_action11 = [_label11, _execute11, [], 1, false, false, "", _condition11];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["paintvehicle-camopink", _action11] call mf_player_actions_set;

// Setting up spray painting vehicle dark blue.
private ["_label12", "_execute12", "_condition12", "_action12"];
_label12 = format["<img image='%1'/> Spray Vehicle Dark Blue", _painticon];					// Action Label / Icon.
_execute12 = {MF_ITEMS_SPRAYPAINT_DARKBLUE call mf_inventory_use};															// Script to call that performs action.
_condition12 = format["[] call %1 == ''", mf_can_paintvehicledarkblue];						// Check if action is possible.
_action12 = [_label12, _execute12, [], 1, false, false, "", _condition12];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["paintvehicle-darkblue", _action12] call mf_player_actions_set;

// Setting up repair vehicle.
private ["_label13", "_execute13", "_condition13", "_action13"];
_label13 = format["<img image='%1'/> Repair Vehicle (45 sec)", _repairicon];					// Action Label / Icon.
_execute13 = {MF_ITEMS_REPAIRKIT call mf_inventory_use};															// Script to call that performs action.
_condition13 = format["[] call %1 == ''", mf_can_repairvehicle];						// Check if action is possible.
_action13 = [_label13, _execute13, [], 1, false, false, "", _condition13];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["repair-vehicle", _action13] call mf_player_actions_set;

// Setting up refuel vehicle.
private ["_label14", "_execute14", "_condition14", "_action14"];
_label14 = format["<img image='%1'/> Refuel", _siphonicon];					// Action Label / Icon.
_execute14 = {MF_ITEMS_FUELCANISTER_FULL call mf_inventory_use};															// Script to call that performs action.
_condition14 = format["[] call %1 == ''", mf_can_refuelvehicle];						// Check if action is possible.
_action14 = [_label14, _execute14, [], 1, false, false, "", _condition14];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["refuel-vehicle", _action14] call mf_player_actions_set;

// Setting up siphon fuel.
private ["_label15", "_execute15", "_condition15", "_action15"];
_label15 = format["<img image='%1'/> Siphon Fuel", _siphonicon];					// Action Label / Icon.
_execute15 = {MF_ITEMS_SIPHONHOSE call mf_inventory_use};															// Script to call that performs action.
_condition15 = format["[] call %1 == ''", mf_can_siphonfuel];						// Check if action is possible.
_action15 = [_label15, _execute15, [], 1, false, false, "", _condition15];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["siphon-fuel", _action15] call mf_player_actions_set;

// Setting up refill canteen.
private ["_label16", "_execute16", "_condition16", "_action16"];
_label16 = format["<img image='%1'/> Fill Canteen", _waterbottleicon];					// Action Label / Icon.
_execute16 = {MF_ITEMS_CANTEEN_EMPTY call mf_inventory_use};															// Script to call that performs action.
_condition16 = format["[] call %1 == ''", mf_can_fillcanteen];						// Check if action is possible.
_action16 = [_label16, _execute16, [], 1, false, false, "", _condition16];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["fill-canteen", _action16] call mf_player_actions_set;

// Parachute from helicopter.
private ["_label17", "_execute17", "_condition17", "_action17"];
_label17 = "Parachute Out";															// Action Label / Icon.
_execute17 = {AUS_CUSTOM_PARACHUTEOUT call mf_inventory_use};										// Script to call that performs action.
_condition17 = format["[] call %1 == ''", aus_canParachute];									// Check if action is possible.
_action17 = [_label17, _execute17, [], 1, false, false, "", _condition17];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["parachute-out", _action17] call mf_player_actions_set;

// Setting up repair tyre.
private ["_label18", "_execute18", "_condition18", "_action18"];
_label18 = format["<img image='%1'/> Repair Tyre (7 sec)", _repairtyreicon];					// Action Label / Icon.
_execute18 = {MF_ITEMS_CARTYRE call mf_inventory_use};															// Script to call that performs action.
_condition18 = format["[] call %1 == ''", mf_can_repairtyre];						// Check if action is possible.
_action18 = [_label18, _execute18, [], 1, false, false, "", _condition18];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["repair-tyre", _action18] call mf_player_actions_set;

// Setting up repair motor.
private ["_label19", "_execute19", "_condition19", "_action19"];
_label19 = format["<img image='%1'/> Repair Motor (20 sec)", _repairmotoricon];					// Action Label / Icon.
_execute19 = {MF_ITEMS_MOTOR call mf_inventory_use};															// Script to call that performs action.
_condition19 = format["[] call %1 == ''", mf_can_repairmotor];						// Check if action is possible.
_action19 = [_label19, _execute19, [], 1, false, false, "", _condition19];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["repair-motor", _action19] call mf_player_actions_set;

// Setting up pitch tent.
private ["_label20", "_execute20", "_condition20", "_action20"];
_label20 = format["<img image='%1'/> Pitch Tent", _pitchtenticon];					// Action Label / Icon.
_execute20 = {MF_ITEMS_PACKEDTENT call mf_inventory_use};															// Script to call that performs action.
_condition20 = format["[] call %1 == ''", mf_can_pitchtent];						// Check if action is possible.
_action20 = [_label20, _execute20, [], 1, false, false, "", _condition20];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["pitch-tent", _action20] call mf_player_actions_set;

// Setting up pack tent.
private ["_label21", "_execute21", "_condition21", "_action21"];
_label21 = format["<img image='%1'/> Pack Tent", _packtenticon];					// Action Label / Icon.
_execute21 = {MF_ITEMS_PITCHEDTENT call mf_inventory_use};															// Script to call that performs action.
_condition21 = format["[] call %1 == ''", mf_can_packtent];						// Check if action is possible.
_action21 = [_label21, _execute21, [], 1, false, false, "", _condition21];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["pack-tent", _action21] call mf_player_actions_set;

// Setting up refill jerrycan action.
private ["_label22", "_execute22", "_condition22", "_action22"];
_label22 = format["<img image='%1'/> Fill Jerry Can", _refuelicon];
_execute22 = {MF_ITEMS_FUELCANISTER_EMPTY call mf_inventory_use};
_condition22 = format["[] call %1 == ''", mf_can_refilljerrycan];
_action22 = [_label22, _execute22, [], 1, false, false, "", _condition22];
["jerrycan-refill", _action22] call mf_player_actions_set;
/*
// Setting up rename tent.
private ["_label21", "_execute21", "_condition21", "_action21"];
_label21 = format["<img image='%1'/> Rename Tent", _packtenticon];					// Action Label / Icon.
_execute21 = {MF_ITEMS_RENAMETENT call mf_inventory_use};															// Script to call that performs action.
_condition21 = format["[] call %1 == ''", mf_can_packtent];						// Check if action is possible.
_action21 = [_label21, _execute21, [], 1, false, false, "", _condition21];					// Setup call (Label, Action Script, Some Array?, Some Number?, Boolean, Boolean, String, Check Script)
["rename-tent", _action21] call mf_player_actions_set;
*/