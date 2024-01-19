require( "playerload" )

local enable = CreateConVar( "cfc_gmodscripts_spawnin_lag_fixer", "1", FCVAR_ARCHIVE, "Spawn players underground to combat lag" )

local table_remove = table.remove
local table_insert = table.insert
local entMeta = FindMetaTable( "Entity" )
local Entity_IsValid = entMeta.IsValid
local SetPreventTransmit = entMeta.SetPreventTransmit

--- Active ent queues for players that have loaded in
local queues = {}
--- Player queues that need to be processed when they fully load
local pending = {}
--- Entities that were spawned by players
local trackedEnts = {}

-- Main queue processing loop. Processes N items from each queue
hook.Add( "Think", "SpawnInLagFixer", function()
    local queueCount = #queues

    for q = 1, queueCount do
        local struct = pending[q]

        local ply = struct[1]
        local queue = struct[2]

        -- Process 10 items from each player's queue
        for i = 1, 10 do
            local ent = table_remove( queue )
            if not ent then break end

            if Entity_IsValid( ent ) then
                SetPreventTransmit( ent, ply, false )
            else
                -- Always do at least 10 entities for each player if we can
                i = i - 1
            end
        end
    end
end )


-- On initial spawn, prevent all ents from being transmitted to them
-- Then track the ents that we stopped transmitting to them
hook.Add( "PlayerInitialSpawn", "SpawnInLagFixer", function( ply )
    if not enable:GetBool() then return end

    -- While we're looping the tracked ents anyway, we also re-build the list to remove invalid ents
    local newEnts = {}
    local plyPending = {}

    local entCount = #trackedEnts
    for i = 1, entCount do
        local ent = trackedEnts[i]

        if Entity_IsValid( ent ) then
            table_insert( newEnts, ent )
            table_insert( plyPending, ent )

            -- TODO: This might need to be queued or something, it'll be laggy
            SetPreventTransmit( ent, ply, true )
        end
    end

    -- These are the ents that we stopped transmitting to them
    -- When they fully load, we will start transmitting them in batches
    pending[ply] = plyPending

    -- "passive" validity insurance
    trackedEnts = newEnts
end )


--- They fully loaded, now we can queue up their pending ents
hook.Add( "PlayerFullLoad", "SpawnInLagFixer", function( ply )
    if not enable:GetBool() then return end

    table_insert( queues, { ply, pending[ply] } )
    pending[ply] = nil
end )

local function handleNewEnt( _, model, ent )
    if not enable:GetBool() then return end
    if not ent then ent = model end
    table_insert( trackedEnts, ent )
end

hook.Add( "PlayerSpawnedProp", "SpawnInLagFixer", handleNewEnt )
hook.Add( "PlayerSpawnedSENT", "SpawnInLagFixer", handleNewEnt )
hook.Add( "PlayerSpawnedRagdoll", "SpawnInLagFixer", handleNewEnt )
hook.Add( "PlayerSpawnedVehicle", "SpawnInLagFixer", handleNewEnt )
hook.Add( "PlayerSpawnedSWEP", "SpawnInLagFixer", handleNewEnt )
