function OnPlayerDeath(player, instigator)
    OnplayerRespawn(player)
end
AddEvent("OnPlayerDeath", OnPlayerDeath)