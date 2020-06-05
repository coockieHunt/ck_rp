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

        AddAction(playerId, 'upturn', "upturn")

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
    end
end 
AddRemoteEvent("ExecInteractAction", ExecInteractAction)


AddDialog(dialog)