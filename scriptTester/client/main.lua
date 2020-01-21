local gui = nil
local scriptTesterOpen = false

function OnScriptError(message) --Standard copy&paste code from onset lua script examples for printing out lua errors    AddPlayerChat('<span color="#33DD33" style="bold" size="12">[PinColorpicker]</> - ' .. msgs[i])
    AddPlayerChat('<span color="#882233" style="bold" size="12">[ScriptTester Error] [CLIENT]</>: ' .. message)
end
AddEvent("OnScriptError", OnScriptError)

function PinLog(...) --I use this instead of the default AddPlayerChat just so it looks pretty and makes it clear what package my messages are from
    local msgs = {...}
    for i = 1, #msgs do
        AddPlayerChat('<span color="#33DD33" style="bold" size="12">[ScriptTester]</> - ' .. msgs[i])
    end
end

local function OnPackageStart()
	gui = CreateWebUI(0, 0, 0, 0)
    LoadWebFile(gui, "http://asset/" .. GetPackageName() .. "/client/web/scriptTester.html")
    local widthPercentage = 80;
    local heightPercentage = 80;
	SetWebAlignment(gui, 0, 0)
	SetWebAnchors(gui, 0.5 - (widthPercentage/200), 0.5 - (heightPercentage/200), 0.5 + (widthPercentage/200), 0.5 + (heightPercentage/200)) 
    SetWebVisibility(gui, WEB_HIDDEN)
end
AddEvent("OnPackageStart", OnPackageStart)

local timeUILastTriggered = GetTimeSeconds()
local function CloseScriptTesterUI()
    timeUILastTriggered = GetTimeSeconds()
    scriptTesterOpen = false
    SetWebVisibility(gui, WEB_HIDDEN)
    SetInputMode(INPUT_GAME)
    ShowMouseCursor(false)
end
AddEvent("CloseScriptTester", CloseScriptTesterUI)

local function OpenScriptTesterUI()
    scriptTesterOpen = true
    ExecuteWebJS(gui, 'RegisterOpenedTime()')
    SetWebVisibility(gui, WEB_VISIBLE)
    SetInputMode(INPUT_UI)
    ShowMouseCursor(true)
end

local function OnKeyPress(key)
    if (key == "F1") then
        if ((GetTimeSeconds() - timeUILastTriggered) < .5) then
            return nil
        end
        timeUILastTriggered = GetTimeSeconds()
        if (scriptTesterOpen) then
            CloseScriptTesterUI()
        else
            OpenScriptTesterUI()
        end
    end
end
AddEvent("OnKeyPress", OnKeyPress)

local function ExecuteClientScript(script)
    loadstring(script)
end
AddEvent("ExecuteClientScript", ExecuteClientScript)

local function ExecuteServerScript(script)
    CallRemoteEvent("ExecuteServerScript", script)
end
AddEvent("ExecuteServerScript", ExecuteServerScript)

function OnServerExecutionError(msg)
    AddPlayerChat('<span color="#AA2233" style="bold" size="12">[ScriptTester Error] [SERVER]</>: ' .. msg)
end
AddRemoteEvent("OnServerExecutionError", OnServerExecutionError)