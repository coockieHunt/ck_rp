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

function item:OnUse(playerId, quantity)
  print(playerId, quantity)
end

function item:OnDrop(playerId, quantity)
  drop_item(playerId, item.var, quantity)
end

function item:OnPlayerDeath(playerId, instigator)
end

function item:OnPlayerSpawn(playerId)
end

AddItem(item)