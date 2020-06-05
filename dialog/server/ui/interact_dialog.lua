local dialog = {
    id = "vehicle_interact",
    key = "I",
    type = "release",
    dysplay_on_spawn = false,
    view = "ui_interact.html",
    z_order = 2,
    frame_rate = 60
}

function dialog:onCreate(playerId, DialogId)
end

function dialog:onOpen(playerId, DialogId)
    -- setup 
    local move_mode = GetPlayerMovementMode(playerId)
    if move_mode ~= 0 then return false end 
    ClearAction(playerId)

    -- get info
    local car_nearest = GetNearestVehicles(
        playerId, 
        250
    )

    -- build dialog interact
    if car_nearest ~= false then -- car
        local closet_vehicle = getVehicleCloset(car_nearest)
        ShowMouse(playerId, true)

        SetupInteract(playerId, closet_vehicle, 'vehicle')

        local p = getplayer(playerId)

        if IfInventorContainsItem(DecodeInventory(p.inventory), "fuel_can", 1) then
            AddAction(playerId, _("refuel_car"), "refuel")
        end

        if IfInventorContainsItem(DecodeInventory(p.inventory), "repair_kit", 1) then
            AddAction(playerId, _("repair_car_rk"), "repair")
        end

        AddAction(playerId, _("flip_car"), "upturn")
        AddAction(playerId, _("light_car"), "light")

        return true
    end

    AddPlayerChat(playerId, "no interact entity")
    return false
end

function dialog:OnClose(playerId, DialogId)
    ShowMouse(playerId, false)
end

function dialog:OnLoadComplete(playerId, DialogId)
end

function SetupInteract(playerId, target_id, target_type)
    ExecWebJs(playerId, dialog.id, "SetActionTarget('"..target_id.."');")
    ExecWebJs(playerId, dialog.id, "SetActionType('"..target_type.."');")
end

function ClearAction(playerId)
    ExecWebJs(playerId, dialog.id,  "ClearAction();")
end

function AddAction(playerId, name, action)
    ExecWebJs(playerId, dialog.id,  "AddAction('"..name.."', '"..action.."');")
end

function ExecInteractAction(playerId, type, target, action)
    if type == 'vehicle' then
        if action == "upturn" then
            upturn_vehicle_nearest(target)
        end
        if action == "refuel" then
            local cur_fuel = GetFuel(target)
            SetFuel(target, cur_fuel + 20)
            RemovePlayerItem(playerId, "fuel_can", 1)
        end
        if action == "light" then
            SetVehicleLightEnabled(target, not GetVehicleLightState(target))
        end
        if action == "repair" then
            SetVehicleHealth(target, GetVehicleHealth(target) + 200)
            RemovePlayerItem(playerId, "repair_kit", 1)
        end
    end
end 
AddRemoteEvent("ExecInteractAction", ExecInteractAction)


AddDialog(dialog)