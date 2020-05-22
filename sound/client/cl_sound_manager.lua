local sound = {}

function NewSoun3dSync(var, files, x, y, z, distance_sound, renew)
    local newSound = CreateSound3D(files, x, y, z, distance_sound)
    sound[var] = {
        ['var'] = var,
        ['files'] = files,
        ['pos'] = {x , y, z},
        ['distance'] = distance_sound, 
        ['id'] = newSound,
        ['renew'] = renew
    }
end
AddRemoteEvent("NewSoun3dSync", NewSoun3dSync)

function DeleteSoun3dSync(var)
    DestroySound(sound[var].id)
    sound[var] = nil
end
AddRemoteEvent("DeleteSoun3dSync", DeleteSoun3dSync)

AddEvent("OnSoundFinished", function(sound_end)
    for id, data in pairs(sound) do
        if sound_end == data.id then
            if data.renew then
                local pos = data.pos
                NewSoun3dSync(data.var, data.files, pos[1], pos[2], pos[3], data.distance, data.renew)
            else
                DeleteSoun3dSync(data.var)
            end
        end
    end
end)