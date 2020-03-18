local survival_ui

-- manage ui
function OpenUISurvival()
    if survival_ui ~= nil then
        ShowMouseHub(true)
        LockPlayerInput(true)
        SetWebVisibility(survival_ui, WEB_VISIBLE)

        clearInventory()
        GetPersoInventoryList()
        GetMaxWeightLift()
        CloseUISurvival_warn()
        ExecuteWebJS(survival_ui, "HideSidePanel()")
        CallRemoteEvent("OnPlayerOpenSurvivalUi")
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
            CallRemoteEvent("OnPlayerOpenSurvivalUi")
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
        local third = v[5]
        local food = v[6]
        local descrip = v[7]
        local type_color = v[8]
        local type_icon = v[9]


        local cmd = string.format(
            "AddItem(%q, %q, %q, %q, %q, %q, %q, %q, %q, %q);",
            k, name, quantity, thumb, type , third, food, descrip, type_color, type_icon
        )

        ExecuteWebJS(survival_ui, cmd)
	end

end
AddRemoteEvent("SetPersoInventoryList", SetPersoInventoryList)

-- update ui
function setPlayerCash(cash, a_cash, health, armor)
    ExecuteWebJS(survival_ui, "SetCash('"..cash.."');")            
    ExecuteWebJS(survival_ui, "SetBank('"..a_cash.."');")
 end
 AddRemoteEvent("setPlayerCash", setPlayerCash)

function setPlayerSurvival(food, thirst)
    ExecuteWebJS(survival_ui, "SetFood('"..food.."');")            
    ExecuteWebJS(survival_ui, "SetThirst('"..thirst.."');")
end
AddRemoteEvent("setPlayerSurvival", setPlayerSurvival)

function setPlayerVitalSigns(health, armor)
    ExecuteWebJS(survival_ui, "SetHealth('"..health.."');")
    ExecuteWebJS(survival_ui, "SetArmor('"..armor.."');")    
end
AddRemoteEvent("setPlayerVitalSigns", setPlayerVitalSigns)

function clearInventory()
    ExecuteWebJS(survival_ui, "clearInventory()")            
end

function GetMaxWeightLift()
    CallRemoteEvent('GetInventoryMaxWeight')     
end

function SetMaxWeightLift(CurWeight, MaxWeight)
    ExecuteWebJS(survival_ui, "SetWeightLift('"..CurWeight.."', '"..MaxWeight.."');")            
end
AddRemoteEvent("SetMaxWeightLift", SetMaxWeightLift)

-- call ui
function CallCloseSurvival()
    CloseUISurival()
end
AddEvent("CallCloseSurvival", CallCloseSurvival)

function CallDropItem(id, quantity)
    CloseUISurival()
    
    CallRemoteEvent("drop_item", id, quantity)
end
AddEvent("CallDropItem", CallDropItem)

function CallUseItem(id)
    CloseUISurival()

    CallRemoteEvent("UseItem", id)
end
AddEvent("CallUseItem", CallUseItem)