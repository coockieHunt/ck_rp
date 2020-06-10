function getItemInfo(var)
    if not isnil(_itemsList[var]) then
        return _itemsList[var]
    end

    return false
end

function UseItem(playerId, item_var, quantity)
    local use = CallPlayerUse(playerId, item_id)

    return use
end
