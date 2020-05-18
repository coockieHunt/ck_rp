local item = {
    name = "energy drinks",
    var = "energy_drinks",
    description = "items description",
    model = 1296,
    weight = 1,
    thumbnail= "energi_drink.png",
    color = "#ffdb4d"
}

--[=====[ 
  EVENT
--]=====]

function item:OnUse(playerId, quantity)
  print('use ' .. item.var)
end

function item:OnDrop(playerId, quantity)
  drop_item(playerId, item.var, quantity)
end

function item:OnPlayerDeath(playerId, instigator)
end

AddItem(item)