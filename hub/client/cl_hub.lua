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

AddRemoteEvent("updateHud_survival", function(health, armor)
    ExecuteWebJS(survival_ui, "SetHealth('"..health.."');")
    ExecuteWebJS(survival_ui, "SetArmor('"..armor.."');")
end)