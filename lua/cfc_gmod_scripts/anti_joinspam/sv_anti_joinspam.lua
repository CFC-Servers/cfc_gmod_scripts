local connections = {}
local banDuration = 3

hook.Add( "CheckPassword", "GMS_AntiJoinSpam", function( steamid64, ip, _, _, name )
    ip = string.Explode( ":", ip )[1]
    local steamid = util.SteamIDFrom64( steamid64 )

    connections[ip] = connections[ip] or 0
    connections[ip] = connections[ip] + 1

    if connections[ip] >= 8 then
        RunConsoleCommand( "addip", banDuration, ip )
        RunConsoleCommand( "writeip" )

        print( "GMS Anti join spam: ", name .. " " .. steamid .. " tried to spam join the server." )

        return false, "Too many connection attempts"
    end
end )

timer.Create( "GMS_AntiJoinSpam", 5, 0, function()
    for ip, count in pairs( connections ) do
        local newval = math.max( count - 1, 0 )
        if newval == 0 then
            connections[ip] = nil
        else
            connections[ip] = newval
        end
    end
end )
