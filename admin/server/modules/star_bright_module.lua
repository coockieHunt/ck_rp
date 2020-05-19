local module = {
    name = "star Brightness",
    id = "star_brightness",
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
    AddForm('text', 'brightness', 'bright', {
        ['place_holder'] = "0 - 4"
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local bright = data['bright']

    bright = tonumber(bright)

    if bright < 0 and bright > 4 then
        AddPlayerChat(playerId, "error brightness  < 0 - 4>")
        return false
    end

    setStarsBrightness(bright)

    AddAdminLog(playerId, "admin " .. GetPlayerName(playerId) .. " change stars brightness : " .. tostring(bright))

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
