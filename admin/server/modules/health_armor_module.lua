local module = {
    name = "health | armor",
    id = "health_armor",
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

    AddForm('text', 'amount', 'amount', {})
    AddForm('select', 'action', 'action', {
        options = {
            healt = "healt",
            armor = "armor",
        }
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local amount = data['amount']
    local target = data['target']
    local type = data['action']

    if type == "healt" then
        admin_heal(playerId, target, amount)
    else
        admin_armor(playerId,target , amount)
    end
end

AddAdminModule(module)
