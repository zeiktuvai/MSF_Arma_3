To change which loadouts are assigned to each unit:
1. Find the class name (i.e. NATO Rifleman is `B_Soldier_F`).
2. Open `DLS_Loadouts.sqf`
3. Find the line that has the class name of your unit.
4. In the `["TFY_xxxx]` array just modify or add the name of the loadout from Loadouts_NATO.cfg.
    - NOTE: case 0 is default loadouts, case 1 is night loadouts.

Example: To update the standard rifleman unit to have the team leader loadout do the following.

Find the line with `B_Soldier_F` under `case 0:`
`["B_Soldier_F", ["TFY_Rifleman"]],`

Then update it to such:
`["B_Soldier_F", ["TFY_TeamLeader"]],`