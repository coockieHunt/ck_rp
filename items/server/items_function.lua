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

function GetItemNameByModelId(model_id) 
    for _, item in ipairs(GetItemsList()) do
        if(item.model == tonumber(model_id)) then
            return item.name
        end
    end

    return false
end

function GetItemWeightById(item_id) 
    if(CheckIfValidItem(item_id)) then
        for _, item in ipairs(GetItemsList()) do
            if(item.id == item_id) then
                return item.weight
            end
        end

        return cur_weight
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

function GetItemHandPos(item_id)
    if(CheckIfValidItem(item_id)) then
        local item = GetItems(item_id)

        local hand_pos = item.hand_pos

        if(isnil(hand_pos)) then
            return _Default_item.hand_pos
        else
            return hand_pos
        end
    end
end