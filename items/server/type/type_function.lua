function GetItemTypeInfo(item_id)
    if(CheckIfValidItem(item_id)) then
        for _, item in ipairs(GetItemsList()) do
            if(item.id == item_id) then
                local type = _Item_type[item.type]

                if(isnil(type)) then
                    type = _Default_item.type
                end
                
                return type
            end
        end
    end

    return false
end

function GetConsumeTime(item_id)
    if(CheckIfValidItem(item_id)) then
        local info = GetItemTypeInfo(item_id)
        local time = info.consume_time
        if isnil(info.consume_time) then
            return false
        end

        return time
    end
end