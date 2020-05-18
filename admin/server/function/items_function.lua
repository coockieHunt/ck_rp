function admin_addItem(player, target, item_id, quantity)
	local add = AddPlayerItem(target, item_id, quantity)

	if add then
		AddAdminLog(player, "add item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
		SendAlert(target, "warning", "Admin", "An administrator give you <strong>" .. quantity .. " " .. item_id.."</strong>")
	else
		SendAlert(player, "error", "Admin", 
		GetPlayerName(target).." error admin invetory")
	end
end

function admin_removeItem(player, target, item_id, quantity)
	local del = RemovePlayerItem(target, item_id, quantity)
	
	if del then
		AddAdminLog(player, "remove item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
		SendAlert(target, "warning", "Admin", "An administrator remove you <strong>" .. quantity .. " " .. item_id.."</strong>")
	else
		SendAlert(player, "error", "Admin", " error admin invetory")
	end
end