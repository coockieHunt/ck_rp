function OnPlayerDamage(playerid)
    RefrechWarningSurvivalUi(playerid)
 end
 AddEvent("OnPlayerDamage", OnPlayerDamage)

function RefrechWarningSurvivalUi(playerid)
    local p = getplayer(playerid)
    CallRemoteEvent(playerid, 'setDammageWarning', p:getHealth(),  p:getArmor())
 end
 AddRemoteEvent("RefrechWarningSurvivalUi", RefrechWarningSurvivalUi)

 function ShowIconSaveClient(playerid)
    CallRemoteEvent(playerid, 'ShowIconSave')
 end

 function SendAlert(playerid, type, title, content)
   local data = getplayer(playerid)

   data:setAlertCount(data:getAlertCount() + 1)

   CallRemoteEvent(playerid, "SendAlert", data:getAlertCount(), type, title, content)
end