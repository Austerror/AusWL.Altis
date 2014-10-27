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
Buildingstoloot_list = [
//["Land_Kiosk_blueking_F", 0],			//no positions
//["Land_Kiosk_gyros_F", 0],			//no positions
//["Land_Kiosk_papers_F", 0],			//no positions
//["Land_Kiosk_redburger_F", 0],		//no positions
//["Land_Addon_01_V1_dam_F", 0],		//not viable
//["Land_Airport_center_F", 0],			//no positions
//["Land_cargo_addon01_V1_F", 0], 		//no positions
//["Land_cargo_addon01_V2_F", 0], 		//no positions
//["Land_cargo_addon02_V2_F", 0], 		//no positions
//["Land_Castle_01_tower_F", 0],		//no positions
//["Land_Communication_anchor_F", 0], 	//no positions
//["Land_Communication_F", 0], 			//no positions
//["Land_dp_smallFactory_F", 0], 		//no positions
//["Land_dp_smallTank_F", 0], 			//no positions
//["Land_Factory_Hopper_F", 0],			//no positions
//["Land_Garage_V1_dam_F", 0], 			//not viable
//["Land_ReservoirTank_Airport_F", 0], 	//no positions
//["Land_ReservoirTower_F", 2],			//no positions
//["Land_Shed_Big_F", 0], 				//no positions
//["Land_Shed_Small_F", 0],  			//no positions
//["Land_TBox_F", 0], 					//no positions
//["Land_TTowerBig_1_F", 2],			//no positions
//["Land_TTowerBig_2_F", 2],			//no positions
["Land_Airport_left_F", 0],
["Land_Airport_right_F", 0],
["Land_Airport_Tower_dam_F", 2],
["Land_Airport_Tower_F", 2],
["Land_cargo_house_slum_F", 5],
["Land_Cargo_House_V1_F", 1],
["Land_Cargo_House_V2_F", 1],
["Land_Cargo_House_V3_F", 1],
["Land_Cargo_HQ_V1_F", 1],
["Land_Cargo_HQ_V2_F", 1],
["Land_Cargo_HQ_V3_F", 1],
["Land_Cargo_Patrol_V1_F", 1],
["Land_Cargo_Patrol_V2_F", 1],
["Land_Cargo_Patrol_V3_F", 1],
["Land_Cargo_Tower_V1_F", 1],
["Land_Cargo_Tower_V3_F", 1],
["Land_CarService_F", 2],
["Land_Chapel_Small_V1_F", 4],
["Land_Chapel_Small_V2_F", 4],
["Land_Chapel_V1_F", 4],
["Land_Chapel_V2_F", 4],
["Land_Crane_F", 2],
["Land_dp_bigTank_F", 2], 
["Land_dp_mainFactory_F", 2],
["Land_d_Stone_Shed_V1_F", 5], 
["Land_d_Windmill01_F", 5],
["Land_FuelStation_Build_F", 0], 
["Land_FuelStation_Shed_F", 5], 
["Land_Hangar_F", 2],
["Land_Hospital_main_F", 3],
["Land_Hospital_side1_F", 0],
["Land_Hospital_side2_F", 2],
["Land_i_Addon_02_V1_F", 5],
["Land_i_Addon_03mid_V1_F", 4], 
["Land_i_Addon_03_V1_F", 4], 
["Land_i_Addon_04_V1_F", 4], 
["Land_i_Barracks_V1_F", 2],
["Land_i_Barracks_V2_F", 1],
["Land_i_Garage_V1_F", 5], 
["Land_i_Garage_V2_F", 5],
["Land_i_Garage_V1_dam_F", 5],
["Land_i_Garage_V2_dam_F", 5],
["Land_i_House_Big_01_V1_dam_F", 4], 
["Land_i_House_Big_01_V1_F", 4], 
["Land_i_House_Big_01_V2_F", 4],
["Land_i_House_Big_01_V3_F", 4],
["Land_i_House_Big_02_V1_dam_F", 4], 
["Land_i_House_Big_02_V1_F", 4], 
["Land_i_House_Big_02_V2_F", 4],
["Land_i_House_Big_02_V3_F", 4],
["Land_i_House_Small_01_V1_dam_F", 4], 
["Land_i_House_Small_01_V1_F", 4], 
["Land_i_House_Small_01_V2_dam_F", 4], 
["Land_i_House_Small_01_V2_F", 4], 
["Land_i_House_Small_01_V3_F", 4],
["Land_i_House_Small_02_V1_dam_F", 4], 
["Land_i_House_Small_02_V1_F", 4], 
["Land_i_House_Small_02_V2_F", 4],
["Land_i_House_Small_02_V3_F", 4],
["Land_i_House_Small_03_V1_dam_F", 4], 
["Land_i_House_Small_03_V1_F", 4], 
["Land_i_Shed_Ind_F", 2],
["Land_i_Shop_01_V1_dam_F", 0], 
["Land_i_Shop_01_V1_F", 0], 
["Land_i_Shop_01_V2_F", 0],
["Land_i_Shop_01_V3_F", 0],
["Land_i_Shop_02_V1_dam_F", 0], 
["Land_i_Shop_02_V1_F", 0], 
["Land_i_Shop_02_V2_F", 0],
["Land_i_Shop_02_V3_F", 0],
["Land_i_Stone_HouseBig_V1_dam_F", 4], 
["Land_i_Stone_HouseBig_V1_F", 4], 
["Land_i_Stone_HouseBig_V2_F", 4],
["Land_i_Stone_HouseBig_V3_F", 4],
["Land_i_Stone_HouseSmall_V1_dam_F", 4], 
["Land_i_Stone_HouseSmall_V1_F", 4], 
["Land_i_Stone_HouseSmall_V2_F", 4],
["Land_i_Stone_HouseSmall_V3_F", 4],
["Land_i_Stone_Shed_V1_dam_F", 4], 
["Land_i_Stone_Shed_V1_F", 4], 
["Land_i_Stone_Shed_V2_F", 4],
["Land_i_Stone_Shed_V3_F", 4],
["Land_i_Windmill01_F", 5],
["Land_LightHouse_F", 5], 
["Land_Lighthouse_small_F", 5], 
["Land_Metal_Shed_F", 5], 
["Land_MilOffices_V1_F", 1],
["Land_Offices_01_V1_F", 4],
["Land_Radar_F", 1],
["Land_Research_house_V1_F", 3],
["Land_Research_HQ_F", 3],
["Land_Slum_House01_F", 5],
["Land_Slum_House02_F", 5],
["Land_Slum_House03_F", 5],
["Land_spp_Tower_F", 2],
["Land_Unfinished_Building_01_F", 2], 
["Land_Unfinished_Building_02_F", 2],
["Land_u_Addon_01_V1_F", 4], 
["Land_u_Addon_02_V1_F", 4], 
["Land_u_Barracks_V2_F", 1],
["Land_u_House_Big_01_V1_F", 4],
["Land_u_House_Big_02_V1_F", 4],
["Land_u_House_Small_01_V1_dam_F", 4], 
["Land_u_House_Small_01_V1_F", 4], 
["Land_u_House_Small_02_V1_dam_F", 4], 
["Land_u_House_Small_02_V1_F", 4], 
["Land_u_Shed_Ind_F", 2],
["Land_u_Shop_01_V1_F", 0],
["Land_u_Shop_02_V1_F", 0],
["Land_WIP_F", 2],
["Land_TouristShelter_01_F", 4],
// Ghost Hotel
["Land_GH_Gazebo_ruins_F", 4],
["Land_GH_Gazebo_F", 4],
["Land_GH_House_ruins_F", 4],
["Land_GH_House_1_F", 4],
["Land_GH_House_2_F", 4],
["Land_GH_MainBuilding_entry_F", 5],
["Land_GH_MainBuilding_left_F", 4],
["Land_GH_MainBuilding_right_F", 4],
["Land_GH_MainBuilding_middle_F", 0]
];