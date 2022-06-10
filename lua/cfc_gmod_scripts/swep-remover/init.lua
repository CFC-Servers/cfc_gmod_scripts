AddCSLuaFile()

local swepsToRemove = {
    m9k_mmm_flaregun = true, -- Does firedamage, fire damage is disabled. just minges builders.
    weapon_ak47_admin = true, -- Shouldn't be used, admin weapon that does thousands of damage, gives max health and a ton of speed.
    weapon_flashbang = true, -- Errors on use
    weapon_c4 = true, -- Undefusable, makes massive explosion and map wide smoke
}

hook.Add( "PreRegisterSWEP", "CFC_GmodScripts_RemoveSweps", function( _, class )
    if swepsToRemove[class] then return false end
end )
