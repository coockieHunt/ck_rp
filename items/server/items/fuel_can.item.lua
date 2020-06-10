local item = {
	name = "fuel can",
	var = "fuel_can",
	description = "items description",
	model = 507,
	weight = 1,
	thumbnail= "fuel_can.png",
    cooldown = {time_use = 10000, time_cooldown = 10000},
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
	local hit_type = GetHitTypeClient(playerId)
	if hit_type == false then return false end

	if hit_type.type == "HIT_VEHICLE" then 

		local vehicleId = hit_type.id
		local cur_fuel = GetFuel(vehicleId)
		SetFuel(vehicleId, cur_fuel + 20)
		RemovePlayerItem(playerId, item.var, 1)

		return true
	end

	return false
end

function item:OnDrop(playerId, quantity)
	drop_item(playerId, item.var, quantity)
end

function item:OnPlayerDeath(playerId, instigator)
end

function item:OnPlayerSpawn(playerId)
end

AddItem(item)