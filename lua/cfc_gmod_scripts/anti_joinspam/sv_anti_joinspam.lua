local connections = {}
local banDuration = 3

local enabled = GmodScripts.MakeToggle( "anti_joinspam", "Anti Join Spam functionality" )

hook.Add( "CheckPassword", "GMS_AntiJoinSpam", function( steamid64, ip, _, _, name )
    if not enabled:GetBool() then return end

    connections[steamid64] = ( connections[steamid64] or 0 ) + 1

    if connections[steamid64] >= 8 then
        ip = string.Explode( ":", ip )[1]
        RunConsoleCommand( "addip", banDuration, ip )
        RunConsoleCommand( "writeip" )

        local steamid = util.SteamIDFrom64( steamid64 )
        print( "GMS Anti join spam: ", name .. " " .. steamid .. " tried to spam join the server." )

        return false, "Too many connection attempts"
    end
end )

timer.Create( "GMS_AntiJoinSpam", 5, 0, function()
    if not enabled:GetBool() then return end

    for steamid64, count in pairs( connections ) do
        local newval = math.max( count - 1, 0 )
        if newval == 0 then
            connections[steamid64] = nil
        else
            connections[steamid64] = newval
        end
    end
end )
