
AddRemoteEvent("GetPersoInventory", function(player)
   local inventory = {}
   local data = getplayer(player) 

   local decode_inventory = GetInventory(player)

   for key, value in pairs(decode_inventory) do
      local id = value.id

      
      local object = GetItems(id)
      local type = GetItemTypeInfo(id)

      inventory[id] = {
         object.name,
         value.quantity,
         object.thumbnail,
         object.type,
         object.third,
         object.food,
         object.descrip,
         type.color
      }

   end

	CallRemoteEvent(player, "SetPersoInventoryList", inventory)
end)


AddRemoteEvent("GetInventoryMaxWeight", function(player)
   local MaxWeight = GetInventoryMaxWeight(player)
   local CurWeight = CalculateInvWeight(player)

   CallRemoteEvent(player, "SetMaxWeightLift", CurWeight, MaxWeight)
end)