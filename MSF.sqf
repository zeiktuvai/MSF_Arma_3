/*
	Author: zeik_tuvai

	Mission Support Framework v1.0
*/
if (fileExists "..\MSF_Settings.sqf") then
{
	#include "..\MSF_Settings.sqf"
	hint "exists";
}
else
{
	hint "ERROR: MSF Not configured correctly, MSF_Settings.sqf not found, using defaults.";
	private _enableRespawnOnPlayer = true;
	private _RoPFaction = 0;
	private _night = false;
	private _ACE_endMission = false;
	private _ACE_GM_Actions = false;
};

// Register custom functions
TFY_fnc_ApplyCustomLoadout = compile preprocessFile "MSF_Arma_3\Functions\TFY_fnc_ApplyCustomLoadout.sqf";
TFY_fnc_ApplyRespawnInventories = compile preprocessFile "MSF_Arma_3\Functions\TFY_fnc_ApplyRespawnInventories.sqf";
TFY_fnc_AddPlayerRespawn = compile preprocessFile "MSF_Arma_3\Functions\TFY_fnc_AddPlayerRespawn.sqf";
TFY_fnc_SetupGMActions = compile preprocessFile "MSF_Arma_3\Functions\TFY_fnc_SetupGMActions.sqf";
TFY_fnc_GetLoadoutByClass = compile preprocessFile "MSF_Arma_3\Functions\TFY_fnc_GetLoadoutByClass.sqf";

// Declare local variables
private _playerClass = typeOf player;
private _playerObject = player;
_override = player getVariable ["override", nil];

// Get class loadouts
private _ldType = if (_night == true) then { 1 } else { 0 };
private _playerLoadout = [_playerClass, _ldType] call TFY_fnc_GetLoadoutByClass;

// Declare function variables
Apply_Loadout =
{
	params ["_unit", "_loadout"];
	[_unit, _loadout] call TFY_fnc_ApplyCustomLoadout;
};
Apply_Respawn =
{
	params ["_unit", "_respawn"];
	[_unit, _respawn] call TFY_fnc_ApplyRespawnInventories;
};

// Check for initial loadout override
if (!isNil "_override") then
{
	_override params ["_config"];
	if ("initialLoadout" in _config) then
	{
		private _initial = _config get "initialLoadout";
		[_playerObject, _initial] call Apply_Loadout;
	}
	else
	{
		if (count _playerLoadout > 0) then
		{
			[_playerObject, _playerLoadout select 0] call Apply_Loadout;
		};
	};
}
else
{
	// Apply Audomatic Loadout
	if (count _playerLoadout > 0) then
	{
		// Set initial loadout
		[_playerObject, _playerLoadout select 0] call Apply_Loadout;
	};
};


// Check for respawn loadout override
if (!isNil "_override") then
{
	_override params ["_config"];
	if ("respawnLoadouts" in _config) then
	{
		private _respawn = _config get "respawnLoadouts";
		[_playerObject, _respawn] call Apply_Respawn;
	}
	else
	{
		if (count _playerLoadout > 0) then
		{
			[_playerObject, _playerLoadout select 1] call Apply_Respawn
		};
	};
}
else
{
	// Apply Audomatic Loadout
	if (count _playerLoadout > 0) then
	{	
		// Set respawn loadout
		[_playerObject, _playerLoadout select 1] call Apply_Respawn
	};
};

// Set each player as respawn point if enabled
if(_enableRespawnOnPlayer == true) then
{
	[_playerObject, 0] call TFY_fnc_AddPlayerRespawn;
};

// Set end mission menu option 
if(_ACE_endMission) then
{
	if (vehicleVarName player == 'SL' || vehicleVarName player == 'GM') then 
	{ 
		_end_mission = ["end_mission","End Mission","",{ ["end"] remoteExec ["BIS_fnc_endMission", 0]; }, 
		{ triggerActivated trig_end_mission }] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions"], _end_mission] call ace_interact_menu_fnc_addActionToObject;
	};
};

// GM Actions
if (!isNil _ACE_GM_Actions && _ACE_GM_Actions == true) then
{
	if (vehicleVarName player == 'GM') then 
	{ 
		[_playerObject] call TFY_fnc_SetupGMActions;
	};
};
