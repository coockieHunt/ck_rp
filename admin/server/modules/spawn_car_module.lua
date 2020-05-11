local module = {
    name = "spawn",
    id = "spawn_car",
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
    AddForm('vehicles', "vehicles", "car_id", {
        ["default_select"] = 5
    })
    AddForm('color', "color", "color", {})
    AddForm('text', "healt", "healt", {
        ['default_value'] = "5000",
        ['place_holder'] = 'max 5000',
    })
    AddForm('spacer', "option", "",  {})
    AddForm('checkbox', "boost", "boost",  
        {
            ['checked'] = true
        }
    )
    AddForm('checkbox', "Auto mount", "AutoMount",
        {
            ['checked'] = true
        }
    )
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local AutoMount = false
    local boost = false
    if(data.AutoMount == 'on') then AutoMount = true end
    if(data.boost == 'on') then boost = true end
    admin_car_spawn(playerId, data.car_id, AutoMount, boost, data.color, data.healt)

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
