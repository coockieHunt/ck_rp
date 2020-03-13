function admin_addItem(player, target, item_id, quantity)
	local level = 1

	if(AdminLevel(player, level)) then
		local add = AddPlayerItem(player, target, item_id, quantity)

		if(add == true) then
			AddAdminLog(player, "add item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
			SendAlert(target, "warning", "Admin", "An administrator give you " .. quantity .. " " .. item_id)
		else
			AddAdminLog(player, "Add item id: " .. item_id.. " to failed players : "..GetPlayerName(target)..", extra item count: " .. add)
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
			AddAdminLog(player, "remove FAILED inventory to low item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
		end
	end
end