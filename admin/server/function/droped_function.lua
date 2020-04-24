function admin_delete_droped_Item(player, droped_id)
  AddAdminLog(player, "Droped item id : " .. droped_id.. " has been deleted")
  RemoveDropedItem(droped_id)
end

function admin_teleport_droped_Item(player, droped_id)
  AddAdminLog(player, "Teleported item id : " .. droped_id)
  local po_posX, po_posY, po_posZ = GetPickupLocation(droped_id)

  print( po_posX, po_posY, po_posZ)

  admin_tp_to_pos(player, po_posX, po_posY, po_posZ)
end