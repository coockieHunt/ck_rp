local sound = {}

function NewSoun3dSync(var, files, x, y, z, distance_sound)
    local newSound = CreateSound3D(files, x, y, z, distance_sound)
    sound[var] = newSound
end
AddRemoteEvent("NewSoun3dSync", NewSoun3dSync)

function DeleteSoun3dSync(var)
    DestroySound(sound[var])
end
AddRemoteEvent("DeleteSoun3dSync", DeleteSoun3dSync)

AddEvent("OnSoundFinished", function(sound_end)
    if sounde == sound['car_alarm'] then
        
    end
end)