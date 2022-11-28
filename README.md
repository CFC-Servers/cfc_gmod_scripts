# cfc_gmod_scripts
A disgusting pile of loose-knit, à la carte scripts for Garry's Mod

# Included Scripts:


## `bigchat_restrictor`
#### Description
Uses the hooks provided by **[BigChat](https://github.com/CFC-Servers/gm_bigchat/)** to restrict it from certain ranks.
#### References
 - https://github.com/CFC-Servers/gm_bigchat


## `cw_extrema_ratio_fix`
#### Description
Fixes the on-tick `hudScaler` error spam.
#### References
 - https://steamcommunity.com/sharedfiles/filedetails/?id=707343339


## `l4d2_vehicles_fix`
#### Description
Fixes a silly (but absurdly spammy) `nil` error that occurrs in a popular L4D2 SimfPhys Vehicle Pack (this fix has already been proposed upstream, but the author doesn't appear to want to implement it)
#### References
 - https://steamcommunity.com/sharedfiles/filedetails/?id=1945909088


## `net_remover`
#### Description
Removes certain net messages that are never used or useless for our usecase.


## `player_pickup_fix`
#### Description
Fixes a weird Garry's Mod exploit that happens if a player issues an absurd amount of `Use` commands on a single entity.


## `remove_debugsphere`
#### Description
Stubs out the `debugoverlay.Sphere` function on servers running the `x86-64` branch to prevent instant-crashes
#### References
 - https://github.com/Facepunch/garrysmod-issues/issues/5359


## `swep_remover`
#### Description
Prevents configured weapon classes to be prevented from loading, such as abusive admin weapons.


# Development
**Halt!**
Are you **100% sure** your idea doesn't fit better in its own repo, or perhaps another one of our addons?
Loose-knit script repos like this are in danger of turning into a unmaintainable dumping ground. Please do your best to keep it clean and reasonable.


⚠️ The project structure and these rules are subject to change as we add more scripts.

All scripts should follow these rules:
 - Be contained to a single directory under `lua/cfc_gmod_scripts/`
 - Have an `sh_init.lua`, `sv_init.lua`, or `cl_init.lua` to run the realm-appropriate code for that script
 - Have a section in this README under the [Included Scripts](#included-scripts) category
    - Include a "Description" describing what it is and what it does
    - Special notes about side effects, potential issues, risks of using, etc.
    - Include a "References" category linking to associated GH issues, workshop addons, github projects, lines of code, etc.
    - README items should be sorted **alphabetically**, not in order of creation
 - **Should not run or cause errors if the resource they act upon is missing** (e.g. a wiremod script shouldn't do anything if wiremod isn't present)
 - Where reasonable, should still allow developers to reverse its functionality (e.g. storing removed/replaced functions on a logical global table)
