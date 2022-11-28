return function()
    local className = "cw_extrema_ratio_official"

    hook.Add( "InitPostEntity", "CFC_GmodScripts_Load", function()
        local weapon = weapons.Get( className )
        if not weapon then return end
        local drawClumpSpread = weapon.drawClumpSpread
        local stored = weapons.GetStored( className )

        stored.drawClumpSpread = function( self, ... )
            if not self.hudScaler then
                self.hudScaler = ScrH() / 1080
            end

            return drawClumpSpread( self, ... )
        end
    end )
end
