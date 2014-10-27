//	Lootspawner junction lists for classes to spawn-/lootable items
//	Author: Na_Palm (BIS forums)
//-------------------------------------------------------------------------------------
//here place Weapons and usable items (ex.: Binocular, ...)
//used with addWeaponCargoGlobal
//"lootWeapon_list" array of [class, [weaponlist]]
//								class		: 0-civil (commercial), 1-military, 2-industrial (major), 3-research (medical), 4-residential, 5-industrial (minor)
//								weaponlist	: list of weapon class names
lootWeapon_list = [
[ 0, [										// CIVIL (Commercial)
["Binocular", 25],							// Binoculars
["srifle_LRR_F", 75],						// M320 LRR .408 - Sniper Rifle Caliber: .408 (7Rnd_408_Mag)
["hgun_P07_snds_F", 25],					// P07 9 mm (16Rnd_9x21_Mag, 30Rnd_9x21_Mag)
["hgun_Pistol_heavy_02_Yorris_F", 25],		// Zubr .45 (6Rnd_45ACP_Cylinder)
["hgun_Pistol_heavy_02_F", 10],				// Zubr .45 (6Rnd_45ACP_Cylinder)
["Trixie_Enfield", 10]						// Lee Enfield
]],

[ 1, [									// MILITARY
["launch_NLAW_F", 75],					// PCML Rocket Launcher (NLAW_F)
["launch_RPG32_F", 75],					// Rocket Launcher (RPG32_F, RPG32_HE_F)
["srifle_EBR_F", 60],						// Mk18 ABR 7.62 mm (20Rnd_762x51_Mag)
["srifle_GM6_F", 75],						// GM6 Lynx 12.7 mm (5Rnd_127x108_Mag, 5Rnd_127x108_APDS_Mag)
["srifle_LRR_F", 75],						// M320 LRR .408 - Sniper Rifle Caliber: .408 (7Rnd_408_Mag)
["LMG_Mk200_F", 45],						// Mk200 6.5 mm - Light Machine Gun Caliber: 6.5x39 mm (200Rnd_65x39_cased_Box, 200Rnd_65x39_cased_Box_Tracer)
["hgun_P07_F", 25],						// P07 9 mm - Handgun Caliber: 9x21 mm (16Rnd_9x21_Mag, 30Rnd_9x21_Mag)
["hgun_Rook40_F", 25], 					// Rook-40 9 mm - Handgun Caliber: 9x21 mm (16Rnd_9x21_Mag, 30Rnd_9x21_Mag)
["arifle_Katiba_F", 15],					// Katiba 6.5 mm - Assault Rifle Caliber: 6.5x39 mm (30Rnd_65x39_caseless_green, 30Rnd_65x39_caseless_green_mag_Tracer)
["arifle_Katiba_GL_F", 55], 				// Katiba GL 6.5 mm - Assault Rifle Caliber: 6.5x39 mm, Grenade Launcher Caliber: 40 mm (30Rnd_65x39_caseless_green, 30Rnd_65x39_caseless_green_mag_Tracer, 1Rnd_HE_Grenade_shell)
["arifle_MXC_F", 25], 					// MXC 6.5 mm - Assault Rifle Caliber: 6.5x39 mm (30Rnd_65x39_caseless_mag, 30Rnd_65x39_caseless_mag_Tracer)
["arifle_MX_GL_F", 25],				// MX 3GL 6.5 mm - Assault Rifle Caliber: 6.5x39 mm, Grenade Launcher Caliber: 40 mm (30Rnd_65x39_caseless_mag, 30Rnd_65x39_caseless_mag_Tracer, 1Rnd_HE_Grenade_shell, 3Rnd_HE_Grenade_shell)
["arifle_SDAR_F", 25],					// SDAR 5.56 mm - Underwater Gun Caliber: 5.56x45 mm UW (20Rnd_556x45_UW_mag, 30Rnd_556x45_Stanag, 30Rnd_556x45_Stanag_Tracer_Red, 30Rnd_556x45_Stanag_Tracer_Green, 30Rnd_556x45_Stanag_Tracer_Yellow)
["arifle_TRG21_F", 25], 					// TRG-21 5.56 mm - Assault rifle Caliber: 5.56x45 mm NATO (30Rnd_556x45_Stanag, 30Rnd_556x45_Stanag_Tracer_Red, 30Rnd_556x45_Stanag_Tracer_Green, 30Rnd_556x45_Stanag_Tracer_Yellow)
["arifle_TRG21_GL_F", 25],				// TRG-21 EGLM 5.56 mm - Assault Rifle Caliber: 5.56x45 mm, Grenade Launcher Caliber: 40 mm (30Rnd_556x45_Stanag, 30Rnd_556x45_Stanag_Tracer_Red, 30Rnd_556x45_Stanag_Tracer_Green, 30Rnd_556x45_Stanag_Tracer_Yellow, 1Rnd_HE_Grenade_shell)
["launch_Titan_short_F", 25],				// Titan MPRL Compact - Rocket Launcher Ammo: 127 mm Titan Rocket (Titan_AT, Titan_AP)
["LMG_Zafir_F", 25], 						// Zafir 7.62 mm - Light Machine Gun Caliber: 7.62x51 mm (150Rnd_762x51_Box, 150Rnd_762x51_Box_Tracer)
["hgun_ACPC2_F", 25], 					// ACP-C2 .45 - Handgun Caliber: .45 ACP (9Rnd_45ACP_Mag) 
["arifle_Mk20C_F", 25], 					// Mk20C 5.56 mm (C) - Assault Rifle Caliber: 5.56x45 mm (30Rnd_556x45_Stanag, 30Rnd_556x45_Stanag_Tracer_Red, 30Rnd_556x45_Stanag_Tracer_Green, 30Rnd_556x45_Stanag_Tracer_Yellow)
["arifle_Mk20_GL_F", 25], 				// Mk20 EGLM 5.56 mm (C) - Assault Rifle Caliber: 5.56x45 mm (30Rnd_556x45_Stanag, 30Rnd_556x45_Stanag_Tracer_Red, 30Rnd_556x45_Stanag_Tracer_Green, 30Rnd_556x45_Stanag_Tracer_Yellow, 1Rnd_HE_Grenade_shell)
["SMG_01_F", 25], 						// Vermin SMG .45 ACP - Submachine Gun Caliber: .45 ACP (30Rnd_45ACP_Mag_SMG_01, 30Rnd_45ACP_Mag_SMG_01_tracer_green)
["SMG_02_F", 25],							// Sting 9 mm - Submachine Gun Caliber: 9x21 mm (30Rnd_9x21_Mag)
["srifle_DMR_01_F", 25], 					// Rahim 7.62 mm - Assault rifle Caliber: 7.62x51 mm NATO (10Rnd_762x51_Mag)
["hgun_Pistol_heavy_01_F", 25], 			// 4-five .45 - Handgun Caliber: .45 ACP (11Rnd_45ACP_Mag)
["hgun_Pistol_heavy_02_Yorris_F", 25],	// Zubr .45 - Handgun Caliber: .45 ACP (6Rnd_45ACP_Cylinder)
["hgun_PDW2000_F", 25] 					// PDW2000 9 mm - Submachine Gun Caliber: 9x21 mm (30Rnd_9x21_Mag, 16Rnd_9x21_Mag)
]],

[ 2, [									// INDUSTRIAL (Major)
["Binocular", 45],						// Binoculars
["hgun_Rook40_F", 25], 					// Rook-40 9 mm - Handgun Caliber: 9x21 mm (16Rnd_9x21_Mag, 30Rnd_9x21_Mag)
["LMG_Zafir_F", 45], 						// Zafir 7.62 mm - Light Machine Gun Caliber: 7.62x51 mm (150Rnd_762x51_Box, 150Rnd_762x51_Box_Tracer)
["LMG_Mk200_F", 45],						// Mk200 6.5 mm - Light Machine Gun Caliber: 6.5x39 mm (200Rnd_65x39_cased_Box, 200Rnd_65x39_cased_Box_Tracer)
["Trixie_CZ550", 25],
["Trixie_FNFAL", 15]
]],

[ 3, [									// RESEARCH (Medical)
["hgun_Pistol_heavy_01_F", 15], 			// 4-five .45 - Handgun Caliber: .45 ACP (11Rnd_45ACP_Mag)
["SMG_01_F", 35] 							// Vermin SMG .45 ACP - Submachine Gun Caliber: .45 ACP (30Rnd_45ACP_Mag_SMG_01, 30Rnd_45ACP_Mag_SMG_01_tracer_green)
]],

[ 4, [									// RESIDENTIAL
["Binocular", 45],						// Binoculars
["hgun_P07_F", 25],						// P07 9 mm - Handgun Caliber: 9x21 mm (16Rnd_9x21_Mag, 30Rnd_9x21_Mag)
["hgun_Rook40_F", 35], 					// Rook-40 9 mm - Handgun Caliber: 9x21 mm (16Rnd_9x21_Mag, 30Rnd_9x21_Mag)
["hgun_ACPC2_F", 55], 					// ACP-C2 .45 - Handgun Caliber: .45 ACP (9Rnd_45ACP_Mag)
["SMG_02_F", 25],							// Sting 9 mm - Submachine Gun Caliber: 9x21 mm (30Rnd_9x21_Mag)
["hgun_Pistol_heavy_01_F", 55], 			// 4-five .45 - Handgun Caliber: .45 ACP (11Rnd_45ACP_Mag)
["hgun_PDW2000_F", 25], 					// PDW2000 9 mm - Submachine Gun Caliber: 9x21 mm (30Rnd_9x21_Mag, 16Rnd_9x21_Mag)
["Trixie_Enfield", 15]					// Lee Enfield
]],

[ 5, [									// INDUSTRIAL (Minor)
["Binocular", 50],						// Binoculars
["hgun_Rook40_F", 25], 					// Rook-40 9 mm - Handgun Caliber: 9x21 mm (16Rnd_9x21_Mag, 30Rnd_9x21_Mag)
["Trixie_Enfield", 35]					// Lee Enfield
]]
];

//here place magazines, weaponattachments and bodyitems(ex.: ItemGPS, ItemMap, Medikit, FirstAidKit, Binoculars, ...)
//used with addMagazineCargoGlobal
//"lootMagazine_list" array of [class, [magazinelist]]
//								class		: 0-civil (commercial), 1-military, 2-industrial (major), 3-research (medical), 4-residential, 5-industrial (minor)
//								magazinelist: list of magazine class names
lootMagazine_list = [
[ 0, [										// CIVIL (Commercial)
["sc_matchbook", 15],["sc_rawmeat", 15],["sc_cookedmeat", 25],["sc_knife", 25],["sc_bakedbeans", 15],
["sc_waterbottle", 15],["sc_canteenempty", 25],["sc_spraypaintblack", 75],["sc_spraypaintblue", 75],["sc_spraypaintgrey", 75],
["sc_spraypaintdarkblue", 75],["sc_siphonhose", 50],["sc_fuelcanisterempty", 50],["sc_packedtent", 80],
["7Rnd_408_Mag", 65],
["16Rnd_9x21_Mag", 25],
["30Rnd_9x21_Mag", 35],
["6Rnd_45ACP_Cylinder", 15],
["Trixie_Enfield_Mag", 20]
]],

[ 1, [									// MILITARY
["sc_matchbook", 75],["sc_bakedbeans", 75],["sc_canteenfull", 45],["sc_canteenempty", 35],["sc_spraypaintcamoorange", 90],
["sc_spraypaintcamopink", 90],["sc_fuelcanisterfull", 35],["sc_fuelcanisterempty", 35],["sc_motor", 75],["sc_packedtent", 65],
["11Rnd_45ACP_Mag", 15],
["150Rnd_762x51_Box", 55],
["150Rnd_762x51_Box_Tracer", 55],
["16Rnd_9x21_Mag", 15],
["10Rnd_762x51_Mag", 45],
["1Rnd_HE_Grenade_shell", 65],
["200Rnd_65x39_cased_Box", 55],
["200Rnd_65x39_cased_Box_Tracer", 55],
["20Rnd_556x45_UW_mag", 55],
["20Rnd_762x51_Mag", 55],
["30Rnd_45ACP_Mag_SMG_01", 15],
["30Rnd_45ACP_Mag_SMG_01_tracer_green", 15],
["30Rnd_556x45_Stanag", 15],
["30Rnd_556x45_Stanag_Tracer_Red", 25],
["30Rnd_556x45_Stanag_Tracer_Green", 25],
["30Rnd_556x45_Stanag_Tracer_Yellow", 25],
["30Rnd_65x39_caseless_green", 15],
["30Rnd_65x39_caseless_green_mag_Tracer", 25],
["30Rnd_65x39_caseless_mag", 15],
["30Rnd_65x39_caseless_mag_Tracer", 15],
["30Rnd_9x21_Mag", 15],
["3Rnd_HE_Grenade_shell", 55],
["5Rnd_127x108_Mag", 55],
["6Rnd_45ACP_Cylinder", 15],
["7Rnd_408_Mag", 55],
["9Rnd_45ACP_Mag", 15],
["NLAW_F", 70],
["RPG32_F", 70],
["RPG32_HE_F", 70],
["Titan_AT", 90],
["Titan_AP", 70]
]],

[ 2, [						// INDUSTRIAL (Major)
["sc_axe", 25],["sc_knife", 25],["sc_waterbottle", 45],["sc_matchbook", 55],["sc_canteenfull", 65],
["sc_canteenempty", 45],["sc_siphonhose", 25],["sc_fuelcanisterfull", 15],["sc_fuelcanisterempty", 10],["sc_motor", 45],
["sc_cartyre", 25],
["16Rnd_9x21_Mag", 15],
["150Rnd_762x51_Box", 55],
["150Rnd_762x51_Box_Tracer", 55],
["200Rnd_65x39_cased_Box", 55],
["200Rnd_65x39_cased_Box_Tracer", 55],
["30Rnd_9x21_Mag", 15],
["Trixie_CZ550_Mag", 10],
["Trixie_FNFAL_Mag", 10],
["Trixie_FNFAL_Mag_T", 15]
]],

[ 3, [						// RESEARCH (Medical)
["sc_axe", 35],["sc_knife", 15],["sc_waterbottle", 15],["sc_matchbook", 55],["sc_fuelcanisterfull", 55],
["11Rnd_45ACP_Mag", 15],
["30Rnd_45ACP_Mag_SMG_01", 15],
["30Rnd_45ACP_Mag_SMG_01_tracer_green", 15]
]],

[ 4, [						// RESIDENTIAL
["sc_knife", 25],["sc_cookedmeat", 15],["sc_waterbottle", 25],["sc_matchbook", 25],["sc_bakedbeans", 15],
["sc_siphonhose", 65],["sc_packedtent", 95],["sc_pillow", 15],
["11Rnd_45ACP_Mag", 75],
["16Rnd_9x21_Mag", 75],
["30Rnd_9x21_Mag", 75],
["9Rnd_45ACP_Mag", 75],
["Trixie_Enfield_Mag", 45]
]],

[ 5, [						// Industrial (Minor)
["sc_axe", 10],["sc_knife", 30],["sc_matchbook", 75],["sc_cartyre", 25],["sc_canteenfull", 75],["sc_canteenempty", 75],
["sc_spraypaintblack", 90],["sc_spraypaintblue", 90],["sc_spraypaintgrey", 90],["sc_siphonhose", 25],["sc_fuelcanisterfull", 25],
["sc_fuelcanisterempty", 25],["sc_motor", 75],
["16Rnd_9x21_Mag", 45],
["30Rnd_9x21_Mag", 55],
["9Rnd_45ACP_Mag", 45],
["Trixie_Enfield_Mag", 25]
]]
];

//here place hats, glasses, clothes, uniforms, vests
//used with addItemCargoGlobal
//"lootItem_list" array of [class, [itemlist]]
//								class		: 0-civil (commercial), 1-military, 2-industrial (major), 3-research (medical), 4-residential, 5-industrial (minor)
//								itemlist	: list of item class names
lootItem_list = [
[ 0, [							// CIVIL (Commercial)
["ItemWatch", 25],							// Watch
["ItemCompass", 45],							// Compass
["ItemMap", 15],								// Map
["FirstAidKit", 35],							// 1st Aid Kit
	// Vests [cap/arm]
// Slash Bandolier (Black,Coyote,Khaki,Olive,Green) - 60,1
["V_BandollierB_blk", 35],["V_BandollierB_cbr", 25],["V_BandollierB_khk", 25],["V_BandollierB_oli", 25],["V_BandollierB_rgr", 25],
// Chest rig (Khaki,Green,Black,Olive) - 100,1
["V_Chestrig_khk", 65],["V_Chestrig_rgr", 56],["V_Chestrig_blk", 75],["V_Chestrig_oli", 65],
	// Uniforms
["U_O_Wetsuit", 65], 		// Wetsuit
["U_IG_Guerilla1_1", 15], // Guerilla Smocks 1
["U_IG_Guerilla2_1", 15], // Guerilla Smocks 1
["U_IG_Guerilla2_2", 15], // Guerilla Smocks 2
["U_IG_Guerilla2_3", 15], // Guerilla Smocks 2
["U_IG_Guerilla3_1", 15], // Guerilla Smocks 3
["U_BG_Guerilla3_2", 15], // Guerilla Smocks 4
["U_I_HeliPilotCoveralls", 45], // Pilot Coveralls
	// Headgear
["H_BandMask_blk", 45], // Bandanna Mask (Black)
["H_BandMask_demon", 45], // Bandanna Mask (Demon)
["H_Shemag_khk", 65], // Shemag mask (Khaki)
["H_Shemag_olive", 65], // Shemag mask (Olive)
["H_Shemag_tan", 65], // Shemag mask (Tan)
["H_Booniehat_dirty", 55],
["H_Booniehat_grn", 55],
["H_Booniehat_indp", 55],
["H_Booniehat_khk", 55],
["H_Booniehat_mcamo", 55],
["H_Booniehat_tan", 55],
["H_Cap_brn_SPECOPS", 65],
["H_Cap_khaki_specops_UK", 65],
["H_Cap_oli", 25],
["H_Cap_red", 25],
["H_Cap_tan", 25],
["H_Cap_tan_specops_US", 35],
	// Glasses
["G_Sport_Blackred", 25],
["G_Tactical_Clear", 45],
["G_Spectacles", 15],
["G_Spectacles_Tinted", 25],
["G_Combat", 45],
["G_Lowprofile", 25],
["G_Shades_Green", 25],
["G_Shades_Red", 25],
["G_Squares", 25],
["G_Squares_Tinted", 25],
["G_Sport_BlackWhite", 25],
["G_Sport_Blackyellow", 25],
["G_Sport_Greenblack", 25],
["G_Sport_Checkered", 25],
["G_Sport_Red", 25],
["G_Tactical_Black", 65],
// Attachments
["optic_SOS", 65]							// Sniper Optical Sights
]],
[ 1, [						// MILITARY
["ItemGPS", 25], 								// GPS
["ItemCompass", 25],							// Compass
["ItemMap", 25],								// Map
["FirstAidKit", 25],							// 1st Aid Kit
["Rangefinder", 25],							// Rangefinder
["NVGoggles", 75],							// NV Goggles (Brown)
["ToolKit", 45],
	// Vests [mass/capacity/armor]
// 80 	100 	4
["V_PlateCarrier1_blk", 15],["V_PlateCarrier1_rgr", 15],["V_PlateCarrier2_rgr", 15],
// 100 	100 	5
["V_PlateCarrier3_rgr", 25],
// 80 	100 	4	
["V_PlateCarrierIA1_dgtl", 15],
// 60 	100 	3
["V_TacVest_blk", 15],["V_TacVest_blk_POLICE", 15],["V_TacVest_brn", 20],["V_TacVest_camo", 20],["V_TacVest_khk", 20],["V_TacVest_oli", 20],["V_TacVestCamo_khk", 20],["V_TacVestIR_blk", 20],
// 40 	120 	2
["V_HarnessO_brn", 30],["V_HarnessO_gry", 30],["V_HarnessOGL_brn", 30],["V_HarnessOGL_gry", 30],["V_HarnessOSpec_brn", 30],["V_HarnessOSpec_gry", 30],
// 80 	120 	4
["V_PlateCarrierGL_rgr", 35],["V_PlateCarrierIA2_dgtl", 35],["V_PlateCarrierIAGL_dgtl", 35],["V_PlateCarrierSpec_rgr", 35],

	// Uniforms [mass/capacity]
["U_B_CombatUniform_mcam", 15],	// 40 	40
["U_B_CombatUniform_mcam_tshirt", 15],	// 40 	40 (wearable)
["U_B_CombatUniform_mcam_vest", 15],	// 40 	40
["U_B_CombatUniform_mcam_worn", 15],	// 40 	40
//["U_B_CombatUniform_sgg", 15],	// 40 	40 (Unwearable)
["U_B_CombatUniform_sgg_tshirt", 15],	// 40 	40
["U_B_CombatUniform_sgg_vest", 15],	// 40 	40
//["U_B_CombatUniform_wdl", 15],	// 40 	40 (Unwearble)
["U_B_CombatUniform_wdl_tshirt", 15],	// 40 	40
// ["U_B_CombatUniform_wdl_vest", 15],	// 40 	40 (Unwearable)
["U_B_GhillieSuit", 75],	// 60 	60
["U_B_HeliPilotCoveralls", 45],	// 60 	60
["U_B_PilotCoveralls", 40],	// 80 	60
["U_B_SpecopsUniform_sgg", 25],	// 40 	40
["U_B_Wetsuit", 75],	// 80 	90
["U_I_CombatUniform", 40],	// 50 	50
["U_I_CombatUniform_shortsleeve", 40],	// 50 	50
["U_I_CombatUniform_tshirt", 40],	// 50 	50
["U_I_GhillieSuit", 75],	// 50 	50
["U_I_HeliPilotCoveralls", 40],	// 50 	50
["U_I_OfficerUniform", 40],	// 50 	50
["U_I_pilotCoveralls", 40],	// 50 	50
["U_I_Wetsuit", 75],	// 80 	90
["U_O_CombatUniform_ocamo", 40],	// 60 	40
["U_O_CombatUniform_oucamo", 40],	// 60 	40
["U_O_GhillieSuit", 80],	// 60 	60
["U_O_OfficerUniform_ocamo", 40],	// 60 	40
["U_O_PilotCoveralls", 40],	// 80 	60
["U_O_SpecopsUniform_blk", 40],	// 60 	40
["U_O_SpecopsUniform_ocamo", 40],	// 60 	40 (wearable)
["U_O_Wetsuit", 75],	// 80 	90
	// Headgear
["H_CrewHelmetHeli_B", 40],
["H_CrewHelmetHeli_I", 40],
["H_HelmetB_plain_blk", 40],
["H_HelmetB_plain_mcamo", 40],
["H_HelmetCrew_B", 40],
["H_HelmetO_oucamo", 40],
["H_HelmetSpecB", 40],
// Attachments
["acc_flashlight", 15],			// Flashlight - Weapon mounted light.
["acc_pointer_IR", 40],			// IR Laser Pointer - Emits light visible in the image intensification mode (night vision).
["muzzle_snds_H", 25],			// Sound Suppressor (6.5 mm)
["muzzle_snds_L", 20],			// Sound Suppressor (9 mm)
["muzzle_snds_M", 25],			//	Sound Suppressor (5.56 mm)
["muzzle_snds_B", 40],			// Sound Suppressor (7.62 mm)
["muzzle_snds_H_MG", 40],			// Sound Suppressor LMG (6.5 mm)
["muzzle_snds_acp", 40],			// Sound Suppressor (.45 ACP)
["optic_Arco", 40],				// ARCO - Advanced Rifle Combat Optics Magnification: 10x
["optic_Hamr", 40],				// RCO - Rifle Combat Optics Magnification: 10x
["optic_Aco", 25],				// ACO (Red) - Advanced Collimator Optics Color: Red
["optic_ACO_grn", 25],			// ACO (Green) - Advanced Collimator Optics Color: Green
["optic_Aco_smg", 25],			// ACO SMG (Red) - Advanced Collimator Optics Color: Red
["optic_ACO_grn_smg", 25],		// ACO SMG (Green) - Advanced Collimator Optics Color: Green
["optic_Holosight", 15],			// MK17 Holosight - Mk17 Holosight Magnification: 1x-2x
["optic_Holosight_smg", 15],		// Mk17 Holosight SMG - Mk17 Holosight Magnification: 1x-2x
["optic_SOS", 55],				// SOS - Sniper Optical Sights Magnification: 18x-75x
["optic_MRCO", 35],				// MRCO - MRCO Magnification: 1x-6x
["optic_DMS", 45],				// DMS - DMS Magnification: 1x-12x
["optic_Yorris", 25],				// Yorris J2 - Y-J2 Magnification: 1x
["optic_MRD", 25],				// MRD - MRD Magnification: 1x
["optic_LRPS", 65],				// LRPS - Long-Range Precision Scope Magnification: 18x-75x
["optic_NVS", 75],				// NVS - Night Vision Scope Magnification: 10x
["optic_Nightstalker", 75],		// Nightstalker - Nightstalker Sight Magnification: 5x-25x
["optic_tws", 75],				// TWS - Thermal Weapon Sight Magnification: 10x-23x
["optic_tws_mg", 75]				// TWS MG - Thermal Weapon Sight for Machineguns Magnification: 12x-27x
]],
[ 2, [						// INDUSTRIAL (MAJOR)
["ItemGPS", 65], 						// GPS
["Rangefinder", 65],					// Rangefinder
["FirstAidKit", 25],					// 1st Aid Kit
["ToolKit", 15],
// Vests [mass/capacity/armor]
["V_TacVest_camo", 55],			// 60 	100 	3
["V_TacVest_khk", 55],			// 60 	100 	3
["V_TacVest_oli", 55],			// 60 	100 	3
["V_HarnessOGL_gry", 65],			// 40 	120 	2
// Uniforms [mass/capacity]
["U_B_HeliPilotCoveralls", 45],	// 60 	60
["U_B_PilotCoveralls", 55],		// 80 	60
["U_O_PilotCoveralls", 55],		// 80 	60
// Headgear
["H_HelmetCrew_I", 25],
["H_MilCap_gry", 25],
["H_BandMask_reaper", 25],
// Attachments
["acc_flashlight", 15],				// Flashlight - Weapon mounted light.
["optic_MRCO", 45]					// MRCO - MRCO Magnification: 1x-6x
]],
[ 3, [						// RESEARCH
["ItemGPS", 45], 						// GPS
["ItemMap", 25],						// Map
["NVGoggles", 65],					// NV Goggles (Brown)
["FirstAidKit", 25],					// 1st Aid Kit
	// Vests [mass/capacity/armor]
["V_PlateCarrier1_blk", 55],		// 80 	100 	4
["V_PlateCarrier1_rgr", 55],		// 80 	100 	4
["V_PlateCarrier2_rgr", 55],		// 80 	100 	4
["V_PlateCarrier3_rgr", 60],		// 100 	100 	5
["V_PlateCarrierIA1_dgtl", 55],	// 80 	100 	4
["V_TacVest_blk", 55],			// 60 	100 	3
["V_TacVest_blk_POLICE", 55],		// 60 	100 	3
["V_TacVest_brn", 50],			// 60 	100 	3
["V_TacVest_camo", 50],			// 60 	100 	3
["V_TacVest_khk", 50],			// 60 	100 	3
["V_TacVest_oli", 50],			// 60 	100 	3
["V_TacVestCamo_khk", 50],		// 60 	100 	3
["V_TacVestIR_blk", 50],			// 60 	100 	3
// Uniforms
["U_OI_Scientist", 15], 	// 30	30
["U_IG_leader", 50],		// 30	30
["U_C_Scavenger_1", 40],	// 30	30
["U_C_Scavenger_2", 40],	// 30	30
// Attachments
["muzzle_snds_acp", 45]				// Sound Suppressor (.45 ACP)
]],
[ 4, [						// RESIDENTIAL
["ItemCompass", 50],					// Compass
["ItemMap", 35],						// Map
["ItemWatch", 25],					// Watch
["FirstAidKit", 25],							// 1st Aid Kit
// Vests
["V_TacVest_blk_POLICE", 50],		// 60 	100 	3
["V_TacVest_brn", 40],			// 60 	100 	3
// Uniforms
["U_IG_Guerilla1_1", 50], // Guerilla Smocks 1
["U_IG_Guerilla2_1", 50], // Guerilla Smocks 1
["U_IG_Guerilla2_2", 50], // Guerilla Smocks 2
["U_IG_Guerilla2_3", 50], // Guerilla Smocks 2
["U_IG_Guerilla3_1", 50], // Guerilla Smocks 3
["U_BG_Guerilla3_2", 50], // Guerilla Smocks 4
// Headgear
["H_Cap_blk", 50],
["H_Cap_blk_CMMG", 50],
["H_Cap_blk_ION", 50],
["H_Cap_blk_Raven", 50],
["H_Cap_blu", 50],
["H_Cap_grn", 50],
["H_Cap_grn_BI", 50],
["H_Cap_headphones", 50],
["H_Hat_blue", 70],
["H_Hat_brown", 70],
["H_Hat_camo", 70],
["H_Hat_checker", 70],
["H_Hat_grey", 70],
["H_Hat_tan", 70],
["H_Shemag_khk", 80],
["H_Shemag_olive", 80],
["H_Shemag_tan", 80],
["H_ShemagOpen_khk", 80],
["H_ShemagOpen_tan", 80],
["H_StrawHat", 90],
["H_StrawHat_dark", 90],
["H_TurbanO_blk", 80],
// Attachments
["muzzle_snds_acp", 75],			// Sound Suppressor (.45 ACP)
["muzzle_snds_L", 45]				// Sound Suppressor (9 mm)
]],
[ 5, [						// INDUSTRIAL (Light)
["ItemMap", 50],						// Map
["ToolKit", 35],
// Uniforms
["U_O_PilotCoveralls", 80],		// 80 	60
// Headgear
["H_Bandanna_camo", 60],
["H_Bandanna_cbr", 55],
["H_Bandanna_gry", 40],
// Attachments
["acc_flashlight", 80]			// Flashlight - Weapon mounted light.
]]
];

//here place backpacks, parachutes and packed drones/stationary
//used with addBackpackCargoGlobal
//"lootBackpack_list" array of [class, [backpacklist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								backpacklist: list of backpack class names
lootBackpack_list = [
[ 0, [							// CIVIL (Commercial)
// Item [Capacity	Mass]
["B_Kitbag_mcamo", 55], 	// 200 	25
["B_Kitbag_sgg", 45], 	// 200 	25
["B_Kitbag_cbr", 40], 	// 200 	25
["B_FieldPack_blk", 90], 	// 240 	30
["B_FieldPack_ocamo", 80], 	// 240 	30
["B_FieldPack_oucamo", 80], 	// 240 	30
["B_FieldPack_cbr", 80] 	// 240 	30 
]],
[ 1, [						// MILITARY
// Item 				[Capacity	Mass]
["B_FieldPack_blk", 45], 		// 240 	30
["B_FieldPack_ocamo", 45], 	// 240 	30
["B_FieldPack_oucamo", 45], 	// 240 	30
["B_FieldPack_cbr", 45], 	// 240 	30
["B_Bergen_sgg", 55], 		// 280 	35
["B_Bergen_mcamo", 55], 		// 280 	35
["B_Bergen_rgr", 55], 		// 280 	35
["B_Bergen_blk", 55], 		// 280 	35
["B_Carryall_ocamo", 90], 	// 320 	40
["B_Carryall_oucamo", 90], 	// 320 	40
["B_Carryall_mcamo", 90], 	// 320 	40
["B_Carryall_oli", 90], 		// 320 	40
["B_Carryall_khk", 90], 		// 320 	40
["B_Carryall_cbr", 90]		// 320 	40 
]],
[ 2, [						// INDUSTRIAL
// Item					[Capacity	Mass]
["B_FieldPack_oucamo", 40], 	// 240 	30
["B_FieldPack_cbr", 40], 		// 240 	30
["B_Bergen_sgg", 65], 		// 280 	35
["B_Bergen_mcamo", 65] 		// 280 	35 
]],
[ 3, [						// RESEARCH
// Item				[Capacity	Mass]
["B_Kitbag_mcamo", 65], 	// 200 	25
["B_Kitbag_sgg", 55], 	// 200 	25
["B_Kitbag_cbr", 30] 		// 200 	25 
]],
[ 4, [						// RESIDENTIAL
["B_AssaultPack_rgr", 35], 	// 160 	20
["B_AssaultPack_sgg", 40], 	// 160 	20
["B_AssaultPack_blk", 45], 	// 160 	20
["B_AssaultPack_cbr", 40], 	// 160 	20
["B_AssaultPack_mcamo", 40], 	// 160 	20
["B_Kitbag_sgg", 55], 	// 200 	25
["B_Bergen_blk", 75], 	// 280 	35
["B_FieldPack_cbr", 65] 	// 240 	30
]],

[ 5, [						// INDUSTRIAL (Light)
["B_Kitbag_mcamo", 35],	// 200 	25
["B_Kitbag_sgg", 35],	// 200 	25
["B_Kitbag_cbr", 35],	// 200 	25
["B_FieldPack_ocamo", 65]	// 240 	30 
]]
];

//here place any other objects(ex.: Land_Basket_F, Box_East_Wps_F, Land_Can_V3_F, ...)
//used with createVehicle directly
//"lootworldObject_list" array of [class, [objectlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								objectlist	: list of worldobject class names
lootworldObject_list = [
	[ 0, [							// CIVIL (Commercial

	]],
	[ 1, [						// MILITARY

	]],
	[ 2, [						// INDUSTRIAL

	]],
	[ 3, [						// RESEARCH

	]],
	[ 4, [						// RESIDENTIAL
		"Land_CanisterFuel_F"
	]],
	[ 5, [						// INDUSTRIAL (Light)

	]]
];