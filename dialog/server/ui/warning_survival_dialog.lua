local dialog = {
    id = "warning",
    key = nil,
    type = "press",
    dysplay_on_spawn = true,
    view = "ui_warning_survival.html"
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
    RefrechWarningSurvivalUi(playerId)
end

function dialog:OnClose(playerId, DialogId)
    -- print("close : " .. dialog:GetId())
    
end

function dialog:OnLoadComplete(playerId, DialogId)
    RefrechWarningSurvivalUi(playerId)
end

-- Function dialog
function OnPlayerDamage(playerId)
    RefrechWarningSurvivalUi(playerId)
end
AddEvent("OnPlayerDamage", OnPlayerDamage)

function RefrechWarningSurvivalUi(playerId)
    local p = getplayer(playerId)
    local DialogId = dialog:GetId()


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
    ExecWebJs(playerId, DialogId, "ShowSave()")
end

AddDialog(dialog)