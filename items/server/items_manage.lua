function AddPlayerItem(player, target, item_id)
    if(CheckIfValidItem(item_id)) then
        AddPlayerChat(player, "valid items id")
    else
        AddPlayerChat(player, "invalid items id")
    end
end


function CheckIfValidItem(item_id)
    for _, item in ipairs(GetItemsList()) do
        if(item.id == item_id) then
            return true
        end
    end

    return false
end