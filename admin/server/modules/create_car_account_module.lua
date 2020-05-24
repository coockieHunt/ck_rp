local module = {
    name = "create account",
    id = "create_car_account",
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
    AddForm('player', "target", "target", {})
    AddForm('vehicles', "vehicles", "car_id", {})
    AddForm('color', "color", "color", {})

    AddForm('checkbox', "boost", "boost",  
        {
            ['checked'] = true
        }
    )
    AddForm('checkbox', "back fire", "backfire",
        {
            ['checked'] = true
        }
    )
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local p = getplayer(data.target)

    local boost = 0
    local backfire = 0

    if(data.boost == 'on') then boost = 1 end
    if(data.backfire == 'on') then backfire = 1 end

    local upgrade = {
        boost = boost,
        backfire = backfire
    }

    RequestCreateCarAccount(p.id, data.car_id, data.color, upgrade)
end

AddAdminModule(module)
