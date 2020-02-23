
function OnPlayerDamage(playerid)
   RefrechSurvivalUi(playerid)
end
AddEvent("OnPlayerDamage", OnPlayerDamage)

function GetPlayerData(playerid)
   RefrechSurvivalUi(playerid)
end
AddRemoteEvent("GetPlayerData", GetPlayerData)

function RefrechSurvivalUi(playerid)
   local p = getplayer(playerid)
   CallRemoteEvent(playerid, "setPlayerData",p:getCash() , p:getCashAccount(), p:getHealth(), p:getArmor())
   CallRemoteEvent(playerid, 'setDammage', p:getHealth(),  p:getArmor())
end

AddRemoteEvent("GetPersoInventory", function(player)
   local inventory = {}
   local data = getplayer(player) 

   for key, value in pairs(data.inventory) do
      local id = value.id
      local quantity = value.quantity
      
      local object = GetItems(id)
      
      local name = object.name
      local thumb = object.thumbnail
      local type = object.type

      inventory[key] = {
         name,
         quantity,
         thumb,
         type
      }
   end
   
	CallRemoteEvent(player, "SetPersoInventoryList", inventory)
end)