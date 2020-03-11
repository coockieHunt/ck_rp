function cmd_commands(playerid)
    local data = getplayer(playerid)

   	AddPlayerChat(playerid, ("%s's statistics:"):format(data.name))
	AddPlayerChat(playerid, ("		- id : %s"):format(data.id))
	AddPlayerChat(playerid, ("		- client_id : %s"):format(data.id_client))
	AddPlayerChat(playerid, ("		- admin : %s"):format(data.admin))
	AddPlayerChat(playerid, ("		- steam_id : %s"):format(data.steamId))
	AddPlayerChat(playerid, ("		- health : %s"):format(data:getHealth()))
	AddPlayerChat(playerid, ("		- armor : %s"):format(data:getArmor()))
	AddPlayerChat(playerid, ("		- cash : %s"):format(data:getCash()))
	AddPlayerChat(playerid, ("		- cash_account : %s"):format(data:getCashAccount()))
	AddPlayerChat(playerid, ("		- inventory : %s"):format(data.inventory))
	AddPlayerChat(playerid, ("		- max weight : %s"):format(data.MaxWeight))
	AddPlayerChat(playerid, ("		- cur weight : %s"):format(data.CurWeight))
end
AddCommand("gst", cmd_commands)


function cmd_inv(playerid)
	local data = getplayer(playerid)
	AddPlayerChat(playerid, ("%s's inventory:"):format(data.name))

	local inventory = GetInventory(playerid)

	for key, value in pairs(inventory) do
		AddPlayerChat(playerid, "- " .. value.id .. " : " .. value.quantity)
    end
	
end
AddCommand("inv", cmd_inv)

function cmd_saveAccount(playerid)
	SaveAccountPlayer(playerid)
end
AddCommand("save", cmd_saveAccount)

