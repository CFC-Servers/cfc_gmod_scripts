AddCSLuaFile()

local function log( name )
    print( "[CFC Gmod Scripts] Loading: ", name )
end

local topLevel = "cfc_gmod_scripts"

local _, dirs = file.Find( topLevel .. "/*", "LUA" )

for i = 1, #dirs do
    local dir = dirs[i]
    log( dir )

    local path = string.format( "%s/%s/init.lua", topLevel, dir )
    include( path )
end
