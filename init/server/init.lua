--init player
function OnPlayerJoin(player)
	local sp = GetPosByVar(_Init_player.location)
	SetPlayerSpawnLocation(player, sp['x'], sp['y'], sp['z'], sp['h'])
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerSpawn(player)
	local id = _Init_player.clothing_preset
	CallRemoteEvent(player, "spawn_init_clothing", id)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

function OnPlayerLoadComplete(player)
	Delay(5000, function()
		AutoAlertRun(player)
	end)
end

