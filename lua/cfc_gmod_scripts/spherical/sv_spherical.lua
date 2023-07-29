local function hasCustomCollisions( ent )
    local solidFlags = ent:GetSolidFlags()
    return bit.band( solidFlags, bit.bor( FSOLID_CUSTOMRAYTEST, FSOLID_CUSTOMBOXTEST ) ) == bit.bor( FSOLID_CUSTOMRAYTEST, FSOLID_CUSTOMBOXTEST )
end

local EntityMeta = FindMetaTable( "Entity" )

EntityMeta._GMS_PhysicsInitSphere = EntityMeta._GMS_PhysicsInitSphere or EntityMeta.PhysicsInitSphere

function EntityMeta:PhysicsInitSphere( ... )
    if hasCustomCollisions( self ) then
        print( "[CFC_GmodScripts] [WARN] Attempted to call PhysicsInitSphere on an entity with custom collisions. Ignoring." )
        self:EmitSound( "buttons/button10.wav" )
        return false
    end

    return self:_GMS_PhysicsInitSphere( ... )
end

