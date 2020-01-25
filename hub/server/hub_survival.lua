
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
