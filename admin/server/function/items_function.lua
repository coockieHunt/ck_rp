function admin_addItem(player, target, item_id, quantity)
	local level = 1

	if(AdminLevel(player, level)) then
		local add = AddPlayerItem(player, target, item_id, quantity)

		if(add) then
			AddAdminLog(player, "add item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
		else
			AddAdminLog(player, "add FAILED inventory to hight item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
		end
	end
end

function admin_removeItem(player, target, item_id, quantity)
	local level = 1

	if(AdminLevel(player, level)) then
		local del = RemovePlayerItem(player, target, item_id, quantity)
		
		if(del) then
			AddAdminLog(player, "remove item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
		else
			AddAdminLog(player, "remove FAILED inventory to low item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
		end
	end
end