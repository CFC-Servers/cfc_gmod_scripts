local allowed
local enabled = GmodScripts.MakeToggle( "effect_whitelist", "Enable the effect whitelist" )

local function deny( ply, name )
    if ply:IsValid() then
        ply:ChatPrint( "The effect '" .. name .. "' is not whitelisted and cannot be used" )
    end

    return false
end

hook.Add( "Expression2_CanEffect", "CFC_GmodScripts_EffectWhitelist", function( name, chip )
    if not enabled:GetBool() then return end
    if allowed[name] then return end

    local ply = chip.player
    if ply:IsAdmin() then return end

    return deny( ply, name )
end )

hook.Add( "Starfall_CanEffect", "CFC_GmodScripts_EffectWhitelist", function( name, instance )
    if not enabled:GetBool() then return end
    if allowed[name] then return end

    local ply = instance.player
    if ply:IsAdmin() then return end

    -- Only send the error message to the Starfall owner
    if SERVER or ( CLIENT and ply == LocalPlayer() ) then
        return deny( ply, name )
    end

    return false
end )

GmodScripts.EffectWhitelist = {
    sparks = true,
    explosion = true,
    ar2impact = true,
    wheeldust = true,
    ar2tracer = true,
    metalspark = true,
    boltimpact = true,
    antliongib = true,
    vortdispel = true,
    bloodspray = true,
    muzzleflash = true,
    impactgauss = true,
    thumperdust = true,
    waterripple = true,
    gausstracer = true,
    bloodimpact = true,
    rpgshotdown = true,
    watersplash = true,
    muzzleeffect = true,
    ar2explosion = true,
    cball_bounce = true,
    manhacksparks = true,
    cball_explode = true,
    electricspark = true,
    rifleshelleject = true,
    huntermuzzleflash = true,
    gunshipmuzzleflash = true,
    helicoptermegabomb = true,
    stridermuzzleflash = true,
    simfphys_tiresmoke = true,
    airboatmuzzleflash = true,

    lfs_exhaust = true,
    lfs_explosion = true,
    lfs_missile_explosion = true,
    lfs_explosion_nodebris = true,
    acf_explosion = true,
    acf_heat_explosion = true,
    simfphys_engine_smoke = true,
    eff_jack_plasmaarc = true,
    entity_remove = true,
    inflator_magic = true,
    LaserTracer = true,
    phys_freeze = true,
    phys_unfreeze = true,
    propspawn = true,
    selection_indicator = true,
    selection_ring = true,
    wheel_indicator = true,
    HL1GaussWallImpact2 = true,

    glide_explosion = true,
    glide_afterburner_flame = true,
    glide_afterburner = true,
    glide_boat_foam = true,
    glide_boat_propeller = true,
    glide_boat_splash = true,
    glide_damaged_engine = true,
    glide_damaged_exhaust = true,
    glide_exhaust = true,
    glide_fire = true,
    glide_flare = true,
    glide_metal_impact = true,
    glide_missile = true,
    glide_projectile = true,
    glide_tank_cannon = true,
    glide_tire_roll = true,
    glide_tire_slip_forward = true,
    glide_tracer = true,

    glide_firework = true,
    glide_explosion_firework = true,
}
allowed = GmodScripts.EffectWhitelist
