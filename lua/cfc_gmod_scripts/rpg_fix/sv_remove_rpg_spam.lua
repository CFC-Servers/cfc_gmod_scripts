local rpgCooldown = 3
hook.Add( "PlayerSwitchWeapon", "RPG_ArmTime", function( _, oldWeapon, _ )
    if not IsValid( oldWeapon ) then return end
    if oldWeapon:GetClass() == "weapon_rpg" then
        local sequenceName = oldWeapon:GetSequenceName( oldWeapon:GetSequence() )
        if sequenceName == "reload" then
            oldWeapon:SetNextPrimaryFire( CurTime() + rpgCooldown )
        end
    end
end )
