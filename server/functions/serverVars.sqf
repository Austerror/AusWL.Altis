//	@file Version: 1.1
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse, [GoT] JoSchaap, MercyfulFate, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer) exitWith {};

diag_log "WASTELAND SERVER - Initializing Server Vars";

pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_spawn_beacons = [];
publicVariable "pvar_spawn_beacons";
pvar_warchest_funds_east = 0;
publicVariable "pvar_warchest_funds_east";
pvar_warchest_funds_west = 0;
publicVariable "pvar_warchest_funds_west";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";

"PlayerCDeath" addPublicVariableEventHandler { [_this select 1] spawn server_playerDied };

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

//Civilian Vehicle List - Random Spawns
comVehicles = 
[
	"C_Van_01_box_F",
	"C_Van_01_transport_F"
];
milVehicles = 
[
	"B_Quadbike_01_F",
	"O_Quadbike_01_F",
	"I_Quadbike_01_F",
	"I_G_Quadbike_01_F",
	"O_Truck_02_covered_F",
	"I_Truck_02_covered_F",
	"O_Truck_02_transport_F",
	"I_Truck_02_transport_F",
	"I_G_Offroad_01_armed_F",
	"I_Truck_02_Fuel_F",
	"O_Truck_02_Fuel_F",
	"I_Truck_02_medical_F",
	"O_Truck_02_medical_F",
	"B_MRAP_01_F",
	"O_MRAP_02_F",
	"I_MRAP_03_F"
];
indmaVehicles = 
[
	"C_SUV_01_F",
	"C_Offroad_01_F",
	"I_G_Offroad_01_F",
	"C_Van_01_box_F",
	"C_Van_01_transport_F",
	"CSJ_GyroC"
];
medVehicles = 
[
	"O_Truck_02_covered_F",
	"I_Truck_02_medical_F",
	"O_Truck_02_medical_F",
	"RDS_S1203_Civ_03"
];
resVehicles = 
[
	"C_Quadbike_01_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"C_Offroad_01_F",
	"I_G_Offroad_01_F",
	"C_Van_01_box_F",
	"C_Van_01_transport_F",
	"RDS_Gaz24_Civ_03",
	"RDS_Golf4_Civ_01",
	"RDS_Hatchback_01_F",
	"RDS_Ikarus_Civ_01",
	"RDS_Ikarus_Civ_02",
	"RDS_Octavia_Civ_01",
	"CSJ_GyroC"
];
indmiVehicles = 
[
	"I_G_Quadbike_01_F",
	"C_Quadbike_01_F",
	"CSJ_GyroC"
];
civilianVehicles =
[
	"C_Quadbike_01_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"C_Offroad_01_F",
	"I_G_Offroad_01_F",
	"C_Van_01_box_F",
	"C_Van_01_transport_F",
	"RDS_Gaz24_Civ_03",
	"RDS_Golf4_Civ_01",
	"RDS_Hatchback_01_F",
	"RDS_Ikarus_Civ_01",
	"RDS_Ikarus_Civ_02",
	"RDS_Octavia_Civ_01"
	
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	"B_Quadbike_01_F",
	"O_Quadbike_01_F",
	"I_Quadbike_01_F",
	"I_G_Quadbike_01_F",
	"O_Truck_02_covered_F",
	"I_Truck_02_covered_F",
	"O_Truck_02_transport_F",
	"I_Truck_02_transport_F",
	"I_G_Offroad_01_armed_F"
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles = 
[
	"I_Truck_02_Fuel_F",
	"O_Truck_02_Fuel_F",
	"I_Truck_02_medical_F",
	"O_Truck_02_medical_F",
	"B_MRAP_01_F",
	"O_MRAP_02_F",
	"I_MRAP_03_F"
];

//Water Vehicles - Random Spawns
waterVehicles =
[
//	"B_Lifeboat",
//	"O_Lifeboat",
//	"C_Rubberboat",
//	"B_SDV_01_F",
//	"O_SDV_01_F",
//	"I_SDV_01_F",
//	"B_Boat_Transport_01_F",
//	"O_Boat_Transport_01_F",
//	"I_Boat_Transport_01_F",
//	"I_G_Boat_Transport_01_F",
	"B_Boat_Armed_01_minigun_F",
	"O_Boat_Armed_01_hmg_F",
	"I_Boat_Armed_01_minigun_F",
	"C_Boat_Civil_01_F",
//	"I_SDV_01_F",
	"C_Boat_Civil_01_police_F",
	"C_Boat_Civil_01_rescue_F"
];

//Object List - Random Spawns.
objectList =
[
	"B_supplyCrate_F",
	"B_supplyCrate_F",
	"CamoNet_INDP_open_F",
	"CamoNet_INDP_open_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Tower_F",
	"Land_BagBunker_Tower_F",
	"Land_BarGate_F",
	"Land_Canal_Wall_Stairs_F",
	"Land_Canal_WallSmall_10m_F",
	"Land_Canal_WallSmall_10m_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncShelter_F",
	"Land_CncWall4_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_HBarrier_5_F",
	"Land_HBarrier_5_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierTower_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrierWall6_F",
	"Land_MetalBarrel_F",
	"Land_Mil_ConcreteWall_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Pipes_large_F",
	"Land_RampConcrete_F",
	"Land_RampConcreteHigh_F",
	//"Land_Sacks_goods_F",
	"Land_Shoot_House_Wall_F"
	//"Land_WaterBarrel_F"
];

//Object List - Random Spawns.
staticWeaponsList = 
[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F",
	"I_G_Mortar_01_F"
];

//Object List - Random Helis.
staticHeliList = 
[
	"B_Heli_Light_01_F",
	"B_Heli_Light_01_F",
	"O_Heli_Light_02_unarmed_F",
	"I_Heli_light_03_unarmed_F"
];

//Object List - Random Planes.
staticPlaneList = 
[
	"B_Plane_CAS_01_F",
	"O_Plane_CAS_02_F",
	"I_Plane_Fighter_03_CAS_F"
];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	"hgun_P07_F",
	"Trixie_Enfield"
];

vehicleAddition =
[
	"muzzle_snds_L", // 9mm
	"FirstAidKit",
	"ToolKit"
];

vehicleAddition2 =
[
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red"
];

MissionSpawnMarkers = [];
{
	if (["Mission_", _x] call fn_findString == 0) then
	{
		MissionSpawnMarkers set [count MissionSpawnMarkers, [_x, false]];
	};
} forEach allMapMarkers;
