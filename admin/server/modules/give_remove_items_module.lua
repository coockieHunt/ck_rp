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

    AddForm('text', 'quantity', 'quantity', {
        ['default_value'] = 1
    })
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
    local target = data['target']
    local quantity = data['quantity']
    local item_id = data['item_id']
    local action = data['action']

    if action == "give" then
        local add = AddPlayerItem(target, item_id, quantity)

        if add then
            AddAdminLog(playerId, "add item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
            SendAlert(target, "warning", "Admin", "An administrator give you <strong>" .. quantity .. " " .. item_id.."</strong>")
        else
            SendAlert(playerId, "error", "Admin", 
            GetPlayerName(target).." error admin invetory")
        end
    else
        local del = RemovePlayerItem(target, item_id, quantity)
	
        if del then
            AddAdminLog(playerId, "remove item "..GetPlayerName(target).." id : " .. item_id.. " quantity :" .. quantity)
            SendAlert(target, "warning", "Admin", "An administrator remove you <strong>" .. quantity .. " " .. item_id.."</strong>")
        else
            SendAlert(playerId, "error", "Admin", " error admin invetory")
        end
    end

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
