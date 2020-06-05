local module = {
    name = "fog density",
    id = "change_fog",
    select = "environment",
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
    AddForm('text', 'density', 'density', {
        ['place_holder'] = "0 - 4"
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local density = data['density']
    local density = tonumber(density)
    if density < 0 or density > 4 then
        AddPlayerChat(playerId, "error density <0 - 4>")
        return false
    end

    AddAdminLog(playerId, "admin " .. GetPlayerName(playerId) .. " change fog density : " .. tostring(density))
    setFogDensity(density)

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
