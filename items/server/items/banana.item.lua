local item = {
    name = "banana",
    var = "banana",
    description = "items description",
    model = 1621,
    weight = 1,
    thumbnail= "banana.png",
    color = "#ffdb4d"
}

--[=====[ 
  EVENT
--]=====]

function item:OnUse(playerId, quantity)
end

function item:OnDrop(playerId, quantity)
  drop_item(playerId, item.var, quantity)
end

function item:OnPlayerDeath(playerId, instigator)
  print('death')
end

AddItem(item)