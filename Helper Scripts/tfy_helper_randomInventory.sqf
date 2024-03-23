/*
	Author: zeik_tuvai

	Description:
		Placed in the init field of a object with inventory, it can be used to add random items and magazines from the list to the ojects inventory up
		up to the given amount for each.  If 0 is provided as the count then no items of that class will be added.

	Parameter(s):
        object - Container object.
		int - How many inventory items to add
		int - How many magazines to add.
        
	Examples:
		Assuming you place this helper script into a folder called scripts in your root mission directory.  Placing this in your container object's init
		will cause it to get nine items from the "_items" list and 0 magazines from the "_mags" list.
		null = [this, 9, 0] execVM "scripts\tfy_helper_randomInventory.sqf";

	Script version 1.0
*/
params ["_object", "_itemCount", "_magCount"];

if !(local _object) exitWith {};

private _items = ["ACE_Canteen", "ACE_epinephrine", "ACE_plasmaIV_500", "ACE_bloodIV", "ACE_bloodIV_500", "ACE_salineIV", "ACE_MRE_LambCurry", 
	"ACE_MRE_BeefStew", "ACE_MRE_CreamTomatoSoup", "ACE_MRE_CreamChickenSoup", "ACE_MRE_ChickenTikkaMasala", "ACE_MRE_SteakVegetables",
	"ACE_MRE_MeatballsPasta", "ACE_MRE_ChickenHerbDumplings", "ACE_Humanitarian_Ration", "ACE_EarPlugs", "ACE_fieldDressing", "ACE_packingBandage",
	"ACE_elasticBandage", "ACE_tourniquet", "ACE_splint", "ACE_morphine", "ACE_salineIV_500", "ACE_quikclot", "ACE_Can_RedGull", "ACE_Can_Franta", 
	"ACE_Can_Spirit"];

private _mags = ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer",
	"100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer", "Titan_AA", "MRAWS_HEAT_F", "7Rnd_408_Mag", "ACE_7Rnd_408_305gr_Mag",
	"130Rnd_338_Mag"];

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearItemCargoGlobal _object;
clearBackpackCargoGlobal _object;

for "_i" from 1 to _itemCount do {
	_object addItemCargoGlobal [selectRandom _items, 1];
};
for "_m" from 1 to _magCount do {
	_object addMagazineCargoGlobal [selectRandom _mags, 1];
};
