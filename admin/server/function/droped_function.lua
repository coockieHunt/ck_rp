function admin_delete_droped_Item(player, droped_id)
	local level = 1

    if(AdminLevel(player, level)) then
		AddAdminLog(player, "Droped item id : " .. droped_id.. " has been deleted")
        RemoveDropedItem(droped_id)
	end
end

function admin_teleport_droped_Item(player, droped_id)
	local level = 1

    if(AdminLevel(player, level)) then
		AddAdminLog(player, "Teleported item id : " .. droped_id)
        local object = GetDropedItemById(tonumber(droped_id))
        local object_pos = object['pos']
        admin_tp_to_pos(player, object_pos[1], object_pos[2], object_pos[3])
	end 
end