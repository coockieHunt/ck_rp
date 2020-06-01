local dialog = {
    id = "vehicle",
    key = false,
    type = false,
    dysplay_on_spawn = false,
    view = "ui_vehicle.html",
    z_order = 2,
    frame_rate = 60
}

function dialog:onCreate(playerId, DialogId)
end

function dialog:onOpen(playerId, DialogId)
    local vehicleId = GetPlayerVehicle(playerId)

    if vehicleId ~= 0 then
        local fuel_tank =  GetFuelTankById(GetVehicleModel(vehicleId))
        local current_fuel = GetFuel(vehicleId)
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
        local DialogId = dialog.id

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