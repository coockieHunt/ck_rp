local sound = {}

function NewSoun3d(var, files, x, y, z, distance, renew)
    local count_player = tablelength(GetAllPlayers())
    if count_player > 0 then
        for _, player in pairs(GetAllPlayers()) do
            sound[var] = {var, files, x, y, z, distance, renew}
            CallRemoteEvent(player,"NewSoun3dSync", var, files, x, y, z, distance, renew)
        end
    end
end

function DeleteSoun3d(var)
    local count_player = tablelength(GetAllPlayers())
    if count_player > 0 then
        for _, player in pairs(GetAllPlayers()) do
            sound[var] = nil
            CallRemoteEvent(player,"DeleteSoun3dSync", var)
        end
    end
end

function OnPlayerSpawn(playerid)
    for id, data in pairs(sound) do
        NewSoun3d(data[1], data[2], data[3], data[4], data[5], data[6], data[7])
    end
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

