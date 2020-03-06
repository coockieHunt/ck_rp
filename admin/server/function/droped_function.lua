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
      local po_posX, po_posY, po_posZ = GetPickupLocation(droped_id)
      admin_tp_to_pos(player, po_posX, po_posY, po_posZ)
	  end 
end