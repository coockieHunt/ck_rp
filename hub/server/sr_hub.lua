
function OnPlayerDamage(playerid)
   local health = math.floor(GetPlayerHealth(playerid))
   local armor = math.floor(GetPlayerArmor(playerid))

   CallRemoteEvent(playerid, "setDammage",health,  armor)
end
AddEvent("OnPlayerDamage", OnPlayerDamage)

function GetPlayerData(playerid)
   local p = getplayer(playerid)
   local health = math.floor(GetPlayerHealth(playerid))
   local armor = math.floor(GetPlayerArmor(playerid))
   CallRemoteEvent(playerid, "setPlayerData",p.cash , p.cash_account, health, armor)
   CallRemoteEvent(playerid, 'setDammage', health,  armor)
end
AddRemoteEvent("GetPlayerData", GetPlayerData)
