local dialog = {
    id = "alert",
    key = false,
    type = false,
    dysplay_on_spawn = true,
    view = "ui_alert.html",
    z_order = 1,
    frame_rate = 60
}

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
    ExecWebJs(playerId, dialog.id, "sendAlert( "..data:getAlertCount()..", '"..type.."',  '"..title.."', '"..content.."');")
end
AddRemoteEvent("SendAlert", SendAlert)


function CeateProgressBar(playerId, time, color)
    if color == nil then color = "#43515e" end
    ExecWebJs(playerId, dialog.id, "CreateProgressBar( "..time..", '"..color.."');")
end
