//	Lootspawner junction list for buildings to classes
//	Author: Na_Palm (BIS forums)
//-------------------------------------------------------------------------------------
//"Buildingstoloot_list" array of [buildingname, class]
//								buildingname: 	building class name (in editor debug console use "typeof BIS_fnc_camera_target"
//												to monitor and then copy/paste or any other method you know...)
//								class: 			0-civil (commercial), 1-military, 2-industrial (major), 3-research (medical), 4-residential, 5-industrial (minor)
//
//!!!EVERY building must have only ONE entry here AND been in ONE class!!!
//-------------------------------------------------------------------------------------
comBuildings_list = [
"Land_Kiosk_blueking_F",
"Land_Kiosk_gyros_F",
"Land_Kiosk_papers_F",
"Land_Kiosk_redburger_F",
"Land_Addon_01_V1_dam_F",
"Land_Airport_center_F",
"Land_cargo_addon01_V1_F", 
"Land_cargo_addon01_V2_F", 
"Land_cargo_addon02_V2_F", 
"Land_Castle_01_tower_F",
"Land_Communication_anchor_F",
"Land_Communication_F", 
"Land_dp_smallFactory_F", 
"Land_dp_smallTank_F", 
"Land_Factory_Hopper_F",
"Land_Garage_V1_dam_F",
"Land_ReservoirTank_Airport_F",
"Land_Shed_Small_F",  
"Land_TBox_F",
"Land_Airport_left_F",
"Land_Airport_right_F",
"Land_FuelStation_Build_F",
"Land_Hospital_side1_F",
"Land_i_Shop_01_V1_dam_F", 
"Land_i_Shop_01_V1_F", 
"Land_i_Shop_01_V2_F",
"Land_i_Shop_01_V3_F",
"Land_i_Shop_02_V1_dam_F", 
"Land_i_Shop_02_V1_F", 
"Land_i_Shop_02_V2_F",
"Land_i_Shop_02_V3_F",
"Land_u_Shop_01_V1_F",
"Land_u_Shop_02_V1_F"
];
milBuildings_list = [
"Land_Cargo_House_V1_F",
"Land_Cargo_House_V2_F",
"Land_Cargo_House_V3_F",
"Land_Cargo_HQ_V1_F",
"Land_Cargo_HQ_V2_F",
"Land_Cargo_HQ_V3_F",
"Land_Cargo_Patrol_V1_F",
"Land_Cargo_Patrol_V2_F",
"Land_Cargo_Patrol_V3_F",
"Land_Cargo_Tower_V1_F",
"Land_Cargo_Tower_V3_F",
"Land_Radar_F",
"Land_MilOffices_V1_F",
"Land_u_Barracks_V2_F",
"Land_i_Barracks_V1_F",
"Land_i_Barracks_V2_F"
];
indmaBuildings_list = [
"Land_ReservoirTower_F",
"Land_Shed_Big_F", 	
"Land_TTowerBig_1_F",
"Land_TTowerBig_2_F",
"Land_Airport_Tower_dam_F",
"Land_Airport_Tower_F",
"Land_CarService_F",
"Land_Crane_F",
"Land_dp_bigTank_F", 
"Land_dp_mainFactory_F",
"Land_Hangar_F",
"Land_Hospital_side2_F",
"Land_i_Shed_Ind_F",
"Land_spp_Tower_F",
"Land_Unfinished_Building_01_F", 
"Land_Unfinished_Building_02_F",
"Land_u_Shed_Ind_F",
"Land_WIP_F"
];
medBuildings_list = [
"Land_Hospital_main_F",
"Land_Research_house_V1_F",
"Land_Research_HQ_F"
];
resBuildings_list = [
"Land_Chapel_Small_V1_F",
"Land_Chapel_Small_V2_F",
"Land_Chapel_V1_F",
"Land_Chapel_V2_F",
"Land_i_Addon_03mid_V1_F", 
"Land_i_Addon_03_V1_F", 
"Land_i_Addon_04_V1_F", 
"Land_i_House_Big_01_V1_dam_F", 
"Land_i_House_Big_01_V1_F", 
"Land_i_House_Big_01_V2_F",
"Land_i_House_Big_01_V3_F",
"Land_i_House_Big_02_V1_dam_F", 
"Land_i_House_Big_02_V1_F", 
"Land_i_House_Big_02_V2_F",
"Land_i_House_Big_02_V3_F",
"Land_i_House_Small_01_V1_dam_F", 
"Land_i_House_Small_01_V1_F", 
"Land_i_House_Small_01_V2_dam_F", 
"Land_i_House_Small_01_V2_F", 
"Land_i_House_Small_01_V3_F",
"Land_i_House_Small_02_V1_dam_F", 
"Land_i_House_Small_02_V1_F", 
"Land_i_House_Small_02_V2_F",
"Land_i_House_Small_02_V3_F",
"Land_i_House_Small_03_V1_dam_F", 
"Land_i_House_Small_03_V1_F",
"Land_i_Stone_HouseBig_V1_dam_F", 
"Land_i_Stone_HouseBig_V1_F", 
"Land_i_Stone_HouseBig_V2_F",
"Land_i_Stone_HouseBig_V3_F",
"Land_i_Stone_HouseSmall_V1_dam_F", 
"Land_i_Stone_HouseSmall_V1_F", 
"Land_i_Stone_HouseSmall_V2_F",
"Land_i_Stone_HouseSmall_V3_F",
"Land_i_Stone_Shed_V1_dam_F", 
"Land_i_Stone_Shed_V1_F", 
"Land_i_Stone_Shed_V2_F",
"Land_i_Stone_Shed_V3_F",
"Land_Offices_01_V1_F",
"Land_u_Addon_01_V1_F", 
"Land_u_Addon_02_V1_F", 
"Land_u_House_Big_01_V1_F",
"Land_u_House_Big_02_V1_F",
"Land_u_House_Small_01_V1_dam_F", 
"Land_u_House_Small_01_V1_F", 
"Land_u_House_Small_02_V1_dam_F", 
"Land_u_House_Small_02_V1_F"
];
indmiBuildings_list = [
"Land_cargo_house_slum_F",
"Land_d_Stone_Shed_V1_F", 
"Land_d_Windmill01_F",
"Land_FuelStation_Shed_F", 
"Land_i_Addon_02_V1_F",
"Land_i_Garage_V1_F", 
"Land_i_Garage_V2_F",
"Land_i_Garage_V1_dam_F",
"Land_i_Garage_V2_dam_F",
"Land_i_Windmill01_F",
"Land_LightHouse_F", 
"Land_Lighthouse_small_F", 
"Land_Metal_Shed_F", 
"Land_Slum_House01_F",
"Land_Slum_House02_F",
"Land_Slum_House03_F"
];
