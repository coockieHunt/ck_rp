local module = {
    name = "cache",
    id = "cache_remove",
    select = "account",
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
    AddForm('player_cache', "target", "target", {})
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local target = data['target']
    admin_remove_cache_player(playerId, target)
end

AddAdminModule(module)
