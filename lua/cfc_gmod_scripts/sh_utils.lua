AddCSLuaFile()

local Utils = {}
local convarPrefix = "cfc_gmod_scripts_"

function Utils.makeConvar( name, enable, disable )
    local settingName = convarPrefix .. name
    local setting = CreateConVar( settingName, 1, FCVAR_ARCHIVE )

    if not ( enable or disable ) then
        return setting
    end

    cvars.AddChangeCallback( settingName, function( _, _, new )
        if new == "1" and enable then
            return enable()
        end

        if new == "0" and disable then
            return disable()
        end
    end )

    return setting
end

function Utils.log( ... )
    print( "[CFC Gmod Scripts] ", ... )
end

return Utils
