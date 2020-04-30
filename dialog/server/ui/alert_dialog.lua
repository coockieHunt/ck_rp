local dialog = {
    id = "alert",
    key = "nil",
    type = "press",
    dysplay_on_spawn = true,
    view = "ui_alert.html"
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
end

function dialog:OnClose(playerId, DialogId)
end

function dialog:OnLoadComplete(playerId, DialogId)
end

AddDialog(dialog)

-- func
function SendAlert(playerId, type, title, content)
    local data = getplayer(playerId)
    data:setAlertCount(data:getAlertCount() + 1)
    ExecWebJs(playerId, dialog:GetId(), "sendAlert( "..data:getAlertCount()..", '"..type.."',  '"..title.."', '"..content.."');")
end

function CeateProgressBar(playerId, time, color)
    if color == nil then color = "#43515e" end
    ExecWebJs(playerId, dialog:GetId(), "CreateProgressBar( "..time..", '"..color.."');")
end
