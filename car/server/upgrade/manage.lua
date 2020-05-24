function SetUpgradeVehicleNitro(car_id, bool)
    local upgrade = json_decode(GetVehiclePropertyValue(car_id, "upgrade"))
    local boolNum = 0

    if bool then boolNum = 1 end 
    upgrade.boost = boolNum

    SetVehiclePropertyValue(car_id, "upgrade", json_encode(upgrade), true)
    ApplyUpgrade(car_id, json_encode(upgrade))
end

function SetUpgradeVehicleBackFire(car_id, bool)
    local upgrade = json_decode(GetVehiclePropertyValue(car_id, "upgrade"))
    local boolNum = 0

    if bool then boolNum = 1 end 
    upgrade.backfire = boolNum

    SetVehiclePropertyValue(car_id, "upgrade", json_encode(upgrade), true)
    ApplyUpgrade(car_id, json_encode(upgrade))
end