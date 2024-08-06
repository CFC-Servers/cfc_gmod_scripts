local connections = {}
local banDuration = 3

local enabled = GmodScripts.MakeToggle( "anti_joinspam", "Anti Join Spam functionality" )

hook.Add( "CheckPassword", "GMS_AntiJoinSpam", function( steamid64, ip, _, _, name )
    if not enabled:GetBool() then return end
    ip = string.Explode( ":", ip )[1]

    connections[steamid64] = ( connections[steamid64] or 0 ) + 1
    connections[ip] = ( connections[ip] or 0 ) + 1

    timer.Create( "GMS_ConnectCooldown_" .. steamid64, 5, 1, function()
        connections[steamid64] = nil
        connections[ip] = nil
    end )

    if connections[steamid64] >= 4 or connections[ip] >= 4 then
        RunConsoleCommand( "addip", banDuration, ip )
        RunConsoleCommand( "writeip" )

        local steamid = util.SteamIDFrom64( steamid64 )
        print( "GMS Anti join spam: ", name .. " " .. steamid .. " tried to spam join the server." )

        return false, "Too many connection attempts"
    end
end )
