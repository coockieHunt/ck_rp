--[[
    If a script error occurs display it in the chat.
    This only works if the game was started with "-dev" switch
]]--
function OnScriptError(message)
    AddPlayerChat('<span color="#ff0000bb" style="bold" size="10">'..message..'</>')
end
AddEvent("OnScriptError", OnScriptError)