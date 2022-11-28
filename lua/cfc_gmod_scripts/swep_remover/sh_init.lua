return function( utils )
    local swepsToRemove = {
        weapon_c4 = true,         -- Undefusable, makes massive explosion and map wide smoke
        m9k_mmm_flaregun = true,  -- Does firedamage, fire damage is disabled. just minges builders.
        weapon_flashbang = true,  -- Errors on use
        weapon_ak47_admin = true, -- Shouldn't be used, admin weapon that does thousands of damage, gives max health and a ton of speed.
    }

    local setting = utils.makeConvar( "swep_remover" )

    hook.Add( "PreRegisterSWEP", "CFC_GmodScripts_RemoveSweps", function( _, class )
        if not setting:GetBool() then return end
        if swepsToRemove[class] then
            utils.log( "Preventing SWEP from registering: " .. class )
            return false
        end
    end )
end
