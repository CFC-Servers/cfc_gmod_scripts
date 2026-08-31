hook.Add( "CFC_PvP_ShouldBlockDamage", "AllowStriderBusterDamage", function( ent )
    if ent:GetClass() == "weapon_striderbuster" then
        return false
    end
end )
