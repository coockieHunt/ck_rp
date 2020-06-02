local dialog = {
    id = "vehicle_interact",
    key = "B",
    type = "release",
    dysplay_on_spawn = false,
    view = "ui_interact.html",
    z_order = 2,
    frame_rate = 60
}

function dialog:onCreate(playerId, DialogId)
end

function dialog:onOpen(playerId, DialogId)
    local car_nearest = GetNearestVehicles(
        playerId, 
        250
    )

    if car_nearest ~= false then
        local closet_vehicle = getVehicleCloset(car_nearest)
        AddPlayerChat(playerId, "interact car")
        
        return true
    else
        return false
    end
end

function dialog:OnClose(playerId, DialogId)
end

function dialog:OnLoadComplete(playerId, DialogId)
end


AddDialog(dialog)