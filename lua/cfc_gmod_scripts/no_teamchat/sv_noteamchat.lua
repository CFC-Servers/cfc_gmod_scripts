if engine.ActiveGamemode() ~= "sandbox" then return end -- Other gamemodes will actually have a use for teamchat

local ranks = {
    user = true,
    regular = true
}

hook.Add( "PlayerCanSeePlayersChat", "GmodScripts_PublicTeamChat", function( _text, team, _listener, speaker )
    local usergroup = speaker:GetUserGroup()
    if not ranks[usergroup] then return end
    if team then return true end
end )
