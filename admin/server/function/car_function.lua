function admin_car_spawn(player, model, mount, boost , color, health)
	local vehicle
	local model = tonumber(model)

	if (model < 1 or model > 26) then return AddPlayerChat(player, "Vehicle model "..model.." does not exist.") end

	local x, y, z = GetPlayerLocation(player)
	local h = GetPlayerHeading(player)

	if (vehicle == false) then return AddPlayerChat(player, "Failed to spawn your vehicle") end
	if(mount)then
		vehicle = CreateVehicle(model, x, y, z, h)
		SetPlayerInVehicle(player, vehicle)
	else
		vehicle = CreateVehicle(model, x , y - 300, z, h - 90.0)
		print("Player location: "..x..", "..y..", "..z)
	end

	if(boost) then AttachVehicleNitro(vehicle, true) end
	
	if(color ~= nil) then
		color = "0x"..color
		SetVehicleColor(vehicle, color)
	else
		color = "default"
	end

	SetVehicleLicensePlate(vehicle, "ADMIN")
	SetVehicleHealth(vehicle, health)
	SetVehiclePropertyValue(vehicle, "ALive", true, true)
	
	
	AddAdminLog(player, "spawn car id : ".. model.." | color: ".. color .. " | boost : ".. strBool(boost))
end