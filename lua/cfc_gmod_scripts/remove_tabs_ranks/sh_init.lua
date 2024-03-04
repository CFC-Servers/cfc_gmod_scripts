local enabled = CreateConVar( "cfc_gmodscripts_enable_removetabs", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Enable the RemoveTabs module.", 0, 1 )

if CLIENT then
    local hookRanks = {
        moderator = true,
        admin = true,
        superadmin = true,
        owner = true,
        director = true
    }

    hook.Add( "CFC_RemoveTabs_ShouldBlockNPCs", "CFC_GmodScripts_RankWhitelist", function( ply )
        if not enabled:GetBool() then return end

        if hookRanks[ply:GetUserGroup()] then
            return false
        end
    end )
end
