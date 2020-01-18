function cmd_commands(playerid)
    local data = getplayer(playerid)

   	AddPlayerChat(playerid, ("%s's statistics:"):format(data.name))
	AddPlayerChat(playerid, ("		- id : %s"):format(data.id))
	AddPlayerChat(playerid, ("		- admin : %s"):format(data.admin))
	AddPlayerChat(playerid, ("		- steam_id : %s"):format(data.steamId))
	AddPlayerChat(playerid, ("		- health : %s"):format(data.health))
	AddPlayerChat(playerid, ("		- armor : %s"):format(data.armor))
	AddPlayerChat(playerid, ("		- cash : %s"):format(data.cash))
	AddPlayerChat(playerid, ("		- cash_account : %s"):format(data.cash_account))
end
AddCommand("getstat", cmd_commands)
AddCommand("gst", cmd_commands)

function cmd_saveAccount(playerid)
	SaveAccountPlayer(playerid)
    AddPlayerChat(playerid, "[server] your data has been save")
end
AddCommand("save", cmd_saveAccount)

