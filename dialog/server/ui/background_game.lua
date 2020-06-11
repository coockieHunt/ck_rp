local dialog = {
    id = "background_game",
    key = false,
    type = "permanent",
    dysplay_on_spawn = true,
    view = "ui_background_game.html",
    z_order = 2,
    frame_rate = 60
}

function dialog:onCreate(playerId, DialogId)
end

function dialog:onOpen(playerId, DialogId)

end

function dialog:OnClose(playerId, DialogId)
end

function dialog:OnLoadComplete(playerId, DialogId)
    RefrechWarningSurvivalUi(playerId)

    ExecWebJs(playerId, DialogId, "HideSave()")
end


-- func
function SendAlert(playerId, type, title, content)
    local data = getplayer(playerId)
    data:setAlertCount(data:getAlertCount() + 1)
    ExecWebJs(playerId, dialog.id, "sendAlert( "..data:getAlertCount()..", '"..type.."',  '"..title.."', '"..content.."');")
end
AddRemoteEvent("SendAlert", SendAlert)

function CeateProgressBar(playerId, title,  time)
    ExecWebJs(playerId, dialog.id, "CreateProgressBar('"..title.."', "..time..");")
end

function DeleteProgessBar(playerId)
    ExecWebJs(playerId, dialog.id, "DeleteProgressBar();")
end

function OnPlayerDamage(playerId)
    RefrechWarningSurvivalUi(playerId)
end
AddEvent("OnPlayerDamage", OnPlayerDamage)

function RefrechWarningSurvivalUi(playerId)
    local p = getplayer(playerId)
    local DialogId = dialog.id


    local health = p:getHealth()
    local armor = p:getArmor()
    local food = p:getFood()
    local thirst =p:getThirst()

    ExecWebJs(playerId, DialogId, "blink('armor', false, 0)")
    ExecWebJs(playerId, DialogId, "blink('heart', false, 0)")
    ExecWebJs(playerId, DialogId, "blink('food', false, 0)")
    ExecWebJs(playerId, DialogId, "blink('thirst', false, 0)")


    if(tonumber(math.floor(health)) < 50) then
        ExecWebJs(playerId, DialogId, "blink('heart', true, "..health..")")
    end

    if(tonumber(math.floor(armor))  < 50) then
        ExecWebJs(playerId, DialogId, "blink('armor', true, "..armor..")")
    end

    if(tonumber(math.floor(food)) < 50) then
        ExecWebJs(playerId, DialogId, "blink('food', true, "..food..")")
    end

    if(tonumber(math.floor(thirst))  < 50) then
        ExecWebJs(playerId, DialogId, "blink('thirst', true, "..thirst..")")
    end
 end

function ShowIconSaveClient(playerId)
    local DialogId = dialog.id

    ExecWebJs(playerId, DialogId, "ShowSave()")
end

AddDialog(dialog)
