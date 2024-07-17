# cfc_gmod_scripts
A disgusting pile of loose-knit, à la carte scripts for Garry's Mod

# Development
**Halt!**
Are you **100% sure** your idea doesn't fit better in its own repo, or perhaps another one of our addons?
Loose-knit script repos like this are in danger of turning into a unmaintainable dumping ground. Please do your best to keep it clean and reasonable.


⚠️ The project structure and these rules are subject to change as we add more scripts.

All scripts should follow these rules:
 - Be contained to a single directory under `lua/cfc_gmod_scripts/`
 - Have an `init.lua` at the root of their directory
 - Have a section in this README under the [Included Scripts](#included-scripts) category
 - Ideally, have a convar to enable/disable them

---

# Configuration
All shared/server scripts have a convar to enable/disable them.
Where relevant, these convars are replicated to the client, so the the server can easily disable them for both realms.

Unless otherwise stated, all config convars are:
- `FCVAR_ARCHIVE`'d
- Prefixed with `cfc_gmodscripts_`
- Default to `1` _(enabled)_
- Replicated to the client _(for shared scripts)_


# Included Scripts:

## `anti_joinspam`

### Description
- **Server**
Prevents players from spam rejoining the server to spam chat messages.

### Config
- `cfc_gmodscripts_anti_joinspam` (`1/0`)

<br>


## `cw_extrema_ratio_fix`

### Description
- **Client**
Fixes on-tick `hudScaler` error spam with the [CW 2.0 Melee Base](https://steamcommunity.com/workshop/filedetails/?id=707343339)

### Config
- `cfc_gmodscripts_anti_joinspam` (`1/0`)

<br>


## `disablebloom`

### Description

Disables annoying bloom for maps that use bloom.

<br>


## `effects_whitelist`

### Description
- **Shared**
Limits the effects that players can spawn to a pre-defined whitelist.

This affects:
- Manually spawning effects
- Spawning effects with E2's Effect Core
- Spawning effects with Starfall's Effect library

More effects can be whitelisted by adding them to the global `GmodScripts.EffectWhitelist` table.
```lua
hook.Add( "InitPostEntity", "example", function()
    GmodScripts.EffectWhitelist["my_effect"] = true
end )
```

### Config
- `cfc_gmodscripts_effect_whitelist`


<br>


## `l4d2_vehicles_fix`

### Description
- **Server**
Fixes a silly (but absurdly spammy) `nil` error that occurrs in a popular L4D2 SimfPhys Vehicle Pack (this fix has already been proposed upstream, but the author doesn't appear to want to implement it)

### Config
- `cfc_gmodscripts_l4d2_handbrake_fix`

<br>


## `mobenix`

### Description
- **Client**
Fixes some spammy Lua errors on the [base Mobenix map](https://steamcommunity.com/sharedfiles/filedetails/?id=1617295051)

<br>


## `net_remover`

### Description
- **Server**
Removes certain net messages that are never used or useless for our usecase.

### Config
- `cfc_gmodscripts_remove_bad_net_receivers`

<br>


## `no_teamchat`

### Description
- **Server**
Fixes a situation where users/regulars use Team chat and cannot be seen by others.
Forces those ranks to use global chat even if they use Team chat.

### Config
- `cfc_gmodscripts_public_team_chat`

<br>


## `player_pickup_fix`

### Description
- **Server**
Fixes a weird Garry's Mod exploit that happens if a player issues an absurd amount of `Use` commands on a single entity.

### Config
- `cfc_gmodscripts_player_pickup_fix`

<br>


## `remove_debugsphere`

### Description
- **Server**
Fixes a crash that occurs on Linux servers that use `debugoverlay.Sphere`

<br>


## `projectedtexture`

### Description
`env_projectedtexture` entities with the `enableshadow` property enabled _(as in wire lights and lamps)_ appear to cause a huge amount of clientside lag when they face other props _(and cast shadows)_
This disables the `enableshadow` property on all newly created `env_projectedtexture` entities.

<br>


## `remove_tabs_ranks`

### Description
- **Shared**
Uses the [`cfc_remove_tabs`](https://github.com/CFC-Servers/cfc_remove_tabs) addons' hooks to allow Moderators+ access to NPCs.

### Config
- `cfc_gmodscripts_rank_restrict_removetabs`

<br>


## `swep_remover`

### Description
- **Shared**
Prevents configured weapon classes to be prevented from loading, such as abusive admin weapons.

### Config
- `cfc_gmodscripts_remove_sweps`

<br>


## `targetid_override`

### Description
- **Client**
Replicates the [Simple Armor Display](https://steamcommunity.com/sharedfiles/filedetails/?id=2841350210) addon

<br>

## `uncache_crash_fix`

### Description
- **Client**
Forces clients to use the new `gmod_uncache_test` convar at a value of `1`, which should reduce crashes


## `vertex_fix`

### Description
- **Client**
Clientside fix that forces clients to run `r_flushlod` if they join when the server has a short uptime

<br>


## `weapon_clip_fix`

### Description
- **Shared**
Fixes a bug where using Proper Clipping on a dropped weapon would crash the server

### Config
- `cfc_gmodscripts_weapon_clip_fix`

<br>


