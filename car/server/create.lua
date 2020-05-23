function setupVehicule(id_vehicule, locked, owner, upgrade, id)
    SetVehiclePropertyValue(id_vehicule, "ALive", true, true)
    SetVehiclePropertyValue(id_vehicule, "alarm", false, true)
    SetVehiclePropertyValue(id_vehicule, "owner", owner, true)
    SetVehiclePropertyValue(id_vehicule, "locked", locked, true)
    SetVehiclePropertyValue(id_vehicule, "db_id", id, true)
    SetVehiclePropertyValue(id_vehicule, "upgrade", upgrade, true)
end