/*
This file covers:
  vehicle hardpoints, for loading loot boxes, Weapon and such.
  Offsets for the statics/crates/anything else you want to make loadable onto vehicles.
  weapon defines

These points are coordinates relative to the objects hitbox/mesh.
There is a command that can find the position on a vehicle that you are looking at available on the Git Repo's Wiki.
These coords generally don't have to be more than 2 decimal places for precision, more is just overkill and harms readability.

Always think of the next guy that may have to work on your code. Chances are it will be you!
*/

/*The first section is for setting the nodes that weapons and boxes should attach to.

    This has the model path for the vehicle, then 3 sections as follows; Node size (always 1), Node location and locked seats.

      The node location is a set of 3 coordinates in reference to the vehicle model, this defines where the node should be.

      The locked seat list is the set of seats that should be made unusable when the node has something on it.
      This stops people being clipped into the crate/static when it is loaded. It is populated with the seat IDs for each one to be disabled.
*/
//To make it easier to navigate, it is a good idea to keep the lines for similar vehicles together. Usually, we list 4 wheeled vehicles, then 6 wheeled, then 8 wheeled, then boats. It is also good to keep multiple versions of the same vehicle together, such as covered and open versions of the same truck.

A3A_logistics_vehicleHardpoints append [
// Trucks
 //OpelBlitz
 ["LIB_OpelBlitz_Open_Y_Camo" call A3A_fnc_classNameToModel, [
    [1,             [0,-0.15,0],     [1,2,7,10,11]],
    [1,             [0,-0.95,0],     [5,6]],
    [1,             [0,-1.75,0],     [3,4]],
    [1,             [0,-2.55,0],     [8,9]]
    ]],
 //US6 Open
 ["LIB_US6_Open_Cargo" call A3A_fnc_classNameToModel, [
    [1,             [0,-0.4,0.2],     [1,10]],
    [1,             [0,-1.2,0.2],     [2,5,6,7]],
    [1,             [0,-2,0.2],     [3,4]],
    [1,             [0,-2.8,0.2],     [8,9]]
    ]],
 //SdKfz 7/1
 ["LIB_SdKfz_7" call A3A_fnc_classNameToModel, [
    [1,             [0,-0.4,-0.7],     [2,3,4,5,9]],
    [1,             [0,-1.2,-0.7],     [6,10]],
    [1,             [0,-2,-0.7],     []],
    [1,             [0,-2.8,-0.7],     [7,8]]
    ]],
 //Zis5v
 ["LIB_Zis5v" call A3A_fnc_classNameToModel, [
    [1,             [0,-0.4,-0.4],     [1,2,3,5,10,11]],
    [1,             [0,-1.2,-0.4],     [4,6,7]],
    [1,             [0,-2,-0.4],     [8,9,12]]
    ]],
 //GMC Truck
 ["LIB_US_GMC_Open" call A3A_fnc_classNameToModel, [
    [1,             [0,-0.7,-0.5],     [1,2,7,10]],
    [1,             [0,-1.5,-0.5],     [5,6]],
    [1,             [0,-2.3,-0.5],     [3,4]],
    [1,             [0,-3.1,-0.5],     [8,9]]
    ]]
];

/*The next section is for adding static weapons to the weapon sets.
  The weapon sets are used to tell the game what weapons can be mounted on what vehicles and are separated into 2 categories.
  smallVic and largeVic.
  smallVic is used for things like offroads, where low mounted weapons such as RHS's NSV cannot be used.
  largeVic is used for larger trucks where basically any weapon can be mounted and used.

  Adding weapons to these arrays is as simple as pasting the model path to the static weapon's model.
*/


/*The last section is for defining the offsets for statics, crates and any other item you might want to load onto a vehicle.
  This is usually separated into 3 sections; Weapons, Crates and Other.
  The first 2 are self explanatory, the 3rd is for things like quadbikes, as they can be loaded onto vehicles if they are initialised properly.
  This is filled by listing the model path, the coordinate offset(for tweaking it so that its base is centered on the node), and any angle offset it needs (in case the weapon should be facing any other direction than forward by default.),
  finally you list the node size that the entry should use from 1 to x, for reference a crate usually is either 1 or 2, and a static is 2 or 4, but it can be any size you want EXCEPT 0 or negative numbers!!!!
  in addition if your defining offsets for weapons youd want to add in one more entry after size that of recoil, this is how much newtonian force is applied to the vehicle when you fire the static
*/
A3A_logistics_attachmentOffset append [
//model                                                                       //offset                    //rotation                  //size  //recoil (if weapon)
// Static weapons
  ["LIB_MG42_Lafette_Deployed" call A3A_fnc_classNameToModel,                              [0, -1.5, 0],             [0,-1,0],                   4,      100], // MG42
  ["LIB_GrWr34" call A3A_fnc_classNameToModel,                              [0, 0, 1],             [0,-1,0],                   4,      100], // German Mortar
  ["LIB_FlaK_30" call A3A_fnc_classNameToModel,                              [0, -0.5, 0],             [0,-1,0],                   3,      100], // AK AA
  ["LIB_FlaK_30_w" call A3A_fnc_classNameToModel,                              [0, -0.5, 0],             [0,-1,0],                   3,      100], // AK AA
  ["LIB_FlaK_38" call A3A_fnc_classNameToModel,                              [0, -0.5, 0],             [0,-1,0],                   3,      100], // German AA
  ["LIB_FlaK_38_w" call A3A_fnc_classNameToModel,                              [0, -0.5, 0],             [0,-1,0],                   3,      100], // German AA
  ["LIB_Flakvierling_38" call A3A_fnc_classNameToModel,                              [0, -0.5, 0],             [0,-1,0],                   3,      100], // German AA
  ["LIB_Flakvierling_38_w" call A3A_fnc_classNameToModel,                              [0, -0.5, 0],             [0,-1,0],                   3,      100], // German AA
  ["LIB_BM37" call A3A_fnc_classNameToModel,                              [0, 0, 1],             [0,-1,0],                   4,      100], // Soviet Mortar
  //Crates
  ["LIB_AmmoCrate_Arty_SU" call A3A_fnc_classNameToModel,                              [0, 0, -0.1],             [0,0,0],                   1] // Surrender Box
  //Other    
  
];

/*
    Next up is to add all covered or closed vehicles to this next section, this is needed to prevent statics being loaded inside of closed vehicles or covered vehicle, where they become usless, and it quite franckly looks silly.
*/
A3A_logistics_coveredVehicles append ["LIB_OpelBlitz_Tent_Y_Camo", "LIB_OpelBlitz_Tent_Y_Camo_w", "LIB_US6_Tent", "LIB_US6_Tent_Cargo", "LIB_US_GMC_Tent", "LIB_DAK_OpelBlitz_Tent"];

/*
    Finally you need to declair weapons that you have added here, this is done with arrays consisting of pairs of the model of the weapon, and an array of all vehicle models the weapon is not allowed on.
    This blacklisted vehicles already include closed and covered vehicles so you don't have to add those
*/
A3A_logistics_weapons append [
	["LIB_MG42_Lafette_Deployed" call A3A_fnc_classNameToModel, ["LIB_US_GMC_Open", "LIB_US6_Open","LIB_OpelBlitz_Open_Y_Camo"]],
	["LIB_FlaK_30" call A3A_fnc_classNameToModel, ["LIB_US_GMC_Open", "LIB_US6_Open","LIB_OpelBlitz_Open_Y_Camo"]],
	["LIB_FlaK_30_w" call A3A_fnc_classNameToModel, ["LIB_US_GMC_Open", "LIB_US6_Open","LIB_OpelBlitz_Open_Y_Camo"]],
	["LIB_Flakvierling_38" call A3A_fnc_classNameToModel, ["LIB_US_GMC_Open", "LIB_US6_Open","LIB_OpelBlitz_Open_Y_Camo"]],
	["LIB_Flakvierling_38_w" call A3A_fnc_classNameToModel, ["LIB_US_GMC_Open", "LIB_US6_Open","LIB_OpelBlitz_Open_Y_Camo"]],
	["LIB_GrWr34" call A3A_fnc_classNameToModel, ["LIB_US_GMC_Open", "LIB_US6_Open","LIB_OpelBlitz_Open_Y_Camo"]],
	["LIB_BM37" call A3A_fnc_classNameToModel, ["LIB_US_GMC_Open", "LIB_US6_Open","LIB_OpelBlitz_Open_Y_Camo"]]
];
//That covers everything, you should make you file by replacing values in an already complete file rather than using this as the active files will have the proper commenting there already. Using this one would leave a tonne of unnecessary comments in the file.
