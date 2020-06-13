--init player
function OnPlayerJoin(playerId)
	local sp = GetPosByVar(_Spawn_location)
	SetPlayerSpawnLocation(playerId, sp['x'], sp['y'], sp['z'], sp['h'])
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerLoadComplete(playerId)
	local notify_alert = _("on_connect_chat_all",'"#43d815"', GetPlayerName(playerId))
	AddPlayerChatAll(notify_alert)
	AutoAlertRun(playerId)
	CallOnPlayerSpawnItem(playerId)
end

