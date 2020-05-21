function GetNearestVehicles(playerId, MaxDist)
    local x, y, z = GetPlayerLocation(playerId)
    local car = {}
    local rslt = false


    for _,v in pairs(GetStreamedVehiclesForPlayer(playerId)) do
        local px, py, pz = GetVehicleLocation(v)
        local GetDistance3D = GetDistance3D(x, y, z, px, py, pz)
        
        if GetDistance3D < MaxDist then
            rslt = true
            car[v] = GetDistance3D
        end
    end

    if rslt then return car end

    return false
end
