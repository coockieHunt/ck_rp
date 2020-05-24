function ApplyUpgrade(car_id, upgrade_json)
    local upgrade = json_decode(upgrade_json)


    AttachVehicleNitro(car_id, IntToBool(upgrade.boost))
	EnableVehicleBackfire(car_id, IntToBool(upgrade.backfire))
end