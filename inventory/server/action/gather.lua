function GatherDropedItem(playerId, droped_id)
    local po_id = GetPickupPropertyValue(droped_id, 'item_id')
    local po_quantity = GetPickupPropertyValue(droped_id, 'quantity')
    local po_text = GetPickupPropertyValue(droped_id, '3d_text')

    SetPlayerAnimation(playerId, _Gather_animation.animation_id)


    local addItem = AddPlayerItem(playerId, po_id, po_quantity)

    Delay(_Gather_animation.detach_time, function()
        if addItem[1] == false then
            local item_info = getItemInfo(po_id)
            local item_name = item_info.name
            local to_hight_quantity = addItem[2]

            local new_quantity = math.floor(math.abs(to_hight_quantity - po_quantity))
            SetPickupPropertyValue(droped_id, 'quantity', to_hight_quantity)
            SetText3DText(po_text, item_name .. ' - (' .. to_hight_quantity .. ')')
            if new_quantity ~= 0 then
                AddPlayerItem(playerId, po_id, new_quantity)
            end
        else
            RemoveDropedItem(droped_id)
        end
    end)
end
AddRemoteEvent("GatherDropedItem", GatherDropedItem)