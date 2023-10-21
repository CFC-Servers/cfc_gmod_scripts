local allowed

local function deny( ply, name )
    if ply:IsValid() then
        ply:ChatPrint( "The effect '" .. name .. "' is not whitelisted and cannot be used" )
    end

    return false
end

hook.Add( "Expression2_CanEffect", "CFC_GmodScripts_EffectWhitelist", function( name, chip )
    if allowed[name] then return end

    local ply = chip.player
    return deny( ply, name )
end )

hook.Add( "Starfall_CanEffect", "CFC_GmodScripts_EffectWhitelist", function( name, instance )
    if allowed[name] then return end

    local ply = instance.player
    return deny( ply, name )
end )

GmodScripts_EffectWhitelist = {
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
    bloodimpact = true,
    rpgshotdown = true,
    watersplash = true,
    ar2explosion = true,
    cball_bounce = true,
    manhacksparks = true,
    cball_explode = true,
    electricspark = true,
    rifleshelleject = true,
    huntermuzzleflash = true,
    helicoptermegabomb = true,
    stridermuzzleflash = true,
    simfphys_tiresmoke = true,
    airboatmuzzleflash = true,

    lfs_exhaust = true,
    lfs_missile_explosion = true,
    acf_explosion = true,
    simfphys_engine_smoke = true,
}
allowed = GmodScripts_EffectWhitelist
