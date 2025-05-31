hook.Add( "InitPostEntity", "cfc_homeless_easy", function()
    if not terminator_Extras then return end
    terminator_Extras.homeless_EasyMode = true

end )
