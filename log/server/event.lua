function OnPlayerJoin(player)
	AddPlayerChat(player, "") -- clear chat
	AddLoginLog(player)
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerChatCommand(player, cmd, exists)
	LogCommandeChat(player, cmd, exists)
end
AddEvent("OnPlayerChatCommand", OnPlayerChatCommand)