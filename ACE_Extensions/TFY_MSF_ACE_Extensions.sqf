/*
	Author: zeik_tuvai

	Description:
		Part of MSF ACE Extensions.  Settings definitions for MSF Settings in addon options.
		
	Implemented in: MSF v1.7
*/

// Ace Extensions
[
	"MSF_ACEext_Unconcious",
	"CHECKBOX",
	["Enable ACE Medical Player Unconciousness", "When disabled, the player will die upon going unconcious instead of staying unconcious until being revived or bleeding out."],
	["MSF Settings", "ACE Options"],
	[true]
] call CBA_fnc_addSetting;

// MSF Settings
[
	"MSF_Base_RoP",
	"CHECKBOX",
	["Enable Respawn on Player", "When enabled, this adds all players on the selected side as a respawn position."],
	["MSF Settings", "Mission Settings - Respawn"],
	[true],
	1,
	{},
	true
] call CBA_fnc_addSetting;

[
	"MSF_Base_RoP_Side",
	"LIST",
	["Respawn on Player Side", "The faction that respawn on player is enabled for."],
	["MSF Settings", "Mission Settings - Respawn"],
	[[0, 1, 2], ["BLUFOR", "OPFOR", "INDEPENDENT"], 0],
	1,
	{},
	true
] call CBA_fnc_addSetting;

// [
// 	"MSF_Base_Respawn_Delay",
// 	"SLIDER",
// 	["Respawn Delay", "The time in seconds a player must wait to respawn."],
// 	["MSF Settings", "Mission Settings - Respawn"],
// 	[1, 300, 15, 0],
// 	1,
// 	{},
// 	true
// ] call CBA_fnc_addSetting;

[
	"MSF_Base_NightLoadout",
	"CHECKBOX",
	["Enable Night Loadouts", "When enabled, switches out the standard camo pattern for black, adds NVGs and PEQ15s/Silencers to all classes."],
	["MSF Settings", "Mission Settings - Loadouts"],
	[false],
	1,
	{},
	true
] call CBA_fnc_addSetting;

[
	"MSF_Base_EndMission",
	"CHECKBOX",
	["Enable End Mission ACE Menu Item", "When enabled, An ACE Menu Item is added to end the mission for the Commander and the GM. This requires a player unit to have the SL or GM variable (Or two units, one each), and a trigger with the variable of trig_end_mission. See Readme."],
	["MSF Settings", "Mission Settings"],
	[false],
	1,
	{},
	true
] call CBA_fnc_addSetting;

[
	"MSF_Base_GM_Menu",
	"CHECKBOX",
	["Enable GM Actions", "When enabled, adds special actions to the GM player unit.  This requires a unit have the variable GM to function properly."],
	["MSF Settings", "Mission Settings"],
	[false],
	1,
	{},
	true
] call CBA_fnc_addSetting;