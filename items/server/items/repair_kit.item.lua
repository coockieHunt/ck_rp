local item = {
    name = "repair kit",
    var = "repair_kit",
    description = "items description",
    model = 551,
    weight = 1,
    thumbnail= "key.png",
    cooldown = {time_use = 5000, time_cooldown = 5000},
    color = "#ffdb4d"
}

--[=====[ 
  EVENT
--]=====]

function item:OnCreate(playerId, quantity)
end

function item:OnDestroy(playerId, quantity)
end

function item:OnUse(playerId, quantity)
  local hit_type = GetHitTypeClient(playerId)
	if hit_type == false then return false end

	if hit_type.type == "HIT_VEHICLE" then 
		return hit_type.id
	end

	return false
end

function item:OnUsed(playerId, quantity, args)
  local new = GetVehicleHealth(args) + 2000
  SetVehicleHealth(args, new)
end

function item:OnDrop(playerId, quantity)
  drop_item(playerId, item.var, quantity)
end

function item:OnPlayerDeath(playerId, instigator)
end

function item:OnPlayerSpawn(playerId)
end

AddItem(item)