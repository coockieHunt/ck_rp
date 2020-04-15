function cmd_saveAccount(playerid)
	SaveAccountPlayer(playerid)
end

function cmd_time(playerid)
	AddPlayerChat(playerid, getCurrentDayTime())
end

function cmd_help(playerid)
	AddPlayerChat(playerid, "- /save (save your account)")
	AddPlayerChat(playerid, "- /time (get current time)")
end

AddCommand("help", cmd_help)
AddCommand("time", cmd_time)
AddCommand("save", cmd_saveAccount)

