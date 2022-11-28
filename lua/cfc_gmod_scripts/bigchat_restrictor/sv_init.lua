return function()
    local no = {
        User = true,
        Regular = true
    }

    hook.Add( "BigChat_CanUse", "CFCGmodScripts_RankRestrict", function( ply )
        if not IsValid( ply ) then return end
        local team = team.GetName( ply:Team() )
        if no[team] then return false end
    end )
end
