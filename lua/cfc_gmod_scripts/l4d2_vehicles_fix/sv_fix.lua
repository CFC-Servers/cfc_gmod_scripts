return function()
    hook.Add( "Initialize", "L4D2_Handbrake_Fix", function()
        if not REN then return end
        REN._L4D2Handbrake = REN._L4D2Handbrake or REN.L4D2Handbrake
        REN.L4D2Handbrake = function( self )
            if not IsValid( self ) then return end
            if not IsValid( self.DriverSeat ) then return end
            return REN._L4D2Handbrake( self )
        end
    end )
end
