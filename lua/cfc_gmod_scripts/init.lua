AddCSLuaFile()

local topLevel = "cfc_gmod_scripts"

local function log( name )
    print( "[CFC Gmod Scripts] Loading: ", name )
end

local function realmInclude( prefix, path )
    if prefix == "sv_" and SERVER then
        return include( path )
    end

    if prefix == "cl_" and CLIENT then
        AddCSLuaFile( path )
        return include( path )
    end

    -- sh_ and default is shared
    AddCSLuaFile( path )
    return include( path )
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
