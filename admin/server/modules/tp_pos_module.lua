local module = {
    name = "teleport XYZ",
    id = "tp_pos",
    select = "teleport",
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

    AddForm('spacer', 'positions', 'positions', {})

    AddForm('text', 'x', 'x', {})
    AddForm('text', 'y', 'y', {})
    AddForm('text', 'z', 'z', {})
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local target = data['target']

    local x = data['x']
    local y = data['y']
    local z = data['z']
    
    admin_tp_to_pos(target, x, y, z)
end

AddAdminModule(module)
