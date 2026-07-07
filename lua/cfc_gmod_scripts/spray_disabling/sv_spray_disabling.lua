
local allowUploadCvar = GetConVar( "sv_allowupload" )

if allowUploadCvar:GetBool() then return end -- uploads allowed? sprays allowed

hook.Add( "PlayerSpray", "cfc_telegraph_spray_block", function( sprayer )
    sprayer:PrintMessage( HUD_PRINTTALK, "Sprays are disabled." ) -- tell client what's up
    return false -- and block the sound
end )
