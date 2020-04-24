local module = {
    name = "kill",
    id = "kill",
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
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local p = data['target']

    admin_kill(playerId, p)

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
