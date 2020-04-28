function CloseDialog(playerId, DialogId)
    CallRemoteEvent(playerId, "closeDialog", DialogId)
end

function DestroyWebUI(playerId, DialogId)
    CallRemoteEvent(playerId, "DestroyWebUI", DialogId)
end

function ExecWebJs(playerId, DialogId, cmd)
    CallRemoteEvent(playerId, "ExecWebJs", DialogId, cmd)
end