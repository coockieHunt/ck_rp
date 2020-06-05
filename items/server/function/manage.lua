function getItemInfo(var)
    if not isnil(_itemsList[var]) then
        return _itemsList[var]
    end

    return false
end

function UseItem(playerId, item_var, quantity)
    local item = getItemInfo(item_var)

    item:OnUse(playerId, item_var, quantity)
end
