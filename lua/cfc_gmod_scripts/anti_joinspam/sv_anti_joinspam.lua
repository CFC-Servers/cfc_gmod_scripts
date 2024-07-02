local connections = {}
local banDuration = 3

hook.Add( "CheckPassword", "GMS_AntiJoinSpam", function( steamid64, ip, _, _, name )
    connections[steamid64] = ( connections[steamid64] or 0 ) + 1

    timer.Create( "GMS_ConnectCooldown_" .. steamid64, 10, 1, function()
        connections[steamid64] = nil
    end )

    if connections[steamid64] >= 5 then
        ip = string.Explode( ":", ip )[1]
        RunConsoleCommand( "addip", banDuration, ip )
        RunConsoleCommand( "writeip" )

        local steamid = util.SteamIDFrom64( steamid64 )
        print( "GMS Anti join spam: ", name .. " " .. steamid .. " tried to spam join the server." )

        return false, "Too many connection attempts"
    end
end )
