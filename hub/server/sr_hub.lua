function OnPlayerDamage(playerid)
   CallRemoteEvent(playerid, "updateHud_survival")
end
AddEvent("OnPlayerDamage", OnPlayerDamage)