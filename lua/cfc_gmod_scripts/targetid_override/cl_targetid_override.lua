-- https://steamcommunity.com/sharedfiles/filedetails/?id=2841350210

local LocalPlayer = LocalPlayer
local surface_SetFont = surface.SetFont
local surface_GetTextSize = surface.GetTextSize
local gui_MousePos = gui.MousePos
local ScrW = ScrW
local ScrH = ScrH
local team_GetColor = team.GetColor
local IsValid = IsValid
local draw_SimpleText = draw.SimpleText

local nameFont = "TargetID"
local statsFont = "TargetIDSmall"
local color1 = Color( 0, 0, 0, 120 )
local color2 = Color( 0, 0, 0, 50 )

hook.Add( "HUDDrawTargetID", "SimpleArmorDisplay", function()
    return false
end )

hook.Add( "HUDPaint", "SimpleArmorDisplay", function()
    local visEnt = LocalPlayer():GetEyeTrace().Entity

    if not IsValid( visEnt ) then return end
    if not visEnt:IsPlayer() then return end

    local nameText = visEnt:Nick()

    surface_SetFont( nameFont )
    local nameW, nameH = surface_GetTextSize( nameText )

    local mouseX, mouseY = gui_MousePos()

    if mouseX == 0 and mouseY == 0 then
        mouseX = ScrW() / 2
        mouseY = ScrH() / 2
    end

    local nameX = mouseX - nameW / 2
    local nameY = mouseY + 30

    draw_SimpleText( nameText, nameFont, nameX + 1, nameY + 1, color1 )
    draw_SimpleText( nameText, nameFont, nameX + 2, nameY + 2, color2 )
    draw_SimpleText( nameText, nameFont, nameX, nameY, team_GetColor( visEnt:Team() ) )

    local statsY = nameY + nameH + 5
    local armor = visEnt:Armor()
    local statsText = visEnt:Health() .. "%"

    if armor >= 1 then
        statsText = statsText .. "  " .. armor .. "%"
    end

    surface_SetFont( statsFont )
    local statsW = surface_GetTextSize( statsText )
    local statsX = mouseX - statsW / 2

    draw_SimpleText( statsText, statsFont, statsX + 1, statsY + 1, color1 )
    draw_SimpleText( statsText, statsFont, statsX + 2, statsY + 2, color2 )
    draw_SimpleText( statsText, statsFont, statsX, statsY, team_GetColor( visEnt:Team() ) )
end )
