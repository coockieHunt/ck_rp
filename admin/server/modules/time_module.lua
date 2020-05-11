local module = {
    name = "time",
    id = "change_time",
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
    AddForm('text', 'time', 'time', {
        ['place_holder'] = "0 - 12"
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local time = data['time']
    local time = tonumber(time)
    if time > 24 or time < 0 then
        AddPlayerChat(playerid, "error time <0 - 24>")
        return false
    end

    admin_change_time(playerId, time)

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
