function AdminLevel(playerid, level)
    local data = getplayer(playerid)
    
	if(tonumber(data.admin) < tonumber(level)) then
		LogPlayerChat(playerid, "error", "server", "admin privilege is not high enough | your level : ".. level)
		LogPlayerChatAll(playerid, "warning", "server", GetPlayerName(playerid).." tried an administrator command")
		return false
	else
		return true
	end
end