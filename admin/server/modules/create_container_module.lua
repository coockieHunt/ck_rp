local module = {
    name = "create",
    id = "create_container",
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
    AddForm('text', 'name', 'name', {
        ['place_holder'] = "unamed",
        ['default_value'] = "unamed"
    })
    AddForm('text', 'weight (number)', 'weight', {
        ['place_holder'] = "40",
        ['default_value'] = "40"
    })

end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    createContainer(data.var, data.name, data.weight)

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
