AddCSLuaFile()
if SERVER then return end

local className = "cw_extrema_ratio_official"

hook.Add( "InitPostEntity", "CFC_GmodScripts_Load", function()
    local drawClumpSpread = weapons.Get( className ).drawClumpSpread
    local stored = weapons.GetStored( className )

    stored.drawClumpSpread = function( self, ... )
        if not self.hudScaler then
            self.hudScaler = ScrH() / 1080
        end

        return drawClumpSpread( self, ... )
    end
end )
