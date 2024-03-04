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

# Included Scripts:

## `anti_joinspam`

### Description
Prevents players from spam rejoining the server to spam chat messages.

<br>


## `cw_extrema_ratio_fix`

### Description
Fixes the on-tick `hudScaler` error spam.

<br>


## `disablebloom`

### Description
Disables annoying bloom for maps that use bloom.

<br>


## `effects_whitelist`

### Description
Limits the effects that players can spawn to a pre-defined whitelist.

This affects:
- Manually spawning effects
- Spawning effects with E2's Effect Core
- Spawning effects with Starfall's Effect library

More effects can be whitelisted by adding them to the global `GmodScripts_EffectWhitelist` table.
```lua
hook.Add( "InitPostEntity", "example", function()
    GmodScripts_EffectWhitelist["my_effect"] = true
end )
```

<br>


## `l4d2_vehicles_fix`

### Description
Fixes a silly (but absurdly spammy) `nil` error that occurrs in a popular L4D2 SimfPhys Vehicle Pack (this fix has already been proposed upstream, but the author doesn't appear to want to implement it)

<br>


## `net_remover`

### Description
Removes certain net messages that are never used or useless for our usecase.

<br>


## `player_pickup_fix`

### Description
Fixes a weird Garry's Mod exploit that happens if a player issues an absurd amount of `Use` commands on a single entity.

<br>


## `remove_tabs_ranks`

### Description
Uses the [`cfc_remove_tabs`](https://github.com/CFC-Servers/cfc_remove_tabs) addons' hooks to allow Moderators+ access to NPCs.

### Config
- `cfc_gmodscripts_enable_removetabs` (1/0, replicated, archived)

<br>


## `swep_remover`

### Description
Prevents configured weapon classes to be prevented from loading, such as abusive admin weapons.

<br>


