function store_car(playerId, id)
    if IsValidVehicle(id) then
        local query = mariadb_prepare(db, _RequestSql.StoreCar, 
            GetVehiclePropertyValue(id, 'owner'), 
            GetVehicleHealth(id), 
            GetVehicleLicensePlate(id), 
            tohex(GetVehicleColor(id)), 
            GetVehiclePropertyValue(id, 'db_id')
        )
    
        mariadb_async_query(db, query)

        DestroyVehicle(id)
    end
end
AddCommand("store", store_car)
