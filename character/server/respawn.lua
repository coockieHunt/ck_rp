function OnplayerRespawn(playerId)
	Delay(GetPlayerRespawnTime(playerId) + 100, function()
        SetPlayerClothing(playerId)
	end)
end