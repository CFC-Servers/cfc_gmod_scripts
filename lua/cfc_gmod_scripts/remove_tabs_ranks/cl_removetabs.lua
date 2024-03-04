local hookRanks = {
    moderator = true,
    admin = true,
    superadmin = true,
    owner = true,
    director = true
}

hook.Add( "CFC_RemoveTabs_ShouldBlockNPCs", "CFC_GmodScripts_RankWhitelist", function( ply )
    if hookRanks[ply:GetUserGroup()] then
        return false
    end
end )
