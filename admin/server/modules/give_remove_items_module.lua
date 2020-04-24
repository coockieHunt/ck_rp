local module = {
    name = "give remove",
    id = "give_remove_items",
    select = "inventory",
    level = 1
}

function module:GetName()
    return module.name
end

function module:GetSelect()
    return module.select
end

function module:GetId()
    return module.id
end

function module:GetLevel()
    return module.level
end

-- func
function module:OnBuild()
    AddForm('player', "target", "target", {})
    AddForm('items', "items", "item_id", {})

    AddForm('text', 'quantity', 'quantity', {})
    AddForm('select', 'action', 'action', {
        options = {
            give = "give",
            remove = "remove",
        }
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local target = data['target']
    local quantity = data['quantity']
    local items_id = data['item_id']
    local action = data['action']

    if action == "give" then
        admin_addItem(playerId, target, items_id, quantity)
    else
        admin_removeItem(playerId, target, items_id, quantity)
    end

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
