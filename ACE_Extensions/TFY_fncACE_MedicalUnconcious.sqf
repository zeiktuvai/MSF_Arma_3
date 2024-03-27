/*
	Author: zeik_tuvai

	Description:
		Part of MSF ACE Extensions.  This script enables an ace menu option to disable/enable unconciousness in ACE Medical.

	Parameter(s):
        object - Unit object (player or unit).
        
	Examples:
		[player] call TFY_fncACE_MedicalUnconcious;

	Function Ver 1.0
	Implemented in: MSF v1.7
*/




/*
params ["_unit"];
private _values = [_unit];

_unit setVariable ["unconciousEnabled", true];
["ace_unconscious", { 
    params ["_unit", "_state"]; 

    if (player isEqualTo _unit && _state) then
    { 
      private _enabled = player getVariable ["unconciousEnabled", true];    
      if (!_enabled) then {_unit setDamage 1;};
    };
}] call CBA_fnc_addEventHandler;

private _unc_code = {
	params ["_target", "_player", "_params"];
	_params params ["_vals"];

	private _enabled = _vals select 0 getVariable "unconciousEnabled";
	if (_enabled) then 
	{
		hint "Disabling ACE Medical Unconciousness; You will die instead of going unconcious";
		_vals select 0 setVariable ["unconciousEnabled", false];
	}
	else
	{
		hint "Enabling ACE Medical Unconciousness";
		_vals select 0 setVariable ["unconciousEnabled", true];
	};
};

_ace_ext = ["ace_ext", "MSF Extensions", "", {}, {true}] call ace_interact_menu_fnc_createAction;
_unconsious_enable = ["unc_enable", "ACE Unconciousness","", _unc_code, {true}, {}, [_values]] call ace_interact_menu_fnc_createAction;

[_unit, 1, ["ACE_SelfActions"], _ace_ext] call ace_interact_menu_fnc_addActionToObject;
[_unit, 1, ["ACE_SelfActions", "ace_ext"], _unconsious_enable] call ace_interact_menu_fnc_addActionToObject; */