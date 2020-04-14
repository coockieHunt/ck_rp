local survival_warn_ui

function OpenUISurvival_warn()
    if survival_warn_ui ~= nil then
        SetWebVisibility(survival_warn_ui, WEB_VISIBLE)
    end
end

function CloseUISurvival_warn()
    SetWebVisibility(survival_warn_ui, WEB_HIDDEN)
end

AddEvent("OnPlayerSpawn", function(playerid)
    -- setup survival ui
    survival_warn_ui = CreateWebUI(0,0,0,0,1,16)
    SetWebAlignment(survival_warn_ui, 0,0)
    SetWebAnchors(survival_warn_ui, 0,0,1,1)
    SetWebURL(survival_warn_ui,  'http://asset/' .. GetPackageName() .. '/dialog/files/ui_warning_survival.html')
    SetWebVisibility(survival_warn_ui, WEB_HIDDEN)
end)


-- manage ui
function OnWebLoadComplete(webid)
    local playerId = GetPlayerId()
    
	if (survival_warn_ui == webid) then
        Delay(500, function(webid, playerid)
            CallRemoteEvent('RefrechWarningSurvivalUi', playerId)
		end, survival_warn_ui, playerId)
	end
end
AddEvent("OnWebLoadComplete", OnWebLoadComplete)

function ShowIconSave()
    ExecuteWebJS(survival_warn_ui, "ShowSave()")
end
AddRemoteEvent("ShowIconSave", ShowIconSave)

function setDammageWarning(health, armor)
    if(tonumber(math.floor(health)) < 50) then
        ExecuteWebJS(survival_warn_ui, "blink('heart', true, "..health..")")
    else
        ExecuteWebJS(survival_warn_ui, "blink('heart', false, "..health..")")
    end

    if(tonumber(math.floor(armor))  < 50) then
        ExecuteWebJS(survival_warn_ui, "blink('armor', true, "..armor..")")
    else
        ExecuteWebJS(survival_warn_ui, "blink('armor', false, "..armor..")")
    end
end
AddRemoteEvent("setDammageWarning", setDammageWarning)

function setSurivalWarning(food, thirst)
    if(tonumber(math.floor(food)) < 50) then
        ExecuteWebJS(survival_warn_ui, "blink('food', true, "..food..")")
    else
        ExecuteWebJS(survival_warn_ui, "blink('food', false, "..food..")")
    end

    if(tonumber(math.floor(thirst))  < 50) then
        ExecuteWebJS(survival_warn_ui, "blink('thirst', true, "..thirst..")")
    else
        ExecuteWebJS(survival_warn_ui, "blink('thirst', false, "..thirst..")")
    end
end
AddRemoteEvent("setSurivalWarning", setSurivalWarning)
