function setupVehicule(id_vehicule, locked, owner)
    SetVehiclePropertyValue(id_vehicule, "ALive", true, true)
    SetVehiclePropertyValue(id_vehicule, "alarm", false, true)
    SetVehiclePropertyValue(id_vehicule, "owner", owner, true)
    SetVehiclePropertyValue(id_vehicule, "locked", locked, true)
end