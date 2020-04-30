function OnPlayerDeath(player, instigator)
    OnplayerRespawn(player)
end
AddEvent("OnPlayerDeath", OnPlayerDeath)

AddEvent("OnPlayerChat", function(playerId, text)
	AddPlayerChatAll(_("on_player_chat", '"#43d815"', GetPlayerName(playerId), text))
end)