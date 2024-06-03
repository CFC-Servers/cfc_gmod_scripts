hook.Add( "OnEntityCreated", "GmodScripts_DisableProjectedTextureShadows", function( ent )
    if not IsValid( ent ) then return end
    if ent:GetClass() ~= "env_projectedtexture" then return end
    timer.Simple( 0, function()
        if not IsValid( ent ) then return end
        ent:SetKeyValue( "enableshadows", 0 )
    end )
end )
