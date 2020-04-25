function OnPlayerStreamIn(player, otherplayer)
	local otherplayerData = getplayer(otherplayer)
	SetPlayerClothing(otherplayer)
end
AddEvent("OnPlayerStreamIn", OnPlayerStreamIn)
