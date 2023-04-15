local uptime = system.AppTime()
local mintime = 5 * 60 -- 5 minutes

if uptime <= mintime then return end

RunConsoleCommand( "r_flushlod" )
