local sond_register = {}

AddEvent("OnObjectStreamIn", function(object)
    local type = GetObjectPropertyValue(object, "type")
    
    if type == "SoundStream" then
        
        local SoundStream_var = GetObjectPropertyValue(object, "var")
        
        local ObjectActor = GetObjectActor(object)
        
        ObjectActor:SetActorScale3D(FVector(0.0, 0.0, 0.0))
		ObjectActor:SetActorEnableCollision(false)
		ObjectActor:SetActorHiddenInGame(true)

        if sond_register[object] == nil then
            Create3dSound(object)
        end
    end
end)

function Create3dSound(object)
    local x,y,z = GetObjectLocation(object)
    local SoundStream_file = GetObjectPropertyValue(object, "file")
    local SoundStream_radius = GetObjectPropertyValue(object, "radius")
    local SoundStream_volume = GetObjectPropertyValue(object, "volume")
    local SoundStream_loop = GetObjectPropertyValue(object, "loop")

    local new_SoundStream = CreateSound3D(SoundStream_file, x, y, z, SoundStream_radius)
    SetSoundVolume(new_SoundStream, SoundStream_volume)
    
    sond_register[object] = {object = object, loop = SoundStream_loop, var = var, sound = new_SoundStream}
end

function DestroySound3d(object)
    DestroySound(sond_register[object].sound)
    sond_register[object] = nil
end
AddRemoteEvent("DestroySound3d", DestroySound3d)


AddEvent("OnSoundFinished", function(sound)
	for k,v in pairs(sond_register) do
        local sound_var = v.sound

        if sound == sound_var then
            CallRemoteEvent("SoundClientFinished", k)
            DestroySound3d(k)
        end
    end 
end)