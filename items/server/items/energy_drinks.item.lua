local item = {
    name = "energy drinks",
    var = "energy_drinks",
    description = "An energy drink is a type of drink containing stimulant compounds, usually caffeine, which is marketed as providing mental and physical stimulation (marketed as 'energy', but distinct from food energy). ",
    model = 1296,
    weight = 1,
    thumbnail= "energi_drink.png",
    cooldown = {time_use = 500, time_cooldown = 500},
    color = "#3217C8"
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