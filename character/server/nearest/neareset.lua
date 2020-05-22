function GetNearestVehicles(playerId, MaxDist)
    local car = {}
    local rslt = false

    for _,v in pairs(GetStreamedVehiclesForPlayer(playerId)) do
        local x, y, z = GetPlayerLocation(playerId)
        local px, py, pz = GetVehicleLocation(v)

        local GetDistance3D = GetDistance3D(x, y, z, px, py, pz)
        
        if GetDistance3D < MaxDist then
            rslt = true
            table.insert(car, {['dist'] = GetDistance3D, ['id'] = v}) 
        end
    end

    if rslt then return car end

    return false
end
