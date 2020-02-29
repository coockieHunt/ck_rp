local admin_ui

-- manage ui
function OpenUIAdmin()
    if admin_ui ~= nil then
        ShowMouseHub(true)
        LockPlayerInput(true)
        SetWebVisibility(admin_ui, WEB_VISIBLE)
        CloseUISurvival_warn()
        
        ClearDropList()
        BuildSelect(admin_ui)
    end
end

function CloseUIAdmin()
    ShowMouseHub(false)
    LockPlayerInput(false)
    SetWebVisibility(admin_ui, WEB_HIDDEN)

    OpenUISurvival_warn()
end

-- package manager
function OnPlayerSpawn()
    admin_ui = CreateWebUI(0, 0, 0, 0, 1, 60)
    LoadWebFile(admin_ui,'http://asset/' .. GetPackageName() .. '/dialog/files/ui_admin.html')
    SetWebAlignment(admin_ui, 0.0, 0.0)
    SetWebAnchors(admin_ui, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(admin_ui, WEB_HIDDEN)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

-- key mapping
AddEvent("OnKeyPress", function(key)
    if key == GetKeyMapServer("admin") then
        if GetWebVisibility(admin_ui) == WEB_HIDDEN then
            OpenUIAdmin()
        else
            CloseUIAdmin()
        end
    end
end)

-- call ui
function CallExecute(rslt)    
    CallRemoteEvent("Exucute", rslt)
    CloseUIAdmin()
end
AddEvent("CallExecute", CallExecute)

function CallCloseAdmin()
    CloseUIAdmin()
end
AddEvent("CallCloseAdmin", CallCloseAdmin)

function ClearDropList()
    ExecuteWebJS(admin_ui, "ClearDropItemList()")
end





