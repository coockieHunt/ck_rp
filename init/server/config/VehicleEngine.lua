
AddEvent("OnPlayerEnterVehicle", function(player, vehicle, seat)
	if seat == 1 then
		StartVehicleEngine(vehicle)
	end
end)

AddEvent("OnPlayerLeaveVehicle", function(player, vehicle, seat)
	if seat == 1 then
		StopVehicleEngine(vehicle)
	end
end)
