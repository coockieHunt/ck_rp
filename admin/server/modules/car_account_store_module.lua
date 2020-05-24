local module = {
    name = "store account",
    id = "store_car_account",
    select = "car_account",
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
    AddForm('text', 'car id', 'car_id', {})
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    store_car(data.car_id)
end

AddAdminModule(module)
