local function hasCustomCollisions( ent )
    local solidFlags = ent:GetSolidFlags()
    return bit.band( solidFlags, bit.bor( FSOLID_CUSTOMRAYTEST, FSOLID_CUSTOMBOXTEST ) ) == bit.bor( FSOLID_CUSTOMRAYTEST, FSOLID_CUSTOMBOXTEST )
end


local EntityMeta = FindMetaTable( "Entity" )

EntityMeta._GMS_PhysicsInitSphere = EntityMeta._GMS_PhysicsInitSphere or EntityMeta.PhysicsInitSphere

function EntityMeta:PhysicsInitSphere( ... )
    if hasCustomCollisions( self ) then
        self:EmitSound( "buttons/button10.wav" )
        return
    end

    self:_GMS_PhysicsInitSphere( ... )
end

