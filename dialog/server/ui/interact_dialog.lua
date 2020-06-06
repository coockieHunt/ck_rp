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

local action_list = {}

function AddAction(playerId, name, action, time, cool_down)
    action_list[action] = {time = time, cool_down = cool_down}
    ExecWebJs(playerId, dialog.id,  "AddAction('"..name.."', '"..action.."');")
end

function SetupInteract(playerId, target_id, target_type)
    ExecWebJs(playerId, dialog.id, "SetActionTarget('"..target_id.."');")
    ExecWebJs(playerId, dialog.id, "SetActionType('"..target_type.."');")
end

function ClearAction(playerId)
    ExecWebJs(playerId, dialog.id,  "ClearAction();")
end



function ExecInteractAction(playerId, type, target, action)
    local time = action_list[action].time
    local cool_down = action_list[action].cool_down

    local p = getplayer(playerId)
    local cool_down_player = p.coolDown_interact

    if isnil(cool_down_player[action]) then
        FreezePlayerInput(playerId, true)
        CeateProgressBar(playerId, time)

        local cd_delay = CreateTimer(function() end, time + cool_down)

        cool_down_player[action] = {total_time = time + cool_down, delay = cd_delay}

        Delay(time + cool_down + 10, function()
            DestroyTimer(cool_down_player[action].delay)
            cool_down_player[action] = nil
        end)


        Delay(time, function(player)
            FreezePlayerInput(playerId, false)
    
            if type == 'vehicle' then
                if action == "upturn" then
                    upturn_vehicle_nearest(target)
                end
        
                if action == "refuel" then
                    local cur_fuel = GetFuel(target)
                    SetFuel(target, cur_fuel + 20)
                    RemovePlayerItem(playerId, "fuel_can", 1)
                    UseItem(playerId, "fuel_can", 1)
                end
        
                if action == "light" then
                    SetVehicleLightEnabled(target, not GetVehicleLightState(target))
                end
        
                if action == "repair" then
                    SetVehicleHealth(target, GetVehicleHealth(target) + 200)
                    RemovePlayerItem(playerId, "repair_kit", 1)
                end
            end
        end)
    else
        local reaming_seconde = GetTimerRemainingTime(cool_down_player[action].delay) / 1000
        local alert =  _("remaing_time_action",  reaming_seconde )
        SendAlert(playerId, 'warning', 'interact', alert)
    end
end 
AddRemoteEvent("ExecInteractAction", ExecInteractAction)


AddDialog(dialog)