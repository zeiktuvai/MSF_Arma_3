# Mission Support Framwork for Arma 3

This project started life as the DLS, but as the scope expanded and I started adding things outside of loadouts it seemed prudent to re-rganize the project.  

The MSF is a collection of tools wrapped into a script framework that makes building story driven missions much easier.  It includes all the custom loadout features of the DLS, but now includes other features related to mission creation and flow.  

This framework makes use of ACE 3, which is needed for a lot of the custom interactions to work properly.  

[Loadout Management](#loadout-management)  
[Respawn Features](#respawn-options)  
[ACE 3 Interaction Features](#ace-interaction-features)  

**Initial Setup**  
1. Clone this repo into your mission folder using `git clone https://github.com/zeiktuvai/MSF_Arma_3.git` (You will be able to update it easily if new loadouts are added by moving into the `MSF_Arma_3` folder and running `git pull`).  

2. Modify your `description.ext` to have the following code at the top: `#include "MSF_Arma_3\ClassConfig.cfg"`.  
- (I have included one if you wish to use it, just copy it from the example files folder into your main mission folder).  
- WARNING: Make sure your `description.ext` doesn't have any respawn properties in it, also make sure class CfgRoles and CfgRespawnInventory is not in the file.  

3. In your `initPlayerLocal.sqf` (if you do not have one then you will have to create one) add the following code: `#include "MSF_Arma_3\MSF.sqf"` 
- (I have included one if you wish to use it, just copy it from the example files folder into your main mission folder).  

4. Create a file in your root mission folder called `MSF_Settings.sqf` (Or copy the one in the example files folder into your root mission folder.) and update the settings to your needs. (See xxxxxx below for more information).  

The following is a walk through of the different parts of the MSF and how to configure/use them.  

# Loadout Management

The MSF makes use of custom loadouts defined by TFY members in `CfgRespawnInventory` format.  These loadouts can be automatically applied to certain NATO units, and can easily be updated.  

It achieves this by recognizing what NATO units have been placed and automatically inferring the loadout based on the unit type.  This **ONLY WORKS WITH STANDARD NATO UNITS**.  

You can also override the default loadout, or have it work with unsupported unit types by manually entering the configuration.

Place your playable units on the map using the standard **NATO - MEN** (standard; not pacific) units and the system will automatically apply the loadout if a player is in that slot. (See below for a list of supported units). 

**Night Uniforms**  
This includes night uniform versions that adds NVGS (TPNVG Mod) and appropriate weapon attachments like silencers and PEQs.  

To enable, update your MSF_Settings.sqf:  

`_night =` (true: to enable; false: to disable).  

**Supported NATO Units**
- Ammo Bearer
- Autorifleman
- Combat Life Saver
- Crewman
- Engineer
- Grenadier
- All three Gunners
- Heavy Gunner
- Marksman
- Both Missile Specialists
- Rifleman/(AT)/(LightAT)/(Light)
- Sharpshooter
- Squad Leader
- Team Leader
- All UAV/UGV  

**Overriding Automatic Selection**  

You can ignore the auto chosen loadout or if using units that are not supported, you can use this to apply loadouts to them.  In the units init add the following code:

```c
    playerConfig = createHashMapFromArray[["initialLoadout","STARTING LOADOUT"],["respawnLoadouts",["RESPAWN","LOADOUTS"]]];
    this setVariable ["override", [playerConfig]];                
```
You can use the below list to set the initial loadout and any respawn loadouts you want to add.  

Remember if you put `["respawnLoadouts",["all"]]` in the respawn loadouts array it will give that unit all loadouts.

**Loadout List**

- TFY_Commander
- TFY_Autorifleman
- TFY_Marksman
- TFY_Teamleader
- TFY_Rifleman
- TFY_ATRifleman
- TFY_AARifleman
- TFY_UAVOperator
- TFY_VehicleCrewman
- TFY_Medic
- TFY_Diver_Expl
- TFY_Diver
- TFY_Grenadier
- TFY_MineSpec  

# Respawn Options

*Respawn on Player*  
Adds each player as a respawn point to select from;  

`_enableRespawnOnPlayer =` (true: to enable; false: to disable). 

`_RoPFaction =` (0: BLUFOR, 1: OPFOR, 2: INDEPENDANT). 
    
# ACE Interaction Features

*ACE End Mission Menu Option*  
Upon activarion of a trigger, an ace self interaction option will be added to allow players to end the mission when they choose.  This requires
that you have player units with the variable name `SL` (Squad Leadre/Commander) and/or `GM` (Game Master).  Also, your end mission trigger should be named `trig_end_mission`.  

Update the following line in MSF_Settings:  
`_ACE_endMission =` (true: to enable; false: to disable).  

*ACE GM Actions Menu Option*  
Adds special actions to the GM unit to add QOL features to gameplay. Avaliable GM Actions:  
- Reveal all enemies on map only to GM.  
- Spawn an ACE Arsenal crate that can be interacted with to remove it when done.  

Update the following line in MSF_Settings:  
`_ACE_GM_Actions =` (true: to enable; false: to disable).     


[Change Log](/Docs/Changelog.md)  

[How to update which loadouts are assigned](/Docs/Updating%20Assigned%20Loadouts.md)