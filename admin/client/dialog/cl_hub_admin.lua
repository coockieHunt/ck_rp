local admin_ui
local admin_ui_builded = false

-- manage ui
function OpenUIAdmin()
    if admin_ui ~= nil then
        ShowMouse(true)
        FreezePlayerInput(true)

        SetWebVisibility(admin_ui, WEB_VISIBLE)
        BuildSelectOnStart(admin_ui)

        CloseDialog("warning")
        CloseDialog("alert")
    end
end

function CloseUIAdmin()
    ShowMouse(false)
    FreezePlayerInput(false)

    OpenDialog("warning")
    OpenDialog("alert")

    SetWebVisibility(admin_ui, WEB_HIDDEN)
end

-- package manager
function OnPackageStart()
    admin_ui = CreateWebUI(0, 0, 0, 0, 1, 60)
    LoadWebFile(admin_ui,'http://asset/' .. GetPackageName() .. '/dialog/files/ui_admin.html')
    SetWebAlignment(admin_ui, 0.0, 0.0)
    SetWebAnchors(admin_ui, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(admin_ui, WEB_HIDDEN)
end
AddEvent("OnPackageStart", OnPackageStart)


-- key mapping
AddEvent("OnKeyPress", function(key)
    if key == "F5" and admin_ui_builded == true  then
        if GetWebVisibility(admin_ui) == WEB_HIDDEN then
            OpenUIAdmin()
            BuildSelectOnOpen(admin_ui)
        else
            CloseUIAdmin()
        end
    end
end)

function OnWebLoadComplete(webid)
    local playerId = GetPlayerId()
    
	if (admin_ui == webid) then
        Delay(500, function(webid, playerid)
            BuildDialog()
		end, admin_ui, playerId)
	end
end
AddEvent("OnWebLoadComplete", OnWebLoadComplete)

-- call ui
function CallExecute(rslt)    
    CallRemoteEvent("Exucute_admin_module", rslt)
end
AddEvent("CallExecute", CallExecute)

function CallOpenModules(module_id)
    CallRemoteEvent("Open_admin_module", module_id)
end
AddEvent("CallOpenModules", CallOpenModules)

function CloseDialogAdmin()
    CloseUIAdmin()
end
AddRemoteEvent("CloseDialogAdmin", CloseDialogAdmin)
AddEvent("CloseDialogAdmin", CloseDialogAdmin)


-- 
-- Build
-- 
local call_stack = {}

function BuildDialog()
        CallRemoteEvent("BuildAdminDialog")
        admin_ui_builded = true
end

function AddCallStack(add)
    table.insert(call_stack, add)
end


function ExecCallStack()
    for k, v in ipairs(call_stack) do
        ExecuteWebJS(admin_ui, v)
    end
end
AddRemoteEvent("ExecCallStack", ExecCallStack)

function BuidlEndPlayerChat(key)
    AddPlayerChat(('<span color="%s">[client]</> %s'):format("#DFBE08", "admin dialog build press " .. key .. " for open menu"))
end
AddRemoteEvent("BuidlEndPlayerChat", BuidlEndPlayerChat)


function BuildDropDown(id, name)
    local exec = "AddDropDown('"..id.."','"..name.."')"
    ExecuteWebJS(admin_ui, exec)
end
AddRemoteEvent("BuildDropDown", BuildDropDown)

function BuildNav(name, id, section)
    local exec = "AddNav('"..name.."','"..id.."','"..section.."')"
    ExecuteWebJS(admin_ui, exec)
end
AddRemoteEvent("BuildNav", BuildNav)

function BuildSection(id)
    local exec = "AddSection('"..id.."')"
    ExecuteWebJS(admin_ui, exec)
end
AddRemoteEvent("BuildSection", BuildSection)

function BuildTitleBar(text)
    local exec = "setTitleWindows('"..text.."')"
    ExecuteWebJS(admin_ui, exec)
end
AddRemoteEvent("BuildTitleBar", BuildTitleBar)

function BuildInput(section, type, id, data, custom)
    AddCallStack("AddSectionInput('"..section.."','"..type.."','"..id.."','"..data.."','"..custom.."')")
end
AddRemoteEvent("BuildInput", BuildInput)

function BuildGameSelect(section, select, id, custom, name)
    AddCallStack("AddGameSelect('"..section.."','"..select.."','"..id.."','"..custom.."','"..name.."')")
end
AddRemoteEvent("BuildGameSelect", BuildGameSelect)

function BuildSelect(section, id, custom, name)
    AddCallStack("AddSectionSelect('"..section.."','"..id.."','"..custom.."','"..name.."')")
end
AddRemoteEvent("BuildSelect", BuildSelect)

function BuildCheckbox(section, name, id, custom)
    AddCallStack("AddCheckBox('"..section.."','"..name.."','"..id.."','"..custom.."')")
end
AddRemoteEvent("BuildCheckbox", BuildCheckbox)

function BuildSpacer(section, title, custom)
    AddCallStack("AddSectionSpacer('"..section.."','"..title.."', '"..custom.."')")
end
AddRemoteEvent("BuildSpacer", BuildSpacer)

function BuildEnd()
    ExecuteWebJS(admin_ui, "BuildEnd()")
end
AddRemoteEvent("BuildEnd", BuildEnd)


