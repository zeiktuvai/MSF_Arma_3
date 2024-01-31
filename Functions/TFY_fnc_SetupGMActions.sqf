/*
	Author: zeik_tuvai

	Description:
		Adds GM Actions to the GM unit.

	Parameter(s):
        object - Unit object (player or unit).
        
	Examples:
		[player] call TFY_fnc_SetupGMActions;

	Function Ver 1.0
	Implemented in: MSF v1.0
*/
params ["_unit"];

private _crateCode = {
_box = "Box_NATO_Ammo_F" createVehicle position GM;
clearItemCargo _box;
clearMagazineCargo _box;
[_box, true] call ace_arsenal_fnc_initBox;
_box setVehicleVarName "crate";
crate = _box;
publicVariable "crate";

_box addAction ["Remove Crate", { deleteVehicle crate; }];
};

_gm_act = ["GM_Menu", "GM Actions", "", {}, {true}] call ace_interact_menu_fnc_createAction;

_reveal_act = ["reveal_enemies","Reveal all enemies","",{{ player reveal _x; } forEach allUnits;}, {true}] call ace_interact_menu_fnc_createAction;

_arsenal_action = ["spawn_arsenal","Spawn Arsenal Crate","",_crateCode, {true}] call ace_interact_menu_fnc_createAction;

[_unit, 1, ["ACE_SelfActions"], _gm_act] call ace_interact_menu_fnc_addActionToObject;

[_unit, 1, ["ACE_SelfActions", "GM_Menu"], _arsenal_action] call ace_interact_menu_fnc_addActionToObject;

[_unit, 1, ["ACE_SelfActions", "GM_Menu"], _reveal_act] call ace_interact_menu_fnc_addActionToObject;
