if engine.ActiveGamemode() ~= "sandbox" then return end -- Other gamemodes will actually have a use for teamchat
local enabled = GmodScripts.MakeToggle( "public_team_chat", "Allow all ranks to see team chat from users/regulars" )

local ranks = {
    user = true,
    regular = true
}

hook.Add( "PlayerCanSeePlayersChat", "GmodScripts_PublicTeamChat", function( _text, team, _listener, speaker )
    if not enabled:GetBool() then return end

    if not IsValid( speaker ) then return end
    local usergroup = speaker:GetUserGroup()
    if not ranks[usergroup] then return end
    if team then return true end
end )
