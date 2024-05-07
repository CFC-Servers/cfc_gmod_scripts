AddCSLuaFile()

GmodScripts = {}
local topLevel = "cfc_gmod_scripts"
local convarPrefix = "cfc_gmodscripts_"

local SERVER = SERVER
local CLIENT = CLIENT

--- Logs a prefixed message to the console
--- @vararg any
function GmodScripts.Log( ... )
    print( "[CFC Gmod Scripts]", ... )
end

--- Creates a convar to toggle functionality
--- @param name string
--- @param description string
--- @param replicated? boolean (Default: false)
--- @return ConVar
function GmodScripts.MakeToggle( name, description, replicated )
    name = convarPrefix .. name

    local flags = FCVAR_ARCHIVE
    if replicated then flags = flags + FCVAR_REPLICATED end

    return CreateConVar( name, "1", flags, description )
end

--- Logs the loading of a module
--- @param name string
local function logModuleLoad( name )
    GmodScripts.Log( "Loading: ", name )
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
        logModuleLoad( dir )
    end

    if SERVER and isServer then
        logModuleLoad( dir )
    end
end
