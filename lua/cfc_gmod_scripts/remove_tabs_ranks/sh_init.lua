-- Interfaces with: https://github.com/CFC-Servers/cfc_remove_tabs
local enabled = GmodScripts.MakeToggle( "rank_restrict_removetabs", "Disable CFC_RemoveTabs functionality for specific ranks" )

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
