function GetNearestPickUp(MaxDist)
    local x, y, z = GetPlayerLocation()
    local pickup = false

    for _,v in pairs(GetStreamedPickups()) do
        local px, py, pz = GetPickupLocation(v)
        local GetDistance3D = GetDistance3D(x, y, z, px, py, pz)
        
        if GetDistance3D < MaxDist then
            local type = GetPickupPropertyValue(v, "type")

            return { ["type"] = type, ["id"] = v}
        end
    end

    return false
end

function GetNearestVehicles(MaxDist)
    local x, y, z = GetPlayerLocation()
    local car = {}
    local rslt = false

    for _,v in pairs(GetStreamedVehicles()) do
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
