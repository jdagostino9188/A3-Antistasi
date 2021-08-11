//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Soviets"] call _fnc_saveToTemplate;
["spawnMarkerName", "Soviet Reinforcements"] call _fnc_saveToTemplate;

["flag", "LIB_FlagCarrier_SU"] call _fnc_saveToTemplate;
["flagTexture", "\WW2\Core_t\IF_Decals_t\Ussr\flag_SU_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "LIB_Faction_RKKA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "LIB_AmmoCrate_Arty_SU"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["LIB_GazM1_SOV"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_GazM1_SOV","LIB_GazM1_SOV_camo_sand","LIB_Willys_MB_w"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["LIB_Scout_m3_w","LIB_UK_Willys_MB_M1919_w"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["LIB_Zis5v_w","LIB_US6_Tent"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["LIB_US6_Tent_Cargo"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_OpelBlitz_Ammo_w"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_Zis6_parm_w"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_Zis5v_fuel_w"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_Zis5v_med_w"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["LIB_Scout_m3_w","LIB_SOV_M3_Halftrack_w"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["LIB_SU85_w","LIB_T34_76_w","LIB_T34_85_w","LIB_M4A2_SOV_w","LIB_JS2_43_w"]] call _fnc_saveToTemplate;
["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", []] call _fnc_saveToTemplate;				//this line determines IFVs


["vehiclesTransportBoats", ["LIB_LCA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["LIB_UK_LCI"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["LIB_Pe2_2_w"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["LIB_P39_w"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["LIB_Li2"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["not_supported"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["not_supported"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["not_supported"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["LIB_US6_BM13"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["LIB_US6_BM13", ["LIB_16Rnd_BM13"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["not_supported"]] call _fnc_saveToTemplate;
["uavsPortable", ["not_supported"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["LIB_UK_Willys_MB_M1919_w"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["LIB_US6_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_Willys_MB_w"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_GazM1_SOV_camo_sand"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["LIB_Zis3_w"]] call _fnc_saveToTemplate;
["staticAA", ["LIB_61k"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_BM37"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_1rnd_82mmHE_BM37"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "LIB_82mm_BM37_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
//Not Magazine type would be: ["APERSBoundingMine", "APERSMine", "ATMine"]
["minefieldAT", ["LIB_TM44_MINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_PMD6_MINE"]] call _fnc_saveToTemplate;

//PvP definitions
["playerDefaultLoadout", []] call _fnc_saveToTemplate;
["pvpLoadouts", []] call _fnc_saveToTemplate;
["pvpVehicles", []] call _fnc_saveToTemplate;


//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
["LIB_PzFaust_30m", "", "", "",[""], [], ""], 
["LIB_PzFaust_60m", "", "", "",[""], [], ""]]];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", [
["LIB_M1A1_Bazooka", "", "", "",["LIB_1Rnd_60mm_M6"], [], ""],
["LIB_RPzB", "", "", "",["LIB_1Rnd_RPzB"], [], ""]]];
_loadoutData set ["AALaunchers", [["LIB_M1A1_Bazooka", "", "", "",["LIB_1Rnd_60mm_M6"], [], ""]]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["LIB_TM44_MINE_mag"]];
_loadoutData set ["APMines", ["LIB_PMD6_MINE_mag"]];
_loadoutData set ["lightExplosives", ["LIB_Ladung_Small_MINE_mag"]];
_loadoutData set ["heavyExplosives", ["LIB_Ladung_Big_MINE_mag"]];

_loadoutData set ["antiTankGrenades", ["LIB_Rpg6"]];
_loadoutData set ["antiInfantryGrenades", ["LIB_Rg42"]];
_loadoutData set ["smokeGrenades", ["LIB_RDG"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["LIB_GER_ItemWatch"]];
_loadoutData set ["compasses", ["LIB_GER_ItemCompass_deg"]];
_loadoutData set ["radios", []];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["LIB_Binocular_SU"]];
_loadoutData set ["rangefinder", ["LIB_Binocular_SU"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadleader_extras", []];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["Toolkit", "MineDetector"]];
_loadoutData set ["items_engineer_extras", ["Toolkit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", []];
_loadoutData set ["items_sniper_extras", []];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["U_LIB_SOV_Sniper_w"]];
_sfLoadoutData set ["vests", ["V_LIB_SOV_IShBrVestMG","V_LIB_SOV_IShBrVestPPShMag"]];
_sfLoadoutData set ["backpacks", ["B_LIB_SOV_RA_Rucksack2_Green"]];
_sfLoadoutData set ["helmets", ["H_LIB_SOV_RA_Helmet_w"]];
_sfLoadoutData set ["binoculars", ["LIB_Binocular_GER"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54_b30","LIB_5Rnd_762x54_D"], [], ""],
        ["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""]]];
_sfLoadoutData set ["carbines", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""],
        ["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""]]];
_sfLoadoutData set ["grenadeLaunchers", [["LIB_M9130_DYAKONOV", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_sfLoadoutData set ["SMGs", [["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25_ap"], [], ""],
        ["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""]]];
_sfLoadoutData set ["machineGuns", [["LIB_DT_OPTIC", "", "", "", ["LIB_63Rnd_762x54d"], [], ""],
        ["LIB_DT", "", "", "", ["LIB_63Rnd_762x54"], [], ""],
	["LIB_DP28", "", "", "", ["LIB_47Rnd_762x54"], [], ""]]];
_sfLoadoutData set ["marksmanRifles", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""],
        ["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]]];
_sfLoadoutData set ["sniperRifles", [["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54_b30"], [], ""]]];
_sfLoadoutData set ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""]]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_LIB_SOV_Strelok_2_w"]];
_militaryLoadoutData set ["vests", ["V_LIB_SOV_RA_MosinBelt","V_LIB_SOV_RA_PPShBelt"]];
_militaryLoadoutData set ["backpacks", ["B_LIB_SOV_RA_Rucksack"]];
_militaryLoadoutData set ["helmets", ["H_LIB_SOV_Ushanka","H_LIB_SOV_RA_Helmet_w"]];
_militaryLoadoutData set ["binoculars", ["LIB_Binocular_GER"]];

_militaryLoadoutData set ["rifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""],
        ["LIB_M38", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""],
	["LIB_M44", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""]]];
_militaryLoadoutData set ["carbines", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""],
        ["LIB_M38", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""],
	["LIB_M44", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""]]];
_militaryLoadoutData set ["grenadeLaunchers", [["LIB_M9130_DYAKONOV", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_militaryLoadoutData set ["SMGs", [["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""],
        ["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25_t2"], [], ""]]];
_militaryLoadoutData set ["machineGuns", [["LIB_DT", "", "", "", ["LIB_63Rnd_762x54"], [], ""],
        ["LIB_DP28", "", "", "", ["LIB_47Rnd_762x54"], [], ""]]];
_militaryLoadoutData set ["marksmanRifles", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""],
        ["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militaryLoadoutData set ["sniperRifles", [["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54_b30","LIB_5Rnd_762x54","LIB_5Rnd_762x54"], [], ""]]];
_militaryLoadoutData set ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_LIB_NKVD_Leutenant"]];
_policeLoadoutData set ["vests", ["V_LIB_SOV_RA_OfficerVest"]];
_policeLoadoutData set ["helmets", ["H_LIB_NKVD_OfficerCap"]];

_policeLoadoutData set ["SMGs", [["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25"], [], ""]]];
_policeLoadoutData set ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""],
        ["LIB_M1896", "", "", "", ["LIB_10Rnd_9x19_M1896"], [], ""]]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["U_LIB_SOV_Strelok_w"]];
_militiaLoadoutData set ["vests", ["V_LIB_SOV_RA_MosinBelt","V_LIB_SOV_RA_PPShBelt"]];
_militiaLoadoutData set ["backpacks", ["B_LIB_SOV_RA_Rucksack"]];
_militiaLoadoutData set ["helmets", ["H_LIB_SOV_Ushanka"]];

_militiaLoadoutData set ["rifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""],
        ["LIB_M38", "", "", "", ["LIB_5Rnd_762x54"], [], ""],
	["LIB_M44", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militiaLoadoutData set ["carbines", [["LIB_M38", "", "", "", ["LIB_5Rnd_762x54"], [], ""],
        ["LIB_M44", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militiaLoadoutData set ["grenadeLaunchers", [["LIB_M9130_DYAKONOV", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_militiaLoadoutData set ["SMGs", [["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""],
        ["LIB_MP40", "", "", "", ["LIB_32rnd_9x19"], [], ""]]];
_militiaLoadoutData set ["machineGuns", [["LIB_DP28", "", "", "", ["LIB_47Rnd_762x54"], [], ""]]];
_militiaLoadoutData set ["marksmanRifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54_t30"], [], ""],
        ["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""]]];
_militiaLoadoutData set ["sniperRifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54_t46"], [], ""],
        ["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militiaLoadoutData set ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""],
        ["LIB_M1896", "", "", "", ["LIB_10Rnd_9x19_M1896"], [], ""]]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_LIB_SOV_Tank_ryadovoi"]];
_crewLoadoutData set ["vests", ["V_LIB_SOV_RAZV_MGBelt"]];
_crewLoadoutData set ["helmets", ["H_LIB_SOV_TankHelmet"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_LIB_SOV_Pilot"]];
_pilotLoadoutData set ["vests", ["V_LIB_SOV_RA_Belt"]];
_pilotLoadoutData set ["helmets", ["H_LIB_SOV_PilotHelmet"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;
	["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_rifleman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;
  [selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_medic"] call _fnc_addItemSet;
	["items_medic_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 4] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;
	

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["lightExplosives", 2] call _fnc_addItem;
	if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_engineer_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	[["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 1] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_lat_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	[selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 2] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_at_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 2] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_aa_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_machineGunner_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["marksmanRifles"] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_marksman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["sniperRifles"] call _fnc_setPrimary;
	["primary", 7] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_sniper_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["smgs"] call _fnc_setPrimary;
	["primary", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_police_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
	["primary", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_crew_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
	call _unarmedTemplate;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Rifleman", _riflemanTemplate],
	["Medic", _medicTemplate, [["medic", true]]],
	["Engineer", _engineerTemplate, [["engineer", true]]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
	["Grenadier", _grenadierTemplate],
	["LAT", _latTemplate],
	["AT", _atTemplate],
	["AA", _aaTemplate],
	["MachineGunner", _machineGunnerTemplate],
	["Marksman", _marksmanTemplate],
	["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
	params ["_name", "_loadoutTemplate"];
	private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
	private _finalName = _prefix + _name;
	[_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Rifleman", _riflemanTemplate],
	["Medic", _medicTemplate, [["medic", true]]],
	["Engineer", _engineerTemplate, [["engineer", true]]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
	["Grenadier", _grenadierTemplate],
	["LAT", _latTemplate],
	["AT", _atTemplate],
	["AA", _aaTemplate],
	["MachineGunner", _machineGunnerTemplate],
	["Marksman", _marksmanTemplate],
	["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate],
	["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Rifleman", _riflemanTemplate],
	["Medic", _medicTemplate, [["medic", true]]],
	["Engineer", _engineerTemplate, [["engineer", true]]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
	["Grenadier", _grenadierTemplate],
	["LAT", _latTemplate],
	["AT", _atTemplate],
	["AA", _aaTemplate],
	["MachineGunner", _machineGunnerTemplate],
	["Marksman", _marksmanTemplate],
	["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
