function GetItems(item_id)
    for _, item in ipairs(GetItemsList()) do
        if(item.id == item_id) then
            return item
        end
    end

    return false
end