function car_lock_unclock_sound(vehicle_id, distance_sound)
    local x, y, z = GetVehicleLocation(vehicle_id)
    CreateSound3D('files_client/sound/car_lock.mp3', x, y, z, distance_sound)
end
AddRemoteEvent('car_lock_unclock_sound', car_lock_unclock_sound)
