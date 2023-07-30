local maxScale = 1000000
local math_min = math.min

local entMeta = FindMetaTable( "Entity" )
entMeta._GMS_Fire = entMeta._GMS_Fire or entMeta.Fire

function entMeta:Fire( input, param, delay, activator, caller )
    if self:GetClass() == "phys_torque" and input == "Scale" then
        param = math_min( maxScale, param )
    end

    return self:_GMS_Fire( input, param, delay, activator, caller )
end
