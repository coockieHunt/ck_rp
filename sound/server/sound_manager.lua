function NewSoun3d(var, files, x, y, z, distance)
    local count_player = tablelength(GetAllPlayers())
    if count_player > 0 then
        for _, player in pairs(GetAllPlayers()) do
            CallRemoteEvent(player,"NewSoun3dSync", var, files, x, y, z, distance)
        end
    end
end

function DeleteSoun3d(files, x, y, z, distance)
    local count_player = tablelength(GetAllPlayers())
    if count_player > 0 then
        for _, player in pairs(GetAllPlayers()) do
            CallRemoteEvent(player,"DeleteSoun3dSync", var)
        end
    end
end

