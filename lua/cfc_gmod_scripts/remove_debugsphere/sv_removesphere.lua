return function( utils )
    local logSetting = utils.makeConvar( "debugsphere_reminder" )
    local reminderText = "Reminder, debugoverlay.Sphere is disabled to prevent crashes on 64bit"
    local reminderHint = "('cfc_gmod_scripts_debugsphere_reminder 0' to disable this message)"
    local reminder = reminderText .. " " .. reminderHint

    local function enable()
        local callCount = 0
        debugoverlay._GMScripts_Sphere = debugoverlay._GMScripts_Sphere or debugoverlay.Sphere
        utils.log( "Disabling debugoverlay.Sphere to prevent crashes on 64bit" )

        debugoverlay.Sphere = function()
            if callCount >= 100 then callCount = 0 end

            -- On the first call and every 100th call after that
            if callCount == 0 and logSetting:GetBool() then
                utils.log( reminder )
            end

            callCount = callCount + 1
        end
    end

    local function disable()
        debugoverlay.Sphere = debugoverlay._GMScripts_Sphere
    end

    local setting = utils.makeConvar( "debugsphere", enable, disable )
    if BRANCH == "x86-64" and setting:GetBool() then enable() end
end
