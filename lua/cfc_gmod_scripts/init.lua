AddCSLuaFile()

local topLevel = "cfc_gmod_scripts"

local function log( name )
    print( "[CFC Gmod Scripts] Loading: ", name )
end

-- ChatGPT says this is the best way to do this
local function realmInclude( prefix, path )
    local is_cl, is_sv = prefix == "cl_", prefix == "sv_"

    if is_cl or not is_sv then AddCSLuaFile( path ) end
    if is_sv == SERVER or is_cl then return include( path ) end
end

local _, dirs = file.Find( topLevel .. "/*", "LUA" )

for _, dir in ipairs( dirs ) do
    log( dir )
    local files = file.Find( topLevel .. "/" .. dir .. "/*", "LUA" )

    for _, fil in ipairs( files ) do
        local prefix = string.sub( fil, 1, 3 )
        local path = dir .. "/" .. fil

        realmInclude( prefix, path )
    end
end
