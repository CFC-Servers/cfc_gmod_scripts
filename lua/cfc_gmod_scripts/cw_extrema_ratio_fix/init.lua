AddCSLuaFile()
if SERVER then return end

local drawClumpSpread = weapons.Get( "cw_extrema_ratio_official" ).drawClumpSpread
local stored = weapons.GetStored( "cw_extrema_ratio_official" )

stored.drawClumpSpread = function( self, ... )
    if not self.hudScaler then
        self.hudScaler = ScrH() / 1080
    end

    return drawClumpSpread( self, ... )
end
