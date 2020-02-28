function drop_item(player, item_id) 
    CreateDropItem(player, item_id)
    RemovePlayerItem(player, player, item_id, 1)
end
AddRemoteEvent("drop_item", drop_item)