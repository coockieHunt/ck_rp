local module = {
    name = "create account",
    id = "create_car_account",
    select = "car",
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
    AddForm('vehicles', "vehicles", "car_id", {})
    AddForm('color', "color", "color", {})
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local p = getplayer(data.target)
    RequestCreateCarAccount(p.id, data.car_id, data.color)
end

AddAdminModule(module)
