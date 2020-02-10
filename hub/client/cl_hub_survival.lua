local survival_ui
local survival_key = "Tab"

function OpenUISurvival()
    if survival_ui ~= nil then
        SetWebVisibility(survival_ui, WEB_VISIBLE)
    end
end

function CloseUISurival()
    SetWebVisibility(survival_ui, WEB_HIDDEN)
end


local function OnKeyPress(key)
    if (key == "Tab") then
        CloseUISurvival_warn()
        OpenUISurvival()
    end
end
AddEvent("OnKeyPress", OnKeyPress)

local function OnKeyRelease(key)
    if (key == "Tab") then
        OpenUISurvival_warn()
        CloseUISurival()
    end
end
AddEvent("OnKeyRelease", OnKeyRelease)


AddEvent("OnPlayerSpawn", function(playerid)
    -- setup survival ui
    survival_ui = CreateWebUI(0,0,0,0,1,16)
    SetWebAlignment(survival_ui, 0,0)
    SetWebAnchors(survival_ui, 0,0,1,1)
    SetWebURL(survival_ui,  'http://asset/' .. GetPackageName() .. '/hub/files/ui_survival.html')
    SetWebVisibility(survival_ui, WEB_HIDDEN)
end)

-- manage ui

function OnWebLoadComplete(webid)
    local playerId = GetPlayerId()
    
	if (survival_ui == webid) then
        Delay(500, function(webid, playerid)
            CallRemoteEvent('GetPlayerData', playerId)
		end, survival_ui, playerId)
	end
end
AddEvent("OnWebLoadComplete", OnWebLoadComplete)

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


