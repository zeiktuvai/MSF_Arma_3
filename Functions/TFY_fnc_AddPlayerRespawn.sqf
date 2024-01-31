/*
	Author: zeik_tuvai

	Description:
		Sets the current player as a respawn point for the given side.

	Parameter(s):
        object - Unit object (player or unit).
        int - Side of player respawn (0 - BLUEFOR, 1 - OPFOR, 2 - INDEPENDANT)

	Examples:
		[player, side] call TFY_fnc_ApplyRespawnInventories;

    Function Ver 1.0
	Implemented in: MSF v1.0
*/
params ["_unit", "_side"];

switch (_side) do
{
    case 0:
    {
        [WEST, _unit] call BIS_fnc_addRespawnPosition;
    };
    case 1:
    {
        [EAST, _unit] call BIS_fnc_addRespawnPosition;
    };
    case 2:
    {
        [INDEPENDANT, _unit] call BIS_fnc_addRespawnPosition;
    };
    default	{};
};