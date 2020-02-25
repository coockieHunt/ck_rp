AddRemoteEvent("GetServerKeyMap", function(playerid)
    local key = _Key_ui

    CallRemoteEvent(playerid, "GetKeyMap", key)
end)