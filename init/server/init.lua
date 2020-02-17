--init player
function OnPlayerJoin(player)
	local sp = _Init_player.location
	SetPlayerSpawnLocation(player, sp.x,sp.z,sp.y,sp.h)
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerSpawn(player)
	local id = _Init_player.clothing_preset
	CallRemoteEvent(player, "spawn_init_clothing", id)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)
