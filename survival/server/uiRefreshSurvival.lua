-- update survival ui
function SetUiDamage(playerid)
    local p = getplayer(playerid)

    local h = math.floor(p:getHealth()) 
    local a = math.floor(p:getArmor()) 

    CallRemoteEvent(playerid, "setPlayerVitalSigns",  h, a)
end

function setUiCash(playerid)
    local p = getplayer(playerid)

    local c = math.floor(p:getCash()) 
    local ca = math.floor(p:getCashAccount()) 

    CallRemoteEvent(playerid, "setPlayerCash",  c, ca)
end

function SetSUiurvival(playerid)
    local p = getplayer(playerid)

    local f = p:getFood()
    local t = p:getThirst()

    CallRemoteEvent(playerid, "setPlayerSurvival",  f, t)
end


-- Update warning suvival ui
function setUiWarnDamage(playerid)
    local p = getplayer(playerid)

    local h = math.floor(p:getHealth()) 
    local a = math.floor(p:getArmor()) 

    CallRemoteEvent(playerid, "setDammageWarning",  h, a)

end

function setUiWarnSuvival(playerid)
    local p = getplayer(playerid)

    local f = p:getFood()
    local t = p:getThirst()

    CallRemoteEvent(playerid, "setSurivalWarning",  f, t)
end

-- Event
function OnPlayerOpenSurvivalUi(playerid)
    SetUiDamage(playerid)
    setUiCash(playerid)
    SetSUiurvival(playerid)
end
AddRemoteEvent("OnPlayerOpenSurvivalUi", OnPlayerOpenSurvivalUi)

function OnPlayerSpawn(playerid)
    CallRemoteEvent(playerid, "InitSurvivalTimer", _Account_timer.decrease_survival_timer)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

function OnPlayerDamage(playerid)
    setUiWarnDamage(playerid)
end
AddEvent("OnPlayerDamage", OnPlayerDamage)