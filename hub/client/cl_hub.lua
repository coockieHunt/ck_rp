local survival_ui = 0

AddEvent("OnPlayerSpawn", function(playerid)
    ShowHealthHUD(false)
    ShowWeaponHUD(false)
    survival_ui = CreateWebUI(0,0,0,0,1,16)
    SetWebAlignment(survival_ui, 0,0)
    SetWebAnchors(survival_ui, 0,0,1,1)
    SetWebURL(survival_ui,  'http://asset/' .. GetPackageName() .. '/files/ui.html')
    SetWebVisibility(survival_ui, WEB_VISIBLE)
end)

function OnWebLoadComplete(webid)
	if (survival_ui == webid) then
        Delay(500, function(webid)
            local health = math.floor(GetPlayerHealth())
            local armor = math.floor(GetPlayerArmor())
            ExecuteWebJS(survival_ui, "SetHealth('"..health.."');")
            ExecuteWebJS(survival_ui, "SetArmor('"..armor.."');")
		end, survival_ui)
	end
end
AddEvent("OnWebLoadComplete", OnWebLoadComplete)

AddRemoteEvent("updateHud_survival", function()
    local health = math.floor(GetPlayerHealth())
    local armor = math.floor(GetPlayerArmor())
    ExecuteWebJS(survival_ui, "SetHealth('"..health.."');")
    ExecuteWebJS(survival_ui, "SetArmor('"..armor.."');")
end)