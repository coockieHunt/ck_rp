--init player
function OnPlayerJoin(player)
	local sp = Config_init:case("location")
	SetPlayerSpawnLocation(player, sp.x,sp.z,sp.y,sp.h)
	AddLoginLog(player)
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerSpawn(player)
	local id = Config_init:case("clothing_preset")
	CallRemoteEvent(player, "spawn_init_clothing", id)
	AddPlayerChat(player, "") -- clear chat
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)
