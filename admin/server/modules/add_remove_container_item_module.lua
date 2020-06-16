local module = {
    name = "add remove item",
    id = "manage_container",
    select = "container",
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
    AddForm('text', 'var', 'var', {
        ['place_holder'] = "var",
        ['default_value'] = "var"
    })
    AddForm('text', 'quantity (number)', 'quantity', {
        ['place_holder'] = "1",
        ['default_value'] = "number"
    })

    AddForm('items', "items", "item_id", {})

    AddForm('select', 'action', 'action', {
        ['default_option'] = 'give',

        ['options'] = {
            ['give'] = "give",
            ['remove'] = "remove",
        }
    })

end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local target = data['var']
    local quantity = data['quantity']
    local item_id = data['item_id']
    local action = data['action']

    

    if action == "give" then
        local add = AddItemInContainer(target, item_id, quantity)
    else
        local del = RemoveItemInContainer(target, item_id, quantity)
    end

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
