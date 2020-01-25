AddEvent("OnPlayerSpawn", function(playerid)
    -- setup survival ui
    survival_ui = CreateWebUI(0,0,0,0,1,16)
    SetWebAlignment(survival_ui, 0,0)
    SetWebAnchors(survival_ui, 0,0,1,1)
    SetWebURL(survival_ui,  'http://asset/' .. GetPackageName() .. '/files/ui_survival.html')
    SetWebVisibility(survival_ui, WEB_HIDDEN)
    -- setup fs ui
    fs_ui = CreateWebUI(0,0,0,0,1,16)
    SetWebAlignment(fs_ui, 0,0)
    SetWebAnchors(fs_ui, 0,0,1,1)
    SetWebURL(fs_ui,  'http://asset/' .. GetPackageName() .. '/files/ui_loading_fullscreen.html')
    SetWebVisibility(fs_ui, WEB_VISIBLE)
    SetIgnoreMoveInput(true)
end)

function OnWebLoadComplete(webid)
    local playerId = GetPlayerId()
    
	if (survival_ui == webid) then
        Delay(500, function(webid, playerid)
            CallRemoteEvent('GetPlayerData', playerId)
            SetWebVisibility(fs_ui, WEB_HIDDEN)
            SetIgnoreMoveInput(false)
		end, survival_ui, playerId)
	end
end
AddEvent("OnWebLoadComplete", OnWebLoadComplete)

local function OnKeyPress(key)
    if (key == "Tab") then
        SetWebVisibility(survival_ui, WEB_VISIBLE)
    end
end
AddEvent("OnKeyPress", OnKeyPress)

local function OnKeyRelease(key)
    if (key == "Tab") then
        SetWebVisibility(survival_ui, WEB_HIDDEN)
    end
end
AddEvent("OnKeyRelease", OnKeyRelease)

-- function

function setPlayerData(cash, a_cash, health, armor)
    ExecuteWebJS(survival_ui, "SetCash('"..cash.."');")            
    ExecuteWebJS(survival_ui, "SetAccountCash('"..a_cash.."');")
 end
 AddRemoteEvent("setPlayerData", setPlayerData)

 function setDammage(health, armor)
    ExecuteWebJS(survival_ui, "SetHealth('"..health.."');")
    ExecuteWebJS(survival_ui, "SetArmor('"..armor.."');")    
end
AddRemoteEvent("setDammage", setDammage)


