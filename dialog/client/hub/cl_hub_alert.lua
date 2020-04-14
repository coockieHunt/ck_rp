local alert_ui

function OpenUIAlert()
    if alert_ui ~= nil then
        SetWebVisibility(alert_ui, WEB_VISIBLE)
    end
end

function CloseUIAlert()
    SetWebVisibility(alert_ui, WEB_HIDDEN)
end

AddEvent("OnPlayerSpawn", function(playerid)
    alert_ui = CreateWebUI(0,0,0,0,1,16)
    SetWebAlignment(alert_ui, 0,0)
    SetWebAnchors(alert_ui, 0,0,1,1)
    SetWebURL(alert_ui,  'http://asset/' .. GetPackageName() .. '/dialog/files/ui_alert.html')
    SetWebVisibility(alert_ui, WEB_VISIBLE)
end)

function SendAlert(id, type, title, content)
    ExecuteWebJS(alert_ui, "sendAlert( "..id..", '"..type.."',  '"..title.."', '"..content.."');")
end
AddRemoteEvent("SendAlert", SendAlert)

function CeateProgressBar(time, color)
    if color == nil then color = "#43515e" end
    
    ExecuteWebJS(alert_ui, "CreateProgressBar( "..time..", '"..color.."');")
end
AddRemoteEvent("CeateProgressBar", CeateProgressBar)
