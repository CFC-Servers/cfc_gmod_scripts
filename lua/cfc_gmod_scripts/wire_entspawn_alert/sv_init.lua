local enabled = GmodScripts.MakeToggle( "wire_sent_spawn_alert", "Make wire log all SENT spawns", true )

hook.Add( "PreGamemodeLoaded", "CFC_GmodScripts_LoadWireSpawnStub", function()
    local logger = ulx and ulx.logSpawn or print

    local log = function( ply, entClass )
        if IsValid( ply ) then
            logger( string.format( "%s<%s> spawned sent %s", ply:Nick(), ply:SteamID(), entClass ) )
        else
            logger( string.format( "SENT was spawned without a valid owner:", entClass ) )
        end
    end

    local replaceDupeFunctions = {}

    local wrapper = function( original )
        local wrapped = function( ply, ... )
            local result = original( ply, ... )
            if not enabled:GetBool() then
                return result
            end

            if isentity( result ) then
                local entClass = result:GetClass()
                log( ply, entClass )
            else
                print( ply, "unknown", result )
            end

            return result
        end

        replaceDupeFunctions[original] = wrapped
        return wrapped
    end

    local dupeClasses = duplicator.EntityClasses

    local originalMakeWireEnt = WireLib.MakeWireEnt
    WireLib.MakeWireEnt = wrapper( originalMakeWireEnt )
    _G.MakeWireMotorController = wrapper( _G.MakeWireMotorController )
    _G.MakeWireHydraulicController = wrapper( _G.MakeWireHydraulicController )
    _G.MakeWireExpression2 = wrapper( _G.MakeWireExpression2 )

    -- Special case for gmod_wire_gate so we can figure out what action it is
    do
        local original = WireLib.MakeWireGate
        local gateStub = function( ply, pos, ang, model, action, ... )
            local result = original( ply, pos, ang, model, action, ... )
            if not enabled:GetBool() then
                return result
            end

            if isentity( result ) then
                local entClass = "gmod_wire_gate(" .. action .. ")"
                log( ply, entClass )
            end

            return result
        end

        -- This fun bit of nonsense lets us stub MakeWireGate (which calls MakeWireEnt) and print which gate was spawned but without duplicate prints.
        -- For example, if I spawn an Entity gate, MakeWireGate wrapper prints: gmod_wire_gate(rd_entity), but then it calls the wrapped MakeWireEnt and prints: gmod_wire_gate again
        -- This code prevents that by allowing MakeWireGate to call the original MakeWireEnt
        local specialWireLib = setmetatable( { MakeWireEnt = originalMakeWireEnt }, { __index = WireLib } )
        setfenv( original, setmetatable( { WireLib = specialWireLib }, { __index = _G } ) )

        WireLib.MakeWireGate = gateStub
        dupeClasses.gmod_wire_gate.Func = gateStub
    end

    -- Overwrite specific dupe functions that use local functions
    dupeClasses.sent_deployableballoons.Func = wrapper( dupeClasses.sent_deployableballoons.Func )
    dupeClasses.gmod_wire_egp.Func = wrapper( dupeClasses.gmod_wire_egp.Func )
    dupeClasses.gmod_wire_egp_hud.Func = wrapper( dupeClasses.gmod_wire_egp_hud.Func )
    dupeClasses.gmod_wire_egp_emitter.Func = wrapper( dupeClasses.gmod_wire_egp_emitter.Func )

    -- I can't figure out how to load at the right time, so this loops over all dupe functions and 
    -- replaces them with the wrapped version if they exist (we stub the global func after they already registered with duplicator idk)
    -- If you can find a hook that runs after autorun, but before weapons/entities/sents, then use that and remove this
    for _, data in pairs( dupeClasses ) do
        local wrapped = replaceDupeFunctions[data.Func]
        if wrapped then
            data.Func = wrapped
        end
    end
end )
