require( "playerload" )

local function Deque()
    local Data = {}
    local Queue = {}

    local head = 1
    local tail = 0
    local size = 0

    function Queue.Push( value )
        tail = tail + 1
        Data[tail] = value

        size = size + 1
    end

    function Queue.Pop()
        if head > tail then return nil end

        local value = Data[head]
        Data[head] = nil
        head = head + 1
        size = size - 1

        return value
    end

    function Queue.IsEmpty()
        return size == 0
    end

    function Queue.GetSize()
        return size
    end

    return Queue
end


local enable = CreateConVar( "cfc_gmodscripts_spawnin_lag_fixer", "1", FCVAR_ARCHIVE, "Spawn players underground to combat lag" )

local plys = {}
local plyCount = 0
timer.Create( "SpawnInLagFixer", 1, 0, function()
    plys = player.GetAll()
    plyCount = #plys
end )

local queue = Deque()
local queue_Push = queue.Push
local queue_Pop = queue.Pop
local queue_IsEmpty = queue.IsEmpty

local entMeta = FindMetaTable( "Entity" )
local Entity_IsValid = entMeta.IsValid
do
    local SetPreventTransmit = entMeta.SetPreventTransmit

    hook.Add( "Think", "SpawnInLagFixer", function()
        if queue_IsEmpty() then return end

        for i = 1, 10 do
            local struct = queue_Pop()
            if not struct then return end

            local ply = struct[1]
            local ent = struct[2]

            if ent:IsValid() then
                SetPreventTransmit( ent, ply, false )
            else
                i = i - 1
            end
        end
    end )
end

local trackedEnts = {}
local table_insert = table.insert

hook.Add( "PlayerInitialSpawn", "SpawnInLagFixer", function( ply )
    if not enable:GetBool() then return end

    local newEnts = {}

    local entCount = #trackedEnts
    for i = 1, entCount do
        local ent = trackedEnts[i]

        if Entity_IsValid( ent ) then
            table_insert( newEnts, ent )
            SetPreventTransmit( ent, ply, true )
        end
    end
end )


local pendingEnts = {}

gameevent.Listen( "player_connect" )
hook.Add( "player_connect", "SpawnInLagFixer", function( data )
    if not enable:GetBool() then return end
    local ply = Player( data.userid )
    pendingEnts[ply] = {}
end )

hook.Add( "PlayerFullLoad", "SpawnInLagFixer", function( ply )
    if not enable:GetBool() then return end

    local pending = pendingEnts[ply]
    local count = #pending

    for i = 1, count do
        local struct = pending[i]
        queue_Push( struct )
    end

    pendingEnts[ply] = nil
end )

local function handleNewEnt( _, model, ent )
    if not enable:GetBool() then return end
    if not ent then ent = model end

    for i = 1, plyCount do
        local ply = plys[i]

        local struct = { ply, ent }
        local pending = pendingEnts[ply]

        if pending then
            -- If they're still loading in, we don't want to start processing their queue yet
            table_insert( pending, struct )
        else
            -- Otherwise, we can just add it to the queue
            queue_Push( struct )
        end

        SetPreventTransmit( ent, ply, true )
        table_insert( trackedEnts, ent )
    end
end

hook.Add( "PlayerSpawnedProp", "SpawnInLagFixer", handleNewEnt )
hook.Add( "PlayerSpawnedSENT", "SpawnInLagFixer", handleNewEnt )
hook.Add( "PlayerSpawnedRagdoll", "SpawnInLagFixer", handleNewEnt )
hook.Add( "PlayerSpawnedVehicle", "SpawnInLagFixer", handleNewEnt )
hook.Add( "PlayerSpawnedSWEP", "SpawnInLagFixer", handleNewEnt )
