local module = {
    name = "teleport preset",
    id = "tp_preset",
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
    AddForm('preset_pos', "preset", "preset_id", {})

end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local target = data['target']
    local preset_id = data['preset_id']

    get_admin_tp_preset_pos(playerid, target, preset_id)
end

AddAdminModule(module)
