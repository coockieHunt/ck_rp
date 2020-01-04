function OnPlayerDamage(playerid)
   local health = math.floor(GetPlayerHealth(playerid))
   local armor = math.floor(GetPlayerArmor(playerid))

   CallRemoteEvent(playerid, "updateHud_survival", health, armor)
end
AddEvent("OnPlayerDamage", OnPlayerDamage)