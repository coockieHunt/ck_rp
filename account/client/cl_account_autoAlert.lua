function CreateTimerAutoAlert(params)
        if(params.count ~= 0) then
            local index = 1
            CreateTimer(function()
                local message = params.messageList[1]
                if(index == count) then
                    index = 0    
                end
                SendAlert(GetPlayerId() , params.alert_type, params.alert_title, message)
                index = index + 1
            end, params.timer, params)
        end
end
AddRemoteEvent("CreateTimerAutoAlert", CreateTimerAutoAlert)
