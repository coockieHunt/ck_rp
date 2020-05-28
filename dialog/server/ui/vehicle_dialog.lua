local dialog = {
    id = "vehicle",
    key = "nil",
    type = "press",
    dysplay_on_spawn = false,
    view = "ui_vehicle.html"
}

function dialog:GetId()
    return dialog.id
end

function dialog:GetKey()
    return dialog.key
end

function dialog:GetDysplayOnSpawn()
    return dialog.dysplay_on_spawn
end

function dialog:GetView()
    return dialog.view
end

function dialog:GetType()
    return dialog.type
end

function dialog:onCreate(playerId, DialogId)
end

function dialog:onOpen(playerId, DialogId)
    local vehicleId = GetPlayerVehicle(playerId)

    if vehicleId ~= 0 then
        local fuel_tank =  GetFuelTankById(GetVehicleModel(vehicleId))
        local current_fuel = GetFuel(vehicleId)
        print("setup_fuel('"..fuel_tank.."', '"..current_fuel.."')")
        ExecWebJs(playerId, DialogId, "setup_fuel('"..fuel_tank.."', '"..current_fuel.."')")
    end
end

function dialog:OnClose(playerId, DialogId)
end

function dialog:OnLoadComplete(playerId, DialogId)
end

function RefreshVehicleUi(playerId, current_speed, curent_rpm)
    local vehicleId = GetPlayerVehicle(playerId)

    if vehicleId ~= 0 then
        local DialogId = dialog:GetId()

        local fuel_tank =  GetFuelTankById(GetVehicleModel(vehicleId))
        local current_fuel = GetFuel(vehicleId)

        local current_dammage = math.floor(GetVehicleHealth(vehicleId))

        local current_light = GetVehicleLightState(vehicleId)

        ExecWebJs(playerId, DialogId, "SetFuel('"..fuel_tank.."', '"..current_fuel.."')")
        ExecWebJs(playerId, DialogId, "SetDamage('5000', '"..current_dammage.."')")
        ExecWebJs(playerId, DialogId, "SetSpeed('"..current_speed.."')")
        ExecWebJs(playerId, DialogId, "SetLight("..tostring(current_light)..")")
        ExecWebJs(playerId, DialogId, "SetRpm("..curent_rpm..")")
    end
end
AddRemoteEvent("RefreshVehicleUi", RefreshVehicleUi)


AddDialog(dialog)