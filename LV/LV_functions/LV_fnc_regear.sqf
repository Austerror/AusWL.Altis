waitUntil {!isNil "bis_fnc_init"};

_civ_clothes = [
	"U_IG_Guerilla2_1",
	"U_IG_Guerilla2_2",
	"U_IG_Guerilla2_3",
	"U_IG_Guerilla3_1",
	"U_IG_Guerilla3_2",
	"U_C_Journalist", // pretty sure journalist works
	"U_B_HeliPilotCoveralls"];
_aus_surv_items = ["sc_canteenfull", "sc_canteenempty", "sc_bakedbeans"]; // multiple items like food/drink
_aus_misc_items = ["sc_matchbook", "sc_knife"]; // singular items like sc_matchbook
_civ_hats =["H_Cap_blk",
			"H_Cap_grn",
			"H_Cap_tan",
			"H_Cap_red",
			"H_Hat_tan",
			"H_Hat_grey",
			"H_StrawHat",
			"H_Watchcap_blk"];

_vests       = ["V_Rangemaster_Belt",
                "V_TacVest_brn",
                "V_BandollierB_cbr"];

_unit = _this;


// Remove original equipment
removeAllWeapons _unit;
removeUniform _unit;
removeHeadgear _unit;
removeVest _unit;
removeBackpack _unit;
_unit unassignItem "NVGoggles";
_unit removeItem "NVGoggles";


// Add vest and clothing
_vest_item = _vests call BIS_fnc_selectRandom;
_unit addVest _vest_item;

_cloth_item = _civ_clothes call BIS_fnc_selectRandom;
_unit addUniform _cloth_item;

// austerror items
if(round (random 1) == 1) then // check if they're equipped with any aus surv items
{
	_surv_item = _aus_surv_items call BIS_fnc_selectRandom;
	_surv_item_count = random (2) + 1;
	_unit addMagazines [_surv_item, _surv_item_count];
};
if(round (random 1) == 1) then // check if they're equipped with any aus misc items
{
	_misc_item = _aus_misc_items call BIS_fnc_selectRandom;
	_unit addMagazine _misc_item;
};

// Random integer, if 1 instead of 0, add a random item from the array
if(round (random 1) == 1) then
{
    _hat_item = _civ_hats call BIS_fnc_selectRandom;
	_unit addHeadgear _hat_item;
};

// Random weapon loadout
_magCount1 = random (2) + 1;
_magCount2 = random (2) + 1;
_grenadeCount1 = random (1) + 1;
switch (round(random 7)) do
{
        case 0:
        {
                _unit addMagazines ["9Rnd_45ACP_Mag", _magCount1];
                _unit addWeapon "hgun_ACPC2_F";
				_unit addMagazines ["HandGrenade", _grenadeCount1];
        };
        case 1:
        {
                _unit addMagazines ["30Rnd_65x39_caseless_mag_Tracer", _magCount1];
                _unit addWeapon "arifle_MXC_F";
                _unit addMagazines ["30Rnd_9x21_Mag", _magCount2];
                _unit addWeapon "hgun_Rook40_F";
        };
        case 2:
        {
                _unit addMagazines ["Trixie_Enfield_Mag", _magCount1];
                _unit addWeapon "Trixie_Enfield";
                _unit addMagazines ["30Rnd_9x21_Mag", _magCount2];
                _unit addWeapon "hgun_Rook40_F";
				_unit addMagazines ["HandGrenade", _grenadeCount1];
        };
        case 3:
        {
                _unit addMagazines ["Trixie_Enfield_Mag", _magCount1];
                _unit addWeapon "Trixie_Enfield";
                _unit addMagazines ["6Rnd_45ACP_Cylinder", _magCount2];
                _unit addWeapon "hgun_Pistol_heavy_02_Yorris_F";
        };
        case 4:
        {
                _unit addMagazines ["Trixie_Enfield_Mag", _magCount1];
                _unit addWeapon "Trixie_Enfield";
                _unit addMagazines ["30Rnd_9x21_Mag", _magCount2];
                _unit addWeapon "hgun_Rook40_F";
        }; 
		case 5:
        {
                _unit addMagazines ["Trixie_Enfield_Mag", _magCount1];
                _unit addWeapon "Trixie_Enfield";
                _unit addMagazines ["30Rnd_9x21_Mag", _magCount2];
                _unit addWeapon "hgun_Rook40_F";
        };
		case 6:
        {
                _unit addMagazines ["Trixie_Enfield_Mag", _magCount1];
                _unit addWeapon "Trixie_Enfield";
                _unit addMagazines ["30Rnd_9x21_Mag", _magCount2];
                _unit addWeapon "hgun_Rook40_F";
        };
};