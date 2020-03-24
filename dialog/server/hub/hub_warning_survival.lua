function OnPlayerDamage(playerid)
    RefrechWarningSurvivalUi(playerid)
 end
 AddEvent("OnPlayerDamage", OnPlayerDamage)

function RefrechWarningSurvivalUi(playerid)
    local p = getplayer(playerid)
    CallRemoteEvent(playerid, 'setDammageWarning', p:getHealth(),  p:getArmor())
    CallRemoteEvent(playerid, 'setSurivalWarning', p:getFood(),  p:getThirst())
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

function CeateProgressBar(playerid, time, color)
   CallRemoteEvent(playerid, "CeateProgressBar", time, color)
end