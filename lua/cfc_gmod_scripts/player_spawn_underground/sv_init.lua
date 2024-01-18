require( "playerload" )

local enable = CreateConVar( "cfc_gmodscripts_enable_spawn_underground", "1", FCVAR_ARCHIVE, "Spawn players underground to combat lag" )

local offset = Vector( 0, 0, 5000 )
local hookName = "CFC_GmodScripts_PlayerSpawnPosition"

local pendingFirstSpawn = {}

-- Set them below ground for their first spawn
hook.Add( "PlayerSpawn", hookName, function( ply )
    if not enable:GetBool() then return end
    if not pendingFirstSpawn[ply] then return end

    timer.Simple( 0, function()
        ply:SetPos( ply:GetPos() - offset )
        pendingFirstSpawn[ply] = nil
    end )
end )

-- Reset their position after they've fully loaded
hook.Add( "PlayerFullLoad", hookName, function( ply )
    if not enable:GetBool() then return end
    timer.Simple( 0, function()
        ply:SetPos( ply:GetPos() + offset )
    end )
end )

-- Create first-spawn queue
hook.Add( "PlayerInitialSpawn", hookName, function( ply )
    if not enable:GetBool() then return end
    pendingFirstSpawn[ply] = true
end )

hook.Add( "PlayerDisconnected", hookName, function( ply )
    if not enable:GetBool() then return end
    pendingFirstSpawn[ply] = nil
end )
