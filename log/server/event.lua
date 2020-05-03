function OnPlayerJoin(player)
	AddPlayerChat(player, "")
	AddLoginLog(player)
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerChatCommand(player, cmd, exists)
	LogCommandeChat(player, cmd, exists)
end
AddEvent("OnPlayerChatCommand", OnPlayerChatCommand)