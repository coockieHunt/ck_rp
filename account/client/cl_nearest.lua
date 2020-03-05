function GetNearestPickUp(MaxDist)
    local x, y, z = GetPlayerLocation()

    for _,v in pairs(GetStreamedPickups()) do
        local px, py, pz = GetPickupLocation(v)
        local GetDistance3D = GetDistance3D(x, y, z, px, py, pz)
        
        if GetDistance3D < MaxDist then
            local type = GetPickupPropertyValue(v, "type")

            local pickup = {
                ["type"] = type,
                ["id"] = v
            }

            return pickup
        end

    end
    return false

end
