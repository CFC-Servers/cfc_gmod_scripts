hook.Add( "CanTool", "CFC_GmodScripts_WeaponClipFix", function( ply, tr, toolName )
    if toolName ~= "proper_clipping" then return end
    if not tr.Hit then return end

    local hitEnt = tr.Entity
    if not hitEnt then return end
    if not hitEnt:IsValid() then return end

    if string.StartsWith( hitEnt:GetModel(), "models/weapons" ) then
        -- Prints on SV and CL
        print( "[CFC_GmodScripts] WeaponClipFix: Blocked proper clipping on weapon model" )

        return false
    end
end )
