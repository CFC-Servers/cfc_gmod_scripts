local enabled = GmodScripts.MakeToggle( "player_pickup_fix", "Fix player_pickup exploit" )

local function validatePlayerPickup( e )
    if not e:IsValid() then return end

    -- If it's holding an invalid Entity, it shouldn't exist
    local movePeer = e:GetInternalVariable( "m_hMovePeer" )
    if not IsValid( movePeer ) then return end

    -- player_pickups shouldn't hold other player_pickups
    if movePeer:GetClass() == "player_pickup" then
        e:Remove()
        return
    end

    -- Owner-less player_pickups are invalid
    local owner = e:GetOwner()
    if not owner and owner:IsValid() then
        e:Remove()
        return
    end
end

hook.Add( "OnEntityCreated", "test", function( e )
    if not enabled:GetBool() then return end

    if e:GetClass() ~= "player_pickup" then return end
    timer.Simple( 0, function() validatePlayerPickup( e ) end )
end )
