local module = {
    name = "weapons",
    id = "weapons",
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
    AddForm('weapons', "weapon", "weapon", {})
    AddForm('text', 'amount', 'amount', {})
    AddForm('text', 'slot', 'slot', {})
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    SetPlayerWeapon(data.target, data.weapon, data.amount, true, data.slot, true)

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
