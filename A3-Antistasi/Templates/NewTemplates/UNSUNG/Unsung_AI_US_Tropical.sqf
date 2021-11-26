//////////////////////////
//   Side Information   //
//////////////////////////

["name", "US Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "US Reinforcements"] call _fnc_saveToTemplate;

["flag", "uns_FlagCarrierUS"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_UNS_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["uns_willys_2_usmc"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["uns_m37b1","uns_m274"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["uns_willysmg50","uns_willysmg","uns_willysm40","uns_m37b1_m1919","uns_m274_m40","uns_m274_m60"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["uns_M35A2_Open","uns_M35A2"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["uns_M35A2_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["uns_M35A2_ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["uns_M35A2_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["uns_M35A2_fueltanker","uns_M35A2_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["uns_M577_amb"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["uns_xm706e2","uns_xm706e1","uns_M113_XM182","uns_M113_M60","uns_M113_M134","uns_M113A1_M2","uns_M113_30cal","uns_M113_transport"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["uns_m48a3","uns_m551","uns_M67A"]] call _fnc_saveToTemplate;
["vehiclesAA", ["uns_m163"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", []] call _fnc_saveToTemplate;				//this line determines IFVs


["vehiclesTransportBoats", ["UNS_Zodiac_W"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["uns_pbr_mk18","uns_pbr","uns_PBR_M10"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["uns_M113_XM182","uns_M113_M60","uns_M113_M134","uns_M113A1_M2","uns_M113_30cal","uns_M113_transport","uns_M577_amb","uns_m163"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UNS_skymaster_CAS","UNS_F111_D_CAS","uns_ov10_usaf_CAS","uns_f105D_CAS","uns_f100b_CAS","uns_F4E_CAS","uns_A1J_CAS","uns_A7_CAS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["uns_F4E_CAP","UNS_F111_D_CAP","uns_f105D_CAP","uns_f100b_CAP","uns_A7_CAP"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["uns_c1a5cargo","uns_C130_H"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["uns_H13_transport_Army","uns_H13_gunship_Army","uns_oh6_transport","uns_oh6_m27"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["uns_UH1D_m60","uns_UH1D_m60_light","uns_UH1H_m60","uns_UH1H_m60_light","uns_h21c_mg","uns_ch47_m60_army"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UNS_AH1G_SUU11","UNS_AH1G_M195","UNS_AH1G_M200","UNS_AH1G","uns_UH1C_M21_M200","uns_UH1C_M21_M158","UNS_UH1C_M3_ARA","UNS_UH1B_TOW","uns_UH1C_M6_M200_1AC"]] call _fnc_saveToTemplate;

["vehiclesArtillery", [["uns_m110sp", ["uns_30Rnd_203mmHE"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["not_supported"]] call _fnc_saveToTemplate;
["uavsPortable", ["not_supported"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["uns_m274_m60"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["uns_m37b1"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["uns_m274"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["uns_willys_2_usmp"]] call _fnc_saveToTemplate;

["staticMGs", ["uns_m2_high"]] call _fnc_saveToTemplate;
["staticAT", ["uns_M40_106mm_US"]] call _fnc_saveToTemplate;
["staticAA", ["Uns_M55_Quad"]] call _fnc_saveToTemplate;
["staticMortars", ["uns_M2_60mm_mortar"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "uns_8Rnd_60mmHE_M2"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "uns_8Rnd_60mmSMOKE_M2"] call _fnc_saveToTemplate;

//Bagged weapon definitions
["baggedMGs", [["uns_m2_high_US_Bag", "uns_Tripod_Bag"]]] call _fnc_saveToTemplate;
["baggedAT", [[]]] call _fnc_saveToTemplate;
["baggedAA", [[]]] call _fnc_saveToTemplate;
["baggedMortars", [["uns_M2_60mm_mortar_US_Bag", "uns_Tripod_Bag"]]] call _fnc_saveToTemplate;

//Minefield definition
//Not Magazine type would be: ["APERSBoundingMine", "APERSMine", "ATMine"]
["minefieldAT", ["uns_mine_tm57"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["uns_mine_m16"]] call _fnc_saveToTemplate;

//PvP definitions
["playerDefaultLoadout", []] call _fnc_saveToTemplate;
["pvpLoadouts", []] call _fnc_saveToTemplate;
["pvpVehicles", []] call _fnc_saveToTemplate;


//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData setVariable ["rifles", []];
_loadoutData setVariable ["carbines", []];
_loadoutData setVariable ["grenadeLaunchers", []];
_loadoutData setVariable ["SMGs", []];
_loadoutData setVariable ["machineGuns", []];
_loadoutData setVariable ["marksmanRifles", []];
_loadoutData setVariable ["sniperRifles", []];

_loadoutData setVariable ["lightATLaunchers", [["uns_m72", "", "", "", ["uns_m72rocket"], [], ""]]];
_loadoutData setVariable ["ATLaunchers", [["uns_m20_bazooka", "", "", "", ["uns_M28A2_mag"], [], ""]]];
_loadoutData setVariable ["missileATLaunchers", [["uns_m20_bazooka", "", "", "", ["uns_M28A2_mag"], [], ""]]];
_loadoutData setVariable ["AALaunchers", [["uns_sa7", "", "", "", ["uns_sa7mag"], [], ""]]];
_loadoutData setVariable ["sidearms", []];

_loadoutData setVariable ["ATMines", ["uns_mine_AV_mag"]];
_loadoutData setVariable ["APMines", ["uns_traps_mine_mag"]];
_loadoutData setVariable ["lightExplosives", ["uns_M118_mag_remote"]];
_loadoutData setVariable ["heavyExplosives", ["DemoCharge_Remote_Mag"]];

_loadoutData setVariable ["antiTankGrenades", ["uns_m14gren", "uns_m34gren"]];
_loadoutData setVariable ["antiInfantryGrenades", ["uns_m67gren", "uns_m61gren", "uns_mk2gren"]];
_loadoutData setVariable ["smokeGrenades", ["uns_m18white"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData setVariable ["maps", ["ItemMap"]];
_loadoutData setVariable ["watches", ["ItemWatch"]];
_loadoutData setVariable ["compasses", ["ItemCompass"]];
_loadoutData setVariable ["radios", ["UNS_ItemRadio_PRC_90_TFAR"]];
_loadoutData setVariable ["gpses", []];
_loadoutData setVariable ["NVGs", [""]];
_loadoutData setVariable ["binoculars", ["uns_binocular_navy"]];
_loadoutData setVariable ["rangefinder", ["uns_binocular_army"]];

_loadoutData setVariable ["uniforms", []];
_loadoutData setVariable ["vests", []];
_loadoutData setVariable ["backpacks", []];
_loadoutData setVariable ["longRangeRadios", []];
_loadoutData setVariable ["helmets", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData setVariable ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData setVariable ["items_squadleader_extras", []];
_loadoutData setVariable ["items_rifleman_extras", []];
_loadoutData setVariable ["items_medic_extras", []];
_loadoutData setVariable ["items_grenadier_extras", []];
_loadoutData setVariable ["items_explosivesExpert_extras", ["Toolkit", "MineDetector"]];
_loadoutData setVariable ["items_engineer_extras", ["Toolkit", "MineDetector"]];
_loadoutData setVariable ["items_lat_extras", []];
_loadoutData setVariable ["items_at_extras", []];
_loadoutData setVariable ["items_aa_extras", []];
_loadoutData setVariable ["items_machineGunner_extras", []];
_loadoutData setVariable ["items_marksman_extras", []];
_loadoutData setVariable ["items_sniper_extras", []];
_loadoutData setVariable ["items_police_extras", []];
_loadoutData setVariable ["items_crew_extras", []];
_loadoutData setVariable ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData setVariable ["uniforms", ["UNS_SAS_BDU_E"]];
_sfLoadoutData setVariable ["vests", ["uns_sas_web_3","uns_sas_web_3_ugl","uns_sas_web_1","uns_sas_web_1_gl","uns_sas_web_2","uns_sas_web_2_gl"]];
_sfLoadoutData setVariable ["backpacks", ["uns_sas_alicepack_1","uns_sas_alicepack_2","uns_sas_alicepack_3","uns_sas_alicepack_RTO"]];
_sfLoadoutData setVariable ["helmets", ["uns_sas_bandana_erdl","uns_sas_booniehat_erdl","uns_sas_booniehat_erdl2","uns_sas_headband_erdl"]];
_sfLoadoutData setVariable ["binoculars", ["uns_binocular_army"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData setVariable ["rifles", [["uns_l1a1", "", "", "", ["uns_l1a1mag"], [], ""],
        ["uns_l2a1_shorty", "", "", "", ["uns_l1a1mag"], [], ""]]];
_sfLoadoutData setVariable ["carbines", [["uns_m3carbine", "", "", "", ["uns_m2carbinemag"], [], ""],
	["uns_xm177e2_stock", "", "", "uns_o_colt4x", ["uns_30Rnd_556x45_Stanag"], [], ""]]];
_sfLoadoutData setVariable ["grenadeLaunchers", [["uns_l1a1gl", "", "", "", ["uns_l1a1mag"], ["Uns_1Rnd_HE_M381","uns_1Rnd_Smoke_40mm"], ""],
	["uns_m16_xm148_camo", "", "", "", ["uns_30Rnd_556x45_Stanag"], ["uns_m406vest","uns_1Rnd_Smoke_40mm"], ""]]];
_sfLoadoutData setVariable ["SMGs", [["uns_SterlingSD", "", "", "", ["uns_mk4mag"], [], ""],
        ["uns_Sterling", "", "", "", ["uns_mk4mag"], [], ""]]];
_sfLoadoutData setVariable ["machineGuns", [["uns_m60", "", "", "", ["uns_m60mag"], [], ""],
		["uns_ukvz59", "", "", "", ["uns_100Rnd_762x54_ukvz59"], [], ""]]];
_sfLoadoutData setVariable ["marksmanRifles", [["uns_m16_camo", "", "", "uns_o_leatherwoodart_m16", ["uns_20Rnd_556x45_Stanag"], [], ""],
        ["uns_m14", "", "", "uns_o_leatherwoodart_m14", ["uns_m14mag"], [], ""]]];
_sfLoadoutData setVariable ["sniperRifles", [["uns_smle_sniper", "", "", "", ["uns_smlemag"], [], ""]]];
_sfLoadoutData setVariable ["sidearms", [["uns_MX991_m1911SD_base", "uns_s_m1911", "uns_ba30", "", ["uns_m1911mag"], [], ""],
        ["uns_bhp", "", "", "", ["uns_13Rnd_hp"], [], ""]]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData setVariable ["uniforms", ["UNS_USMC_BDU_65"]];
_militaryLoadoutData setVariable ["vests", ["uns_simc_flak_55","uns_simc_flak_55_M61_79_belt","uns_simc_flak_55_bandoleer","uns_Simc_flak_55_M61_med","uns_simc_flak_55_M61","uns_flak_55_M61_60_2","uns_simc_flak_55_mk2_belt_open","uns_simc_flak_55_mk2_bandoleer_belt"]];
_militaryLoadoutData setVariable ["backpacks", ["UNS_Alice_F1","UNS_Alice_FR","uns_simc_MC_rajio_flak_1","UNS_USMC_MED","UNS_USMC_R1","uns_simc_MC_packboard_flak_3"]];
_militaryLoadoutData setVariable ["helmets", ["UNS_M1_2","uns_simc_m1_bitch_op"]];
_militaryLoadoutData setVariable ["binoculars", ["uns_binocular_army"]];

_militaryLoadoutData setVariable ["rifles", [["uns_M16A1", "", "", "", ["uns_30Rnd_556x45_Stanag"], [], ""]]];
_militaryLoadoutData setVariable ["carbines", [["uns_m2carbine", "", "", "", ["uns_m1carbinemag"], [], ""],
		["uns_xm177e2_stock", "", "", "", ["uns_30Rnd_556x45_Stanag"], [], ""]]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [["uns_m16a1_m203", "", "", "", ["uns_20Rnd_556x45_Stanag"], ["Uns_1Rnd_HE_M381","uns_1Rnd_Smoke_40mm"], ""]]];
_militaryLoadoutData setVariable ["SMGs", [["uns_thompson", "", "", "", ["uns_thompsonmag_30"], [], ""],
		["uns_m3a1", "", "", "", ["uns_m3a1mag"], [], ""]]];
_militaryLoadoutData setVariable ["machineGuns", [["uns_m60", "", "", "", ["uns_m60mag"], [], ""],
		["uns_M63a_LMG", "", "", "", ["uns_m63abox"], [], ""]]];
_militaryLoadoutData setVariable ["marksmanRifles", [["uns_m16_camo", "", "", "uns_o_leatherwoodart_m16", ["uns_20Rnd_556x45_Stanag"], [], ""],
		["uns_m14", "", "", "uns_o_leatherwoodart_m14", ["uns_m14mag"], [], ""]]];
_militaryLoadoutData setVariable ["sniperRifles", [["uns_model70_iron", "", "", "uns_o_redfieldart_m70", ["uns_model70mag_T"], [], ""],
		["uns_M40_base", "", "", "uns_o_redfieldart", ["uns_m40mag_T"], [], ""]]];
_militaryLoadoutData setVariable ["sidearms", [["uns_m1911", "", "", "", ["uns_m1911mag"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData setVariable ["uniforms", ["UNS_ARMY_BDU_716thMPBnpv1"]];
_policeLoadoutData setVariable ["vests", ["uns_simc_56_ligt"]];
_policeLoadoutData setVariable ["helmets", ["UNS_M1_MP"]];

_policeLoadoutData setVariable ["SMGs", [["uns_m870_mk1", "", "", "", ["uns_m870mag"], [], ""],
	["uns_m3a1", "", "", "", ["uns_m3a1mag"], [], ""]]];
_policeLoadoutData setVariable ["sidearms", [
	["uns_m1911", "", "", "", ["uns_m1911mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData setVariable ["uniforms", ["UNS_ARMY_BDU_65"]];
_militiaLoadoutData setVariable ["vests", ["uns_simc_56","uns_simc_56_bandoleer","uns_simc_56_frag","uns_simc_56_M43","uns_v_simc_67_ass","uns_v_simc_67_frag_ass","uns_v_simc_67_45","uns_Simc_56_med"]];
_militiaLoadoutData setVariable ["backpacks", ["uns_simc_pack_trop_1_alt","uns_simc_pack_trop_4_alt","uns_simc_MC_packboard_flak_rajio_2","uns_simc_pack_med_m5_flak","uns_simc_packboard_MG_2","uns_simc_packboard_mortar_1"]];
_militiaLoadoutData setVariable ["helmets", ["UNS_M1_1","uns_simc_m1_bitch_op"]];

_militiaLoadoutData setVariable ["rifles", [["uns_m16", "", "", "", ["uns_20Rnd_556x45_Stanag"], [], ""],
		["uns_m14", "", "", "", ["uns_m14mag"], [], ""]]];
_militiaLoadoutData setVariable ["carbines", [["uns_m1carbine_pouch", "", "", "", ["uns_m1carbinemag"], [], ""],
		["uns_m1carbine", "", "", "", ["uns_m1carbinemag"], [], ""]]];
_militiaLoadoutData setVariable ["grenadeLaunchers", [["uns_m79", "", "", "", ["Uns_1Rnd_HE_M381"], ["uns_1Rnd_Smoke_40mm"], ""],
		["uns_m1garand_gl", "", "", "", ["uns_m1garandmag"], ["Uns_1Rnd_22mm_M1a2_FRAG","Uns_1Rnd_22mm_HEAT"], ""]]];
_militiaLoadoutData setVariable ["SMGs", [["uns_thompson", "", "", "", ["uns_thompsonmag_30"], [], ""],
		["uns_m3a1", "", "", "", ["uns_m3a1mag"], [], ""]]];
_militiaLoadoutData setVariable ["machineGuns", [["uns_bar", "", "", "", ["uns_barmag"], [], ""], 
		["uns_m1919a6", "", "", "", ["uns_100Rnd_m1919"], [], ""]]];
_militiaLoadoutData setVariable ["marksmanRifles", [["uns_m1garand", "", "", "uns_o_m84", ["uns_m1garandmag"], [], ""],
		["uns_m1garand", "", "", "", ["uns_m1garandmag"], [], ""]]];
_militiaLoadoutData setVariable ["sniperRifles", [["uns_m1903", "", "", "", ["uns_springfieldmag_T"], [], ""],
		["uns_m1903", "", "", "uns_o_unertl8x", ["uns_springfieldmag_T"], [], ""]]];
_militiaLoadoutData setVariable ["sidearms", [["uns_m1911", "", "", "", ["uns_m1911mag"], [], ""]]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData setVariable ["uniforms", ["UNS_ARMY_BDU_S","UNS_ARMY_BDU_F"]];
_crewLoadoutData setVariable ["vests", ["uns_simc_56_45_ligt_zusp"]];
_crewLoadoutData setVariable ["helmets", ["UNS_TC_1","UNS_TC_2"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["UNS_JPilot_BDU","UNS_Pilot_BDU"]];
_pilotLoadoutData setVariable ["vests", ["UNS_JP_Vest"]];
_pilotLoadoutData setVariable ["helmets", ["UNS_JP_Helmet_352TFS","UNS_JP_Helmet_366TFW","UNS_JP_Helmet_389TFS","UNS_HP_Helmet_R33","UNS_HP_Helmet_R8","UNS_HP_Helmet_USA"]];


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
	["SquadLeader", _squadLeaderTemplate],
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
