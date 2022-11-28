return function( utils )
    local originals = {}
    local netToRemove = {
        -- https://github.com/CapsAdmin/pac3/blob/c7b2401bf4acec3ce15988f9c9577f8e0c72d48a/lua/pac3/core/server/test_suite_backdoor.lua
        "pac3_test_suite_backdoor",
        "pac3_test_sutie_backdoor"
    }

    local function enable()
        for _, name in ipairs( netToRemove ) do
            local receiver = net.Receivers[name]

            if net.Receivers[name] then
                utils.log( "Removing net receiver for " .. name )

                originals[name] = originals[name] or receiver
                net.Receivers[name] = nil
            end
        end
    end

    local function disable()
        for name, receiver in pairs( originals ) do
            utils.log( "Restoring net receiver for " .. name )
            net.Receive( name, receiver )
        end
    end

    local setting = utils.makeConvar( "net_remover", enable, disable )

    hook.Add( "InitPostEntity", "GM_Scripts_NetRemover", function()
        if not setting:GetBool() then return end
        enable()
    end )
end
