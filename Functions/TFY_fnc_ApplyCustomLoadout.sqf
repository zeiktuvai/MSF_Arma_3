/*
	Author: zeik_tuvai

	Description:
		Sets the unit loadout from a custom loadout.

	Parameter(s):
        object - Unit object (player or unit).
        string - Name of custom loadout.

	Examples:
		[player, "TFY_Commander"] call TFY_fnc_ApplyCustomLoadout;

	Function Ver 1.0
	Implemented in: MSF v1.0
*/

params ["_unit", "_loadout"];

[_unit, missionConfigFile >> "CfgRespawnInventory" >> _loadout] call BIS_fnc_loadInventory;