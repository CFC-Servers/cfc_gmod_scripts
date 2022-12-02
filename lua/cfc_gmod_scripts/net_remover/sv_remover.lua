net.GMScripts_RemovedReceivers = net.GMScripts_RemovedReceivers or {}

local originals = net.GMScripts_RemovedReceivers
local netToRemove = {
    -- https://github.com/CapsAdmin/pac3/blob/c7b2401bf4acec3ce15988f9c9577f8e0c72d48a/lua/pac3/core/server/test_suite_backdoor.lua
    "pac3_test_suite_backdoor",
    "pac3_test_sutie_backdoor"
}

local function enable()
    for _, name in ipairs( netToRemove ) do
        local receiver = net.Receivers[name]

        if receiver then
            originals[name] = originals[name] or receiver
            net.Receivers[name] = nil
        end
    end
end

hook.Add( "InitPostEntity", "GM_Scripts_NetRemover", enable )
