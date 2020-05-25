local module = {
    name = "car",
    id = "car_entity",
    select = "entity",
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
    AddForm('car_world_list', "world car", "world_car", {})

    AddForm('select', 'action', 'action',{
        ['default_option'] = "store",
        ['options'] = {
            ['store'] = "store",
            ['teleport'] = "teleport",
            ['alarm'] = "stop alarm",
            ['lock_unlock'] = "lock unlock",
            ['repair'] = "repair",
            ['destroy'] = "destroy"
        }
    })
end

function module:OnOpen(playerId)
  
end

function module:Onexecute(playerId, data)
    local car_selected = data['world_car']
    local action = data['action']

    if action == "alarm" then
        if GetVehiclePropertyValue(car_selected, "alarm") then
            StopAlarm(car_selected)
        end
    end

    if action == "store" then
        local store = store_car(car_selected)

        if store then
            print(stored)
        else
            print('no owner')
        end
    end

    if action == "lock_unlock" then
        lock_unlock_vehicle(car_selected, playerId)
    end

    if action == "teleport" then
        local x,y,z = GetVehicleLocation(car_selected)

        admin_tp_to_pos(playerId, x,y,z + 500)
    end

    if action == "repair" then
        SetVehicleHealth(car_selected, 5000)
    end

    if action == "destroy" then
        SetVehicleHealth(car_selected, 0)
        ExplodeCar(car_selected)
    end

    CloseAdminDialog(playerId)
end

AddAdminModule(module)