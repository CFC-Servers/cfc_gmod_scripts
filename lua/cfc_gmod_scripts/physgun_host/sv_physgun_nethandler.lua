-- Makes the physgun net detour properly log errors, original uses xpcall + print.
if not PhysgunPostCallNetIncomming then return end

local ent = Entity
function PhysgunPostCallNetIncomming( len, entIndex )
    ProtectedCall( function()
        net.Incoming( len, ent( entIndex ) )
    end )
end
