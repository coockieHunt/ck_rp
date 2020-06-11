local item = {
    name = "repair kit",
    var = "repair_kit",
    description = "items description",
    model = 551,
    weight = 1,
    thumbnail= "key.png",
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

function item:OnUsed(playerId, quantity, args)
end

function item:OnDrop(playerId, quantity)
  drop_item(playerId, item.var, quantity)
end

function item:OnPlayerDeath(playerId, instigator)
end

function item:OnPlayerSpawn(playerId)
end

AddItem(item)