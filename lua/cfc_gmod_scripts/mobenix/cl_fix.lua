if game.GetMap() == "gm_mobenix_v3_final" then return end

hook.Add( "InitPostEntity", "GMS_RemoveMobenixLua", function()
    timer.Remove( "mobenix_utrain" )
    timer.Remove( "mobenix_uplayer" )
end )
