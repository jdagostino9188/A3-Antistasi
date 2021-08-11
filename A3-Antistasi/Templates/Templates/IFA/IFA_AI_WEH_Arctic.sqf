//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Wehrmacht"] call _fnc_saveToTemplate;
["spawnMarkerName", "Wehrmacht Reinforcements"] call _fnc_saveToTemplate;

["flag", "LIB_FlagCarrier_GER"] call _fnc_saveToTemplate;
["flagTexture", "ww2\core_t\if_decals_t\german\flag_ger_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "LIB_faction_WEHRMACHT"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "LIB_AmmoCrate_Arty_SU"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["LIB_Kfz1_w"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Kfz1_w","LIB_Kfz1_Hood_w"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["LIB_Kfz1_MG42_sernyt"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["LIB_OpelBlitz_Open_Y_Camo_w","LIB_OpelBlitz_Tent_Y_Camo_w","LIB_SdKfz_7_w"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["LIB_OpelBlitz_Open_Y_Camo_w","LIB_SdKfz_7_w"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_OpelBlitz_Ammo_w"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_OpelBlitz_Parm_w"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_OpelBlitz_Fuel_w"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_OpelBlitz_Ambulance_w"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["LIB_SdKfz251_FFV_w","LIB_SdKfz251_w"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["LIB_PzKpfwVI_E_w","LIB_PzKpfwIV_H_w","LIB_StuG_III_G_w","LIB_PzKpfwV_w","LIB_PzKpfwVI_B_w"]] call _fnc_saveToTemplate;
["vehiclesAA", ["LIB_FlakPanzerIV_Wirbelwind_w"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["not_supported"]] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", ["not_supported"]] call _fnc_saveToTemplate;				//this line determines IFVs


["vehiclesTransportBoats", ["LIB_LCA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["LIB_UK_LCI"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["not_supported"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["LIB_Ju87_w"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["LIB_FW190F8_2_w"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["LIB_C47_RAF_snafu"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["not_supported"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["not_supported"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["not_supported"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["LIB_leFH18"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["LIB_leFH18", ["LIB_20x_Shell_105L28_Gr39HlC_HE","LIB_20x_Shell_105L28_Gr38_HE"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["not_supported"]] call _fnc_saveToTemplate;
["uavsPortable", ["not_supported"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["LIB_Kfz1_MG42_sernyt"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["LIB_OpelBlitz_Open_Y_Camo_w","LIB_OpelBlitz_Tent_Y_Camo_w"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_Kfz1_w","LIB_Kfz1_Hood_w"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_Kfz1_w"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["LIB_Pak40_w"]] call _fnc_saveToTemplate;
["staticAA", ["LIB_FlaK_38_w"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_GrWr34"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_1rnd_81mmHE_GRWR34"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "LIB_81mm_GRWR34_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
//Not Magazine type would be: ["APERSBoundingMine", "APERSMine", "ATMine"]
["minefieldAT", ["LIB_TMI_42_MINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_shumine_42_MINE"]] call _fnc_saveToTemplate;

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
["LIB_PzFaust_60m", "", "", "",[""], [], ""], 
["LIB_Faustpatrone", "", "", "",[""], [], ""]]];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", [
["LIB_RPzB", "", "", "",["LIB_1Rnd_RPzB"], [], ""]]];
_loadoutData set ["AALaunchers", [["LIB_RPzB", "", "", "",["LIB_1Rnd_RPzB"], [], ""]]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["LIB_STMI_MINE_mag"]];
_loadoutData set ["APMines", ["LIB_SMI_35_MINE_mag"]];
_loadoutData set ["lightExplosives", ["LIB_Ladung_Small_MINE_mag"]];
_loadoutData set ["heavyExplosives", ["LIB_Ladung_Big_MINE_mag"]];

_loadoutData set ["antiTankGrenades", ["lib_shg24x7"]];
_loadoutData set ["antiInfantryGrenades", ["lib_shg24"]];
_loadoutData set ["smokeGrenades", ["LIB_NB39"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["LIB_GER_ItemWatch"]];
_loadoutData set ["compasses", ["LIB_GER_ItemCompass_deg"]];
_loadoutData set ["radios", []];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["LIB_Binocular_GER"]];
_loadoutData set ["rangefinder", ["LIB_Binocular_GER"]];

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
_sfLoadoutData set ["uniforms", ["U_LIB_GER_Scharfschutze_w","U_LIB_GER_Scharfschutze_2_w"]];
_sfLoadoutData set ["vests", ["V_LIB_GER_VestMP40","V_LIB_GER_VestKar98","V_LIB_GER_VestG43","V_LIB_GER_OfficerVest"]];
_sfLoadoutData set ["backpacks", ["B_LIB_GER_Tonister34_cowhide","B_LIB_GER_Backpack"]];
_sfLoadoutData set ["helmets", ["H_LIB_GER_FSJ_M44_Helmet_Winter"]];
_sfLoadoutData set ["binoculars", ["LIB_Binocular_GER"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [["LIB_G43", "", "", "", ["LIB_10Rnd_792x57","LIB_10Rnd_792x57","LIB_10Rnd_792x57","LIB_10Rnd_792x57_SMK","LIB_10Rnd_792x57_T","LIB_10Rnd_792x57_sS","LIB_10Rnd_792x57_T2"], [], ""],
        ["LIB_G41", "", "", "", ["LIB_10Rnd_792x57_clip"], [], ""]]];
_sfLoadoutData set ["carbines", [["LIB_MP44", "", "", "", ["LIB_30Rnd_792x33","LIB_30Rnd_792x33","LIB_30rnd_792x33_t"], [], ""],
        ["LIB_MP40", "", "", "", ["LIB_32Rnd_9x19","LIB_32Rnd_9x19","LIB_32rnd_9x19_t"], [], ""]]];
_sfLoadoutData set ["grenadeLaunchers", [["LIB_MP44", "lib_acc_gw_sb_empty", "", "", ["LIB_30Rnd_792x33","LIB_30Rnd_792x33","LIB_30rnd_792x33_t"], ["LIB_1Rnd_G_PZGR_40"], ""],
        ["LIB_K98", "lib_acc_gw_sb_empty", "", "", ["LIB_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_30"], ""],
	["LIB_K98_Late", "lib_acc_gw_sb_empty", "", "", ["LIB_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_40"], ""]]];
_sfLoadoutData set ["SMGs", [["LIB_FG42G", "", "", "", ["LIB_20Rnd_792x57"], [], ""],
        ["LIB_MP40", "", "", "", ["LIB_32Rnd_9x19","LIB_32Rnd_9x19","LIB_32rnd_9x19_t"], [], ""]]];
_sfLoadoutData set ["machineGuns", [["LIB_MG42", "", "", "", ["LIB_50Rnd_792x57_SMK"], [], ""],
        ["LIB_MG34", "", "", "", ["LIB_50Rnd_792x57_SMK"], [], ""]]];
_sfLoadoutData set ["marksmanRifles", [["LIB_G43", "", "", "", ["LIB_10Rnd_792x57","LIB_10Rnd_792x57","LIB_10Rnd_792x57","LIB_10Rnd_792x57_SMK","LIB_10Rnd_792x57_T","LIB_10Rnd_792x57_sS","LIB_10Rnd_792x57_T2"], [], ""],
        ["LIB_G41", "", "", "", ["LIB_10Rnd_792x57_clip"], [], ""]]];
_sfLoadoutData set ["sniperRifles", [["LIB_K98ZF39", "", "", "", ["LIB_5Rnd_792x57_SMK","LIB_5Rnd_792x57_sS"], [], ""]]];
_sfLoadoutData set ["sidearms", [["LIB_P08", "", "", "", ["LIB_8Rnd_9x19_P08"], [], ""],
        ["LIB_P38", "", "", "", ["LIB_8Rnd_9x19"], [], ""]]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_LIB_GER_Scharfschutze_w","U_LIB_GER_Scharfschutze_2_w"]];
_militaryLoadoutData set ["vests", ["V_LIB_GER_VestSTG","V_LIB_GER_VestMP40","V_LIB_GER_VestMG","V_LIB_GER_VestKar98","V_LIB_GER_VestG43"]];
_militaryLoadoutData set ["backpacks", ["B_LIB_GER_A_frame","B_LIB_GER_SapperBackpack_empty","B_LIB_GER_Tonister34_cowhide"]];
_militaryLoadoutData set ["helmets", ["H_LIB_GER_Helmet_ns_w","H_LIB_GER_Helmet_w"]];
_militaryLoadoutData set ["binoculars", ["LIB_Binocular_GER"]];

_militaryLoadoutData set ["rifles", [["LIB_K98", "", "", "", ["LIB_5Rnd_792x57"], [], ""],
        ["LIB_K98_Late", "", "", "", ["LIB_5Rnd_792x57"], [], ""]]];
_militaryLoadoutData set ["carbines", [["LIB_G43", "", "", "", ["LIB_10Rnd_792x57","LIB_10Rnd_792x57","LIB_10Rnd_792x57_T","LIB_10Rnd_792x57_sS","LIB_10Rnd_792x57_T2"], [], ""],
        ["LIB_G41", "", "", "", ["LIB_10Rnd_792x57_clip"], [], ""],
	["LIB_MP40", "", "", "", ["LIB_32Rnd_9x19","LIB_32Rnd_9x19","LIB_32rnd_9x19_t"], [], ""]]];
_militaryLoadoutData set ["grenadeLaunchers", [["LIB_MP44", "", "", "", ["LIB_30Rnd_792x33","LIB_30Rnd_792x33","LIB_30rnd_792x33_t"], [], ""],
        ["LIB_K98", "lib_acc_gw_sb_empty", "", "", ["LIB_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_30"], ""],
	["LIB_K98_Late", "lib_acc_gw_sb_empty", "", "", ["LIB_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_40"], ""]]];
_militaryLoadoutData set ["SMGs", [["LIB_MP40", "", "", "", ["LIB_32Rnd_9x19","LIB_32Rnd_9x19","LIB_32rnd_9x19_t"], [], ""]]];
_militaryLoadoutData set ["machineGuns", [["LIB_MG42", "", "", "", ["LIB_50Rnd_792x57_sS"], [], ""],
        ["LIB_MG34", "", "", "", ["LIB_50Rnd_792x57_sS"], [], ""]]];
_militaryLoadoutData set ["marksmanRifles", [["LIB_G43", "", "", "", ["LIB_10Rnd_792x57","LIB_10Rnd_792x57","LIB_10Rnd_792x57_T","LIB_10Rnd_792x57_sS","LIB_10Rnd_792x57_T2"], [], ""],
        ["LIB_G41", "", "", "", ["LIB_10Rnd_792x57_clip"], [], ""]]];
_militaryLoadoutData set ["sniperRifles", [["LIB_K98ZF39", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57_sS","LIB_5Rnd_792x57_t"], [], ""]]];
_militaryLoadoutData set ["sidearms", [["LIB_P08", "", "", "", ["LIB_8Rnd_9x19_P08"], [], ""],
        ["LIB_P38", "", "", "", ["LIB_8Rnd_9x19"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_LIB_GER_Tank_crew_leutnant"]];
_policeLoadoutData set ["vests", ["V_LIB_GER_TankPrivateBelt"]];
_policeLoadoutData set ["helmets", ["H_LIB_GER_TankPrivateCap"]];

_policeLoadoutData set ["SMGs", [["LIB_MP38", "", "", "", ["LIB_32rnd_9x19"], [], ""],
        ["LIB_MP40", "", "", "", ["LIB_32rnd_9x19"], [], ""]]];
_policeLoadoutData set ["sidearms", [
	["LIB_P08", "", "", "", ["LIB_8Rnd_9x19_P08"], [], ""],
        ["LIB_P38", "", "", "", ["LIB_8Rnd_9x19"], [], ""],
	["LIB_M1896", "", "", "", ["LIB_10Rnd_9x19_M1896"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["U_LIB_GER_Schutze_w","U_LIB_GER_Soldier_camo_w"]];
_militiaLoadoutData set ["vests", ["V_LIB_GER_VestKar98","V_LIB_GER_VestMP40"]];
_militiaLoadoutData set ["backpacks", ["B_LIB_GER_A_frame"]];
_militiaLoadoutData set ["helmets", ["H_LIB_GER_Helmet_w"]];

_militiaLoadoutData set ["rifles", [["LIB_K98", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""],
        ["LIB_K98_Late", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]]];
_militiaLoadoutData set ["carbines", [["LIB_G43", "", "", "", ["LIB_10Rnd_792x57","LIB_10Rnd_792x57","LIB_10Rnd_792x57_T"], [], ""],
        ["LIB_G41", "", "", "", ["LIB_10Rnd_792x57_clip"], [], ""],
	["LIB_K98", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""],
	["LIB_K98_Late", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]]];
_militiaLoadoutData set ["grenadeLaunchers", [["LIB_K98", "lib_acc_gw_sb_empty", "", "", ["LIB_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_30"], ""],
        ["LIB_K98_Late", "lib_acc_gw_sb_empty", "", "", ["LIB_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_40"], ""]]];
_militiaLoadoutData set ["SMGs", [["LIB_MP38", "", "", "", ["LIB_32rnd_9x19"], [], ""],
        ["LIB_MP40", "", "", "", ["LIB_32rnd_9x19"], [], ""]]];
_militiaLoadoutData set ["machineGuns", [["LIB_MG34", "", "", "", ["LIB_50Rnd_792x57"], [], ""],
        ["LIB_MG42", "", "", "", ["LIB_50Rnd_792x57"], [], ""]]];
_militiaLoadoutData set ["marksmanRifles", [["LIB_K98", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""],
        ["LIB_K98_Late", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]]];
_militiaLoadoutData set ["sniperRifles", [["LIB_K98ZF39", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""],
        ["LIB_K98", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""],
	["LIB_K98_Late", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]]];
_militiaLoadoutData set ["sidearms", [["LIB_P38", "", "", "", ["LIB_8Rnd_9x19"], [], ""]]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_LIB_GER_Spg_crew_private","U_LIB_GER_Spg_crew_leutnant","U_LIB_GER_Spg_crew_unterofficer"]];
_crewLoadoutData set ["vests", ["V_LIB_GER_TankPrivateBelt"]];
_crewLoadoutData set ["helmets", ["H_LIB_GER_Cap"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_LIB_GER_LW_pilot","U_LIB_GER_LW_pilot"]];
_pilotLoadoutData set ["vests", ["V_LIB_GER_OfficerBelt"]];
_pilotLoadoutData set ["helmets", ["H_LIB_GER_LW_PilotHelmet"]];


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
