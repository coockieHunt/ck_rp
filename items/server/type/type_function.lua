function GetItemTypeInfo(item_id)
    if(CheckIfValidItem(item_id)) then
        for _, item in ipairs(GetItemsList()) do
            if(item.id == item_id) then
                local type = _Item_type[item.type]

                if(isnil(type)) then
                    type = _Item_type["default"]
                end
                
                return type
            end
        end
    end

    return false
end