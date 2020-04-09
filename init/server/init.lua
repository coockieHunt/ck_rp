--init player
function OnPlayerJoin(player)
	local sp = GetPosByVar(_Init_player.location)
	SetPlayerSpawnLocation(player, sp['x'], sp['y'], sp['z'], sp['h'])
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerSpawn(player)
	local id = _Init_player.clothing_preset
	CallRemoteEvent(player, "spawn_init_clothing", id)
	Delay(9000, function()
		SendAlert(player, "info", "Key", "press <strong>" .. _Key_ui.info:upper() .. "</strong> key to know the keys")
	end)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

