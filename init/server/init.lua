--init player
function OnPlayerJoin(playerId)
	local sp = GetPosByVar(_Spawn_location)
	SetPlayerSpawnLocation(playerId, sp['x'], sp['y'], sp['z'], sp['h'])
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerLoadComplete(playerId)
	local notify_alert = _("on_connect_chat_all",'"#43d815"', GetPlayerName(playerId))
	AddPlayerChatAll(notify_alert)
	AutoAlertRun(playerId)
	CallOnPlayerSpawnItem(playerId)
end

function OnPackageStart()
	if _DEBUG then 
		local vehicle = CreateVehicle(19, 117404, 163024, 2987, 25)
		SetVehicleLicensePlate(vehicle, "DEBUG")
		SetVehicleHealth(vehicle, 100)
		SetFuel(vehicle, 50)

		local vehicle_1 = CreateVehicle(25, 117219, 163561, 2987, 25)
		SetVehicleLicensePlate(vehicle_1, "DEBUG")
		SetVehicleHealth(vehicle_1, 5000)
		SetFuel(vehicle_1, 100)
	end
end
AddEvent("OnPackageStart", OnPackageStart)