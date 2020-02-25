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
    SetWebVisibility(survival_warn_ui, WEB_VISIBLE)
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
        ExecuteWebJS(survival_warn_ui, "flash('health', true)")
    else
        ExecuteWebJS(survival_warn_ui, "flash('health', false)")
    end

    if(tonumber(math.floor(armor))  < 50) then
        ExecuteWebJS(survival_warn_ui, "flash('armor', true)")
    else
        ExecuteWebJS(survival_warn_ui, "flash('armor', false)")
    end

    if((tonumber(math.floor(armor))  < 50) and (tonumber(math.floor(health)) < 50)) then
        ExecuteWebJS(survival_warn_ui, "flash('health', true)")
        ExecuteWebJS(survival_warn_ui, "flash('armor', true)")
    end

end
AddRemoteEvent("setDammageWarning", setDammageWarning)