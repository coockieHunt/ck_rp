function RefrechPlayerData(playerid)
   local p = getplayer(playerid)
   CallRemoteEvent(playerid, "setPlayerData",p:getCash() , p:getCashAccount(), p:getHealth(), p:getArmor())
   CallRemoteEvent(playerid, 'setDammage', p:getHealth(),  p:getArmor())
end

function RefrechSurvivalData(playerid)
   local p = getplayer(playerid)
   CallRemoteEvent(playerid, "setPlayerSurvival",p:getFood() , p:getThirst())
end

AddRemoteEvent("GetPersoInventory", function(player)
   local inventory = {}
   local data = getplayer(player) 

   local decode_inventory = GetInventory(player)

   for key, value in pairs(decode_inventory) do
      local id = value.id
      
      local object = GetItems(id)

      inventory[id] = {
         object.name,
         value.quantity,
         object.thumbnail,
         object.type,
         object.third,
         object.food,
         object.descrip,
      }

   end

	CallRemoteEvent(player, "SetPersoInventoryList", inventory)
end)

AddRemoteEvent("GetItemInfo", function(player, item_id)
   local InfoTable = { }

   local item = GetItems(item_id)

   InfoTable = {
         ['name'] = item.name,
         ['third'] = item.third,
         ['food'] = item.food,
         ['descrip'] = item.descrip
   }

   CallRemoteEvent(player, "SetItemInfo", InfoTable)
end)

AddRemoteEvent("GetInventoryMaxWeight", function(player)
   local MaxWeight = GetInventoryMaxWeight(player)
   local CurWeight = CalculateInvWeight(player)

   CallRemoteEvent(player, "SetMaxWeightLift", CurWeight, MaxWeight)
end)