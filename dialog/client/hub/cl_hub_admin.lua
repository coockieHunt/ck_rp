local admin_ui
local admin_ui_builded = false

-- manage ui
function OpenUIAdmin()
    if admin_ui ~= nil then
        ShowMouseHub(true)
        LockPlayerInput(true)
        SetWebVisibility(admin_ui, WEB_VISIBLE)
        CloseUISurvival_warn()
        CloseUIAlert()

        ClearDropList()
        BuildSelect(admin_ui)
    end
end

function CloseUIAdmin()
    ShowMouseHub(false)
    LockPlayerInput(false)
    SetWebVisibility(admin_ui, WEB_HIDDEN)

    OpenUIAlert()
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
    if key == GetKeyMapServer("admin") and admin_ui_builded == true  then
        if GetWebVisibility(admin_ui) == WEB_HIDDEN then
            OpenUIAdmin()
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

function CallGetPlayerInfo(playerId)
    CallRemoteEvent("GetPlayerInfo", playerId)
end
AddEvent("CallGetPlayerInfo", CallGetPlayerInfo)


AddRemoteEvent("SetInfoLst", function(text, value)
    ExecuteWebJS(admin_ui, "addPiList('"..text.."', '"..value.."')")
end)

function ClearDropList()
    ExecuteWebJS(admin_ui, "ClearDropItemList()")
end

AddRemoteEvent('setBanList', function(active, by, start, Ban_end, reason)
    ExecuteWebJS(admin_ui, "BuildBanList('"..active.."','"..by.."', '"..start.."','"..Ban_end.."', '"..reason.."')")
end)

-- get ban list
function CallGetBanList(player)
    ExecuteWebJS(admin_ui, "clearBanList()")
    CallRemoteEvent("GetBanList", player)
end
AddEvent("CallGetBanList", CallGetBanList)


-- 
-- Build
-- 
local call_stack = {}

function BuildDialog()
    if(admin_ui_builded ~= true) then
        CallRemoteEvent("BuildAdminDialog")
        admin_ui_builded = true
    end
end

function AddCallStack(add)
    table.insert(call_stack, add)
end


function ExecCallStack()
    for k, v in ipairs(call_stack) do
        ExecuteWebJS(admin_ui, v)
    end

    AddPlayerChat(('<span color="%s">[client]</> %s'):format("#DFBE08", "admin dialog build press " .. GetKeyMapServer("admin") .. " for open menu"))
end
AddRemoteEvent("ExecCallStack", ExecCallStack)

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

function BuildInput(section, type, id, custom, name)
    AddCallStack("AddSectionInput('"..section.."','"..type.."','"..id.."','"..custom.."','"..name.."')")
end
AddRemoteEvent("BuildInput", BuildInput)

function BuildGameSelect(section, select, id, custom, name)
    AddCallStack("AddGameSelect('"..section.."','"..select.."','"..id.."','"..custom.."','"..name.."')")
end
AddRemoteEvent("BuildGameSelect", BuildGameSelect)

function BuildSelect(section, id, custom, name, options)
    AddCallStack("AddSectionSelect('"..section.."','"..id.."','"..custom.."','"..name.."',"..options..")")
end
AddRemoteEvent("BuildSelect", BuildSelect)

function BuildCheckbox(section, name, id, checked)
    AddCallStack("AddCheckBox('"..section.."','"..name.."','"..id.."',"..tostring(checked)..")")
end
AddRemoteEvent("BuildCheckbox", BuildCheckbox)

function BuildSpacer(section, title)
    AddCallStack("AddSectionSpacer('"..section.."','"..title.."')")
end
AddRemoteEvent("BuildSpacer", BuildSpacer)

function BuildEnd()
    ExecuteWebJS(admin_ui, "BuildEnd()")
end
AddRemoteEvent("BuildEnd", BuildEnd)


