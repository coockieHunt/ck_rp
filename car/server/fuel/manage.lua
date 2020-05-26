function SetFuel(car_id, fuel)
    if IsValidVehicle(car_id) then
        SetVehiclePropertyValue(car_id, "fuel", fuel , true)
        return true
    end
    return false
end

function GetFuel(car_id)
    if IsValidVehicle(car_id) then
        return GetVehiclePropertyValue(car_id, "fuel")
    end
    return false
end