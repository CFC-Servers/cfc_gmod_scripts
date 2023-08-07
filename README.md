# cfc_gmod_scripts
A disgusting pile of loose-knit, à la carte scripts for Garry's Mod

# Included Scripts:

## `bigchat_restrictor`

### Description
Uses the hooks provided by **[BigChat](https://github.com/CFC-Servers/gm_bigchat/)** to restrict it from certain ranks.

<br>

## `cw_extrema_ratio_fix`

### Description
Fixes the on-tick `hudScaler` error spam.

<br>

## `swep_remover`

### Description
Prevents configured weapon classes to be prevented from loading, such as abusive admin weapons.

<br>

## `player_pickup_fix`

### Description
Fixes a weird Garry's Mod exploit that happens if a player issues an absurd amount of `Use` commands on a single entity.

<br>

## `l4d2_vehicles_fix`

### Description
Fixes a silly (but absurdly spammy) `nil` error that occurrs in a popular L4D2 SimfPhys Vehicle Pack (this fix has already been proposed upstream, but the author doesn't appear to want to implement it)

<br>

## `net_remover`

### Description
Removes certain net messages that are never used or useless for our usecase.

<br>

## `disablebloom`

### Description
Disables annoying bloom for maps that use bloom.

<br>

## `lfs_advert`

### Description
Removes the annoying LFS spawn in message

<br>

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
