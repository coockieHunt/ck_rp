--init player
function OnPlayerJoin(player)
	SetPlayerSpawnLocation(player, init_player.location.x , init_player.location.z, init_player.location.y, init_player.location.h)
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerSpawn(player)
	CallRemoteEvent(player, "spawn_init_clothing")
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)
