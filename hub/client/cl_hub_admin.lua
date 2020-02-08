local admin_ui
local admin_key = "F5"

function OpenUIAdmin()
    if admin_ui ~= nil then
        SetIgnoreLookInput(true)
        SetIgnoreMoveInput(true)
        ShowMouseCursor(true)
        SetInputMode(INPUT_GAMEANDUI)
        SetWebVisibility(admin_ui, WEB_VISIBLE)
    end
end

function CloseUIAdmin()
    SetIgnoreLookInput(false)
    SetIgnoreMoveInput(false)
    ShowMouseCursor(false)
    SetInputMode(INPUT_GAME)
    SetWebVisibility(admin_ui, WEB_HIDDEN)
end

function OnPackageStart()
    admin_ui = CreateWebUI(0, 0, 0, 0, 1, 60)
    LoadWebFile(admin_ui,'http://asset/' .. GetPackageName() .. '/files/ui_admin.html')
    SetWebAlignment(admin_ui, 0.0, 0.0)
    SetWebAnchors(admin_ui, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(admin_ui, WEB_HIDDEN)
end
AddEvent("OnPackageStart", OnPackageStart)

AddEvent("OnKeyPress", function(key)
    if key == admin_key then
        if GetWebVisibility(admin_ui) == WEB_HIDDEN then
            CloseUISurvival_warn()
            OpenUIAdmin()
        else
            OpenUISurvival_warn()
            CloseUIAdmin()
        end
    end
end)

function urldecode(s)
    s = s:gsub('+', ' ')
         :gsub('%%(%x%x)', function(h)
                             return string.char(tonumber(h, 16))
                           end)
    return s
  end
  
  function parseurl(s)
    s = s:match('%s+(.+)')
    local ans = {}
    for k,v in s:gmatch('([^&=?]-)=([^&=?]+)' ) do
      ans[ k ] = urldecode(v)
    end
    return ans
  end

function testcall(rslt)
    AddPlayerChat(rslt) 
end
AddEvent("testcall", testcall)


