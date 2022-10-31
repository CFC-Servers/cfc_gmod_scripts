local removeThese = {
    env_steam = true,
    env_sprite = true,
    prop_ragdoll = true,
    light_dynamic = true,
    env_soundscape = true,
    func_dustmotes = true,
    ambient_generic = true,
    point_spotlight = true,
    func_illusionary = true,
    env_physexplosion = true,
    env_fog_controller = true,
    func_reflective_glass = true
}

local function isMapEnt( ent )
    return ent:MapCreationID() ~= -1
end

hook.Add( "InitPostEntity", "GMS_BoreasCleaner", function()
    if game.GetMap() ~= "gm_boreas" then return end

    for _, ent in ipairs( ents.GetAll() ) do
        if removeThese[ent:GetClass()] and isMapEnt( ent ) then
            SafeRemoveEntity( ent )
        end
    end
end )
