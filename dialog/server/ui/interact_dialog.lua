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
        _Car.interact.distance
    )

    -- build dialog interact
    if car_nearest ~= false then -- car
        local closet_vehicle = GetClosetVehicle(car_nearest)

        if GetVehicleDriver(closet_vehicle) == playerId then return false end

        ShowMouse(playerId, true)
        SetupInteract(playerId, closet_vehicle, 'vehicle')

        local p = getplayer(playerId)

        if IfInventorContainsItem(DecodeInventory(p.inventory), "fuel_can", 1) then
            AddAction(playerId, _("refuel_car"), "refuel", 2000, 2000)
        end

        if IfInventorContainsItem(DecodeInventory(p.inventory), "repair_kit", 1) then
            AddAction(playerId, _("repair_car_rk"), "repair", 2000, 2000)
        end

        AddAction(playerId, _("flip_car"), "upturn", 2000, 2000)
        AddAction(playerId, _("light_car"), "light", 0, 0)

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

-- function
function AddAction(playerId, name, action, time, cool_down)
    AddRegisterActionTime(playerId, name, action, time, cool_down)
    ExecWebJs(playerId, dialog.id,  "AddAction('"..name.."', '"..action.."');")
end

function SetupInteract(playerId, target_id, target_type)
    ExecWebJs(playerId, dialog.id, "SetActionTarget('"..target_id.."');")
    ExecWebJs(playerId, dialog.id, "SetActionType('"..target_type.."');")
end

function ClearAction(playerId)
    ExecWebJs(playerId, dialog.id,  "ClearAction();")
end

AddDialog(dialog)