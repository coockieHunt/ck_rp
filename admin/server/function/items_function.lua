function admin_addItem(player, target, item_id, quantity)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, "add item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
		AddPlayerItem(player, target, item_id, quantity)
	end
end

function admin_removeItem(player, target, item_id, quantity)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, "remove item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
        RemovePlayerItem(player, target, item_id, quantity)
	end
end