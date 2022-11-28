# cfc_gmod_scripts
A disgusting pile of loose-knit, à la carte scripts for Garry's Mod

# Included Scripts:


## `bigchat_restrictor`
#### Description
Uses the hooks provided by **[BigChat](https://github.com/CFC-Servers/gm_bigchat/)** to restrict it from certain ranks.
#### References
 - https://github.com/CFC-Servers/gm_bigchat


## `boreas_cleaner`
#### Description
Removes a variety of entity types at startup that lag players on `gm_boreas`.
#### Configuration
 - `cfc_gmod_scripts_boreas_cleaner` = `1/0`
#### References
 - https://steamcommunity.com/sharedfiles/filedetails/?id=1572373847


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
#### Configuration
 - `cfc_gmod_scripts_net_remover` = `1/0`


## `player_pickup_fix`
#### Description
Fixes a weird Garry's Mod exploit that happens if a player issues an absurd amount of `Use` commands on a single entity.
#### Configuration
 - `cfc_gmod_scripts_player_pickup_fix` = `1/0`


## `remove_debugsphere`
#### Description
Stubs out the `debugoverlay.Sphere` function on servers running the `x86-64` branch to prevent instant-crashes
#### Configuration
 - `cfc_gmod_scripts_debugsphere` = `1/0`
 - `cfc_gmod_scripts_debugsphere_reminder` = `1/0` (sends a reminder in console if the function is being called a lot)
#### References
 - https://github.com/Facepunch/garrysmod-issues/issues/5359


## `swep_remover`
#### Description
Prevents configured weapon classes to be prevented from loading, such as abusive admin weapons.
#### Configuration
 - `cfc_gmod_scripts_swep_remover` = `1/0`


# Development
**Halt!**
Are you **100% sure** your idea doesn't fit better in its own repo, or perhaps another one of our addons?
Loose-knit script repos like this are in danger of turning into a unmaintainable dumping ground. Please do your best to keep it clean and reasonable.


⚠️ The project structure and these rules are subject to change as we add more scripts.

All scripts should follow these rules:
 - Be contained to a single directory under `lua/cfc_gmod_scripts/`
 - Have an `init.lua` at the root of their directory that returns a function (which will receive the `utils` table)
 - Have a section in this README under the [Included Scripts](#included-scripts) category
    - Include a "Description" describing what it is and what it does
    - A "Configuration" outlining configuration or listing the convar to enable/disable it, if present
    - Special notes about side effects, potential issues, risks of using, etc.
    - Include a "References" category linking to associated GH issues, workshop addons, github projects, lines of code, etc.
    - README items should be sorted **alphabetically**, not in order of creation
 - If applicable, a ConVar (using `utils.makeConvar( string name, function enable, function disable )`) to enable/disable the functionality
 - **Should not run or cause errors if the resource they act upon is missing** (e.g. a wiremod script shouldn't do anything if wiremod isn't present)
 - Where reasonable, should be able to entirely undo their effect if disabled with a convar (e.g. a script that removes a hook should re-add the hook if the script is disabled with a convar)
