/*
	Author: zeik_tuvai

	Description:
		Part of MSF ACE Extensions.  Settings definitions for MSF Settings in addon options.
		
	Implemented in: MSF v1.7
*/

[
	"MSF_ACEext_Unconcious",
	"CHECKBOX",
	["Enable ACE Medical Player Unconciousness", "When disabled, the player will die upon going unconcious instead of staying unconcious until being revived or bleeding out."],
	["MSF Settings", "ACE Options"],
	[true]
] call CBA_fnc_addSetting;

[
	"MSF_Base_EndMission",
	"CHECKBOX",
	["Enable End Mission ACE Menu Item", "When enabled, an ACE menu item is added to allow certain roles to end the mission based on a trigger.  See Readme."],
	["MSF Settings", "Mission Settings"],
	[true]
] call CBA_fnc_addSetting;