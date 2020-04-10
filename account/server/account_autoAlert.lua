local active = false
local timer = 0
local count = 0
local alert_type = ""
local alert_title = ""

function GetAutoAlertConfig()
    timer = _Auto_message_alert.config.timer
    alert_type = _Auto_message_alert.config.type
    alert_title = _Auto_message_alert.config.title
    count = tablelength(_Auto_message_alert.message)
end

function AutoAlertRun(player)
    if(_Auto_message_alert.active) then
        GetAutoAlertConfig()

        if(count ~= 0) then
            local index = 1
            CreateTimer(function()
                local message = _Auto_message_alert.message[index]
                if(index == count) then
                    index = 0    
                end
                SendAlert(player, alert_type, alert_title, message)
                index = index + 1
            end, timer, count, alert_type, alert_title)
        end

        return false
    end
end