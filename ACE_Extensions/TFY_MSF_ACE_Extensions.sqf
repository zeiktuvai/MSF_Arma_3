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
	[true],
	nil,
	{}
] call CBA_fnc_addSetting;