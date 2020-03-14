function admin_addItem(player, target, item_id, quantity)
	local level = 1

	if(AdminLevel(player, level)) then
		local add = AddPlayerItem(player, target, item_id, quantity)

		if(add == true) then
			AddAdminLog(player, "add item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
			SendAlert(target, "warning", "Admin", "An administrator give you <strong>" .. quantity .. " " .. item_id.."</strong>")
		else
			SendAlert(player, "error", "Admin", 
			GetPlayerName(target).." has full inventory, there are <strong>" .. add.. "</strong> too many")
		end
	end
end

function admin_removeItem(player, target, item_id, quantity)
	local level = 1

	if(AdminLevel(player, level)) then
		local del = RemovePlayerItem(player, target, item_id, quantity)
		
		if(del) then
			AddAdminLog(player, "remove item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
			SendAlert(target, "error", "Admin", "An administrator remove you <strong>" .. quantity .. " " .. item_id.."</strong>")
		else
			SendAlert(player, "error", "Admin", "Player <strong>".. GetPlayerName (player) .."</strong> does not have enough item <strong>".. item_id .."</strong> in his inventory")
		end
	end
end