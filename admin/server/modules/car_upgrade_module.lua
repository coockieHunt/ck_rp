local module = {
    name = "upgrade",
    id = "car_upgrade",
    select = "car_admin",
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

    AddForm('spacer', 'upgrade', '', {})

    AddForm('checkbox', "boost", "boost",  
        {
            ['checked'] = false
        }
    )
    AddForm('checkbox', "back fire", "backfire",
        {
            ['checked'] = false
        }
    )
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local boost = 0
    local backfire = 0

    if(data.boost == 'on') then boost = 1 end
    if(data.backfire == 'on') then backfire = 1 end

    local pv = GetPlayerVehicle(data.target)

    if pv ~= 0 then
        SetUpgradeVehicleNitro(pv, data.boost)
        SetUpgradeVehicleBackFire(pv, data.backfire)
    else
        print('empty')
    end
end

AddAdminModule(module)
