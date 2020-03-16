function GetItemTypeInfo(item_id)
    if(CheckIfValidItem(item_id)) then
        for _, item in ipairs(GetItemsList()) do
            if(item.id == item_id) then
                return _Item_type[item.type]
            end
        end
    end

    return false
end