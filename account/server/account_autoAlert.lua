local active = false
local timer = 0
local count = 0
local alert_type = ""
local alert_title = ""

local params

function GetAutoAlertConfig()
    params = {
        timer = _Auto_message_alert.config.timer,
        alert_type = _Auto_message_alert.config.type,
        alert_title = _Auto_message_alert.config.title,
        messageList = _Auto_message_alert.message,
        count = tablelength(_Auto_message_alert.message)
    }
end

function AutoAlertRun(player)
    if(_Auto_message_alert.active) then
        GetAutoAlertConfig()
        CallRemoteEvent(player, "CreateTimerAutoAlert", params)
    end
end