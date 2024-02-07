//File Version: MSF v1.0

//Enable respawn selection on each player.
private _enableRespawnOnPlayer = true;

//Set faction for player respawn positions (0: BLUFOR, 1: OPFOR, 2: INDEPENDANT)
private _RoPFaction = 0;

//Enable Night Uniform
private _night = false;

//Enable End Mission ACE Self interaction option. (Be sure to give a unit the SL or GM variable name; see readme.)
//Set the trigger name to trig_end_mission for this to work. You can use the following hint in the trigger to let players know
//they can end the mission. 
// hint parseText "<t color='#808000'>Primary Mission Objectives Complete!</t> CDR/GM use the <t color='#900C3F'>ACE Self</t> interaction menu to end the mission when ready";
private _ACE_endMission = false;

//Enable GM actions in ACE Self Menu. (Be sure to give a unit the GM variable name).
private _ACE_GM_Actions = false;

//========= DO NOT EDIT BELOW THIS LINE ===========
private _settings = [];
if (!isNil "_enableRespawnOnPlayer") then { _settings append [["_enableRespawnOnPlayer", _enableRespawnOnPlayer]] };
if (!isNil "_RoPFaction") then { _settings append [["_RoPFaction", _RoPFaction]] };
if (!isNil "_night") then { _settings append [["_night", _night]] };
if (!isNil "_ACE_endMission") then { _settings append [["_ACE_endMission", _ACE_endMission]] };
if (!isNil "_ACE_GM_Actions") then { _settings append [["_ACE_GM_Actions", _ACE_GM_Actions]] };
private _SettingsCollection = createHashMapFromArray _settings;

_SettingsCollection;
