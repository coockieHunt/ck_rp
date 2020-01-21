function OnScriptError(message) --Standard copy&paste code from onset lua script examples for printing out lua errors    AddPlayerChat('<span color="#33DD33" style="bold" size="12">[PinColorpicker]</> - ' .. msgs[i])
    print(message)
end

local function ExecuteServerScript(player, script)
    local func, compileError = load(script)
    if func then
        local success, pcallError = pcall(func)
        if success == false then
            CallRemoteEvent(player, "OnServerExecutionError", pcallError)
        end
    else
        CallRemoteEvent(player, "OnServerExecutionError", compileError)
    end
end
AddRemoteEvent("ExecuteServerScript", ExecuteServerScript)