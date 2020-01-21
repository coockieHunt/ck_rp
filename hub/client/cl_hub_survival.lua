local survival_ui = 0
local player_cash = 0
local player_cash_account = 0

AddEvent("OnPlayerSpawn", function(playerid)
    ShowHealthHUD(false)
    ShowWeaponHUD(false)
    survival_ui = CreateWebUI(0,0,0,0,1,16)
    SetWebAlignment(survival_ui, 0,0)
    SetWebAnchors(survival_ui, 0,0,1,1)
    SetWebURL(survival_ui,  'http://asset/' .. GetPackageName() .. '/files/ui_survival.html')
    SetWebVisibility(survival_ui, WEB_VISIBLE)
end)

function OnWebLoadComplete(webid)
    local playerId = GetPlayerId()
    
	if (survival_ui == webid) then
        Delay(500, function(webid, playerid)
            CallRemoteEvent('GetPlayerData', playerId)
		end, survival_ui, playerId)
	end
end
AddEvent("OnWebLoadComplete", OnWebLoadComplete)

local open = false
local function OnKeyPress(key)
    if (key == "F1") then
        if (open) then
            AddPlayerChat("false")
            
            SetWebVisibility(survival_ui, WEB_VISIBLE)
            open = false
        else
            AddPlayerChat("true")

            SetWebVisibility(survival_ui, WEB_HIDDEN)
            open = true
        end
    end
end
AddEvent("OnKeyPress", OnKeyPress)


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


