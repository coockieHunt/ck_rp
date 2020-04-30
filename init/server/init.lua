--init player
function OnPlayerJoin(player)
	local sp = GetPosByVar(_Init_player.location)
	SetPlayerSpawnLocation(player, sp['x'], sp['y'], sp['z'], sp['h'])
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerLoadComplete(player)
	local delay = 5000

	Delay(delay, function()
		AutoAlertRun(player)
		AddPlayerChat(player, _("text_to_send"))
	end)
end

