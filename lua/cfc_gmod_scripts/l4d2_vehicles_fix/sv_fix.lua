-- https://steamcommunity.com/sharedfiles/filedetails/?id=1945909088
local enabled = GmodScripts.MakeToggle( "l4d2_handbrake_fix", "Fix the handbrake in L4D2 vehicles" )

hook.Add( "Initialize", "L4D2_Handbrake_Fix", function()
    if not REN then return end
    if not enabled:GetBool() then return end

    REN._L4D2Handbrake = REN._L4D2Handbrake or REN.L4D2Handbrake
    REN.L4D2Handbrake = function( self )
        if not IsValid( self ) then return end
        if not IsValid( self.DriverSeat ) then return end
        return REN._L4D2Handbrake( self )
    end
end )
