local item = {
    name = "energy drinks",
    var = "energy_drinks",
    description = "items description",
    model = 1296,
    weight = 1,
    thumbnail= "energi_drink.png",
    cooldown = {time_use = 100, time_cooldown = 100},
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
  return true
end

function item:OnDrop(playerId, quantity)
  drop_item(playerId, item.var, quantity)
end

function item:OnPlayerDeath(playerId, instigator)
end

function item:OnPlayerSpawn(playerId)
end

AddItem(item)