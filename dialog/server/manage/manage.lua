function CloseDialogClient(playerId, DialogId)
    CallRemoteEvent(playerId, "CloseDialog", DialogId)
end

function OpenDialogClient(playerId, DialogId)
    CallRemoteEvent(playerId, "OpenDialog", DialogId)
 end

function DestroyWebUI(playerId, DialogId)
    CallRemoteEvent(playerId, "DestroyWebUI", DialogId)
end

function ExecWebJs(playerId, DialogId, cmd)
    CallRemoteEvent(playerId, "ExecWebJs", DialogId, cmd)
end

function ShowMouse(playerId, bool)
    CallRemoteEvent(playerId, "ShowMouse", bool)
end

function FreezePlayerInput(playerId, bool)
    CallRemoteEvent(playerId, "FreezePlayerInput", bool)
end

