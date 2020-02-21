
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
      inventory[key] = {
         value.id,
      }
   end
   
	CallRemoteEvent(player, "SetPersoInventoryList", inventory)
end)