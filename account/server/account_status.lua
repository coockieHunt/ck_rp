function setPlayerActive(player, bool)
    local p = getplayer(player)
    if(p ~= true) then
        p:setActive(bool)
    end
end

function IfPlayerActive(player)
    local p = getplayer(player)
    return p:getActive()
end

function IfPlayerBackUp(player)
    local p = getplayer(player)

    return p:getBackUpStatus()
end

function setPlayerBackUp(player, bool)
    local p = getplayer(player)

    if(p ~= true) then
        p:setBackUpStatus(bool)
    end
end

function IfCachedPlayer(player)
    local steam_id = tostring(GetPlayerSteamId(tonumber(player)))
    for key, value in pairs(playerData) do
        if(value.steamId == steam_id) then
            return true
        end
    end
    return false
end