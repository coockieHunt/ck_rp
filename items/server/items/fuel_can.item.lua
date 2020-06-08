local item = {
	name = "fuel can",
	var = "fuel_can",
	description = "items description",
	model = 507,
	weight = 1,
	thumbnail= "fuel_can.png",
	color = "#ffdb4d"
}

--[=====[ 
	EVENT
--]=====]

function item:OnCreate(playerId, quantity)
end

function item:OnDestroy(playerId, quantity)
end

function item:OnUse(playerId, quantity, args)
	local car_nearest = GetNearestVehicles(
		playerId, 
		_Car.interact.distance
	)

	if car_nearest ~= false then
		local closet_vehicle = GetClosetVehicle(car_nearest)
		local cur_fuel = GetFuel(closet_vehicle)
		SetFuel(closet_vehicle, cur_fuel + 20)
		RemovePlayerItem(playerId, item.var, 1)
	end
end

function item:OnDrop(playerId, quantity)
	drop_item(playerId, item.var, quantity)
end

function item:OnPlayerDeath(playerId, instigator)
end

function item:OnPlayerSpawn(playerId)
end

AddItem(item)