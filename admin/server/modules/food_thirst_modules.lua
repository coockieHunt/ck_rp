local module = {
    name = "food | thirst",
    id = "food_thirst",
    select = "survival",
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
    
    AddForm('text', 'amount', 'amount', {
        ['place_holder'] = 'Amount max 100'
    })

    AddForm('select', 'action', 'action', {
        ['default_option'] = 'food',
        ['options'] = {
            ['food'] = "food",
            ['thirst'] = "thirst",
        }
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local amount = data['amount']
    local target = data['target']
    local action = data['action']

    if type == "food" then
        admin_food(playerId, target, amount)
    else
        admin_thirst(playerId, target, amount)
    end

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
