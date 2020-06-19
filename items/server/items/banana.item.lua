local item = {
    name = "banana",
    var = "banana",
    description = "A banana is an elongated, edible fruit – botanically a berry[1][2] – produced by several kinds of large herbaceous flowering plants in the genus Musa.[3] In some countries, bananas used for cooking may be called 'plantains', distinguishing them from dessert bananas.",
    model = 1621,
    weight = 1,
    thumbnail= "banana.png",
    cooldown = false,
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
  AddPlayerChat(playerId, "use :" .. item.name)
end

function item:OnDrop(playerId, quantity)
  drop_item(playerId, item.var, quantity)
end

function item:OnPlayerDeath(playerId, instigator)
end

function item:OnPlayerSpawn(playerId)
end

AddItem(item)