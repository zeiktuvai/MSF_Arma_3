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


params ["_unit"];
private _values = [_unit];

["ace_unconscious", { 
    params ["_unit", "_state"]; 

    if (player isEqualTo _unit && _state) then
    {         
      if (MSF_ACEext_Unconcious) then {_unit setDamage 1;};
    };
}] call CBA_fnc_addEventHandler;