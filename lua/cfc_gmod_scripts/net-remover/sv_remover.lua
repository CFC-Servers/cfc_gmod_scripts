local netToRemove = {
    -- https://github.com/CapsAdmin/pac3/blob/c7b2401bf4acec3ce15988f9c9577f8e0c72d48a/lua/pac3/core/server/test_suite_backdoor.lua
    "pac3_test_suite_backdoor",
    "pac3_test_sutie_backdoor"
}

for _, name in ipairs( netToRemove ) do
    if net.Receivers[name] then
        print( "[CFC Gmod Scripts] Removing net receiver for " .. name )
        net.Receivers[name] = nil
    end
end
