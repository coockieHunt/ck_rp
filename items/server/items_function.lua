function GetItems(item_id)
    if(CheckIfValidItem(item_id)) then
        for _, item in ipairs(GetItemsList()) do
            if(item.id == item_id) then
                return item
            end
        end
    end

    return false
end

function CheckIfValidItem(item_id)
    for _, item in ipairs(GetItemsList()) do
        if(item.id == item_id) then
            return true
        end
    end

    return false
end