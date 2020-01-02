function cmd_commands(playerid)
    local data = getplayer(playerid)

   	AddPlayerChat(playerid, ("%s's statistics:"):format(data.name))
	AddPlayerChat(playerid, ("		- id : %s"):format(data.id))
	AddPlayerChat(playerid, ("		- admin : %s"):format(data.admin))
	AddPlayerChat(playerid, ("		- steam_id : %s"):format(data.steamId))
	AddPlayerChat(playerid, ("		- health : %s"):format(data.health))
	AddPlayerChat(playerid, ("		- armor : %s"):format(data.armor))
	AddPlayerChat(playerid, ("		- cash : %s"):format(data.cash))
end
AddCommand("getstat", cmd_commands)
AddCommand("gst", cmd_commands)

