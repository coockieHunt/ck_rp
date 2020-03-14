function admin_addItem(player, target, item_id, quantity)
	local level = 1

	if(AdminLevel(player, level)) then
		local add = AddPlayerItem(player, target, item_id, quantity)

		if(add == true) then
			AddAdminLog(player, "add item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
			SendAlert(target, "warning", "Admin", "An administrator give you " .. quantity .. " " .. item_id)
		else
			SendAlert(player, "error", "Admin", 
			GetPlayerName(target).." has full inventory, there are " .. add.. " too many")
		end
	end
end

function admin_removeItem(player, target, item_id, quantity)
	local level = 1

	if(AdminLevel(player, level)) then
		local del = RemovePlayerItem(player, target, item_id, quantity)
		
		if(del) then
			AddAdminLog(player, "remove item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
			SendAlert(target, "error", "Admin", "An administrator remove you " .. quantity .. " " .. item_id)
		else
			SendAlert(player, "error", "Admin", "Player ".. GetPlayerName (player) .." does not have enough item ".. item_id .." in his inventory")
		end
	end
end