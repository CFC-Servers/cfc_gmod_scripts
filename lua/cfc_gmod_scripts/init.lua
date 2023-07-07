AddCSLuaFile()

local topLevel = "cfc_gmod_scripts"

local SERVER = SERVER
local CLIENT = CLIENT

local function log( name )
    print( "[CFC Gmod Scripts] Loading: ", name )
end

-- ChatGPT says this is the best way to do this
local function realmInclude( path, isCL, isSV, isSH )
    if SERVER and ( isCL or isSH ) then
        AddCSLuaFile( path )
    end

    if CLIENT and ( isCL or isSH ) then
        include( path )
    end

    if SERVER and ( isSV or isSH ) then
        include( path )
    end
end

local _, dirs = file.Find( topLevel .. "/*", "LUA" )

for _, dir in ipairs( dirs ) do
    local files = file.Find( topLevel .. "/" .. dir .. "/*", "LUA" )
    local isServer, isClient = false, false

    for _, fil in ipairs( files ) do
        local prefix = string.sub( fil, 1, 3 )
        local path = dir .. "/" .. fil

        local isCL, isSV, isSH = prefix == "cl_", prefix == "sv_", prefix == "sh_"

        if isCL or isSH then
            isClient = true
        end

        if isSV or isSH then
            isServer = true
        end

        realmInclude( path, isCL, isSV, isSH )
    end

    if CLIENT and isClient then
        log( dir )
    end

    if SERVER and isServer then
        log( dir )
    end
end
