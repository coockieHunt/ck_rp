function SendAlert(playerId , type, title, message)
    CallRemoteEvent(playerId, "SendAlert", type, title, message)
end