hook.Add( "InitPostEntity", "RemoveLFSAdvert", function()
    if simfphys and simfphys.LFS and simfphys.LFS.CheckUpdates then
        simfphys.LFS.CheckUpdates = function() end
    end
end )
