local module = {
    name = "teleport to",
    id = "tp_to",
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
    AddForm('player', "main", "main", {})
    AddForm('player', "to", "to", {})

end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local main = data['main']
    local to = data['to']

    AddAdminLog(playerId, GetPlayerName(main).." tp to " .. GetPlayerName(to))
	local x, y, z = GetPlayerLocation(to)
    admin_tp_to_pos(main, x, y, z)
    
    CloseAdminDialog(playerId)
end

AddAdminModule(module)
