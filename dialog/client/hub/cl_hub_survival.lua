local survival_ui

-- manage ui
function OpenUISurvival()
    if survival_ui ~= nil then
        ShowMouseHub(true)
        LockPlayerInput(true)
        SetWebVisibility(survival_ui, WEB_VISIBLE)
        clearInventory()
        GetPersoInventoryList()

        CloseUISurvival_warn()
    end
end

function CloseUISurival()
    ShowMouseHub(false)
    LockPlayerInput(false)
    SetWebVisibility(survival_ui, WEB_HIDDEN)

    OpenUISurvival_warn()
end

-- package manager
function OnPlayerSpawn()
    survival_ui = CreateWebUI(0,0,0,0,1,16)
    SetWebAlignment(survival_ui, 0,0)
    SetWebAnchors(survival_ui, 0,0,1,1)
    SetWebURL(survival_ui,  'http://asset/' .. GetPackageName() .. '/dialog/files/ui_survival.html')
    SetWebVisibility(survival_ui, WEB_HIDDEN)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

-- key mapping
AddEvent("OnKeyPress", function(key)
    if key == GetKeyMapServer("survival") then
        if GetWebVisibility(survival_ui) == WEB_HIDDEN then
            OpenUISurvival()
        else
            CloseUISurival()
        end
    end
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

-- items list
function GetPersoInventoryList()
    CallRemoteEvent("GetPersoInventory")
end

function SetPersoInventoryList(inventory)
    for k, v in pairs(inventory) do
        local id = k
        local name = v[1]
        local quantity = v[2]
        local thumb = v[3]
        local type = v[4]

        local cmd = string.format("BuildPresonalInventoryListSelect(%q, %q, %q, %q, %q);", id, name, quantity, thumb, type)

        ExecuteWebJS(survival_ui, cmd)
	end

end
AddRemoteEvent("SetPersoInventoryList", SetPersoInventoryList)

-- update ui
function setPlayerData(cash, a_cash, health, armor)
    ExecuteWebJS(survival_ui, "SetCash('"..cash.."');")            
    ExecuteWebJS(survival_ui, "SetBank('"..a_cash.."');")
 end
 AddRemoteEvent("setPlayerData", setPlayerData)

function setDammage(health, armor)
    ExecuteWebJS(survival_ui, "SetHealth('"..health.."');")
    ExecuteWebJS(survival_ui, "SetArmor('"..armor.."');")    
end
AddRemoteEvent("setDammage", setDammage)

function clearInventory()
    ExecuteWebJS(survival_ui, "clearInventory()")            
end

-- call ui
function CallCloseSurvival()
    CloseUISurival()
end
AddEvent("CallCloseSurvival", CallCloseSurvival)

function CallDropItem(id)
    CloseUISurival()
    CallRemoteEvent("drop_item", id)
end
AddEvent("CallDropItem", CallDropItem)