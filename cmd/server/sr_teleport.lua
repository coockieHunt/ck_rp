TeleportList = switch {
  ["town"] = {-182821.000000 , -41675.000000, 1160.000000, -90.0},
  ["gas"] = {25773.000000 , 80246.000000, 645.000000, 90.0},
  ["beach"] = {208591.0, 212335.0, 455.0, 180.0},
  ["police"] = {173479.0, 192671.0, 1335.0, -90.0},
  ["mtn"] = {-152707.37, -225139.59, 5000.0, -133.0},
  ["po"] = {41276.2109375, 134418.359375, 1800.7901611328, 89.136711120605},
  ["pancake"] = {119260.0703125, 164159.46875, 3028.7553710938, -129.5276184082},
  ["office"] = {191711.000000, 191871.000000, 9377.000000},
  ["garage"] = {166606.000000, 219968.000000, 1427.000000},
  ["hospital"] = {212112.53125, 160486.25, 1305.2940673828, 174.63586425781},
  ["bank"] = {211538.875, 190173.734375, 1306.9666748047, -177.48133850098},
  ["prison"] = {-167958.000000, 78089.000000, 1569.000000, -90.0},
  ["bblock"] = {-176209.000000, 76767.000000, 1633.000000, -90.0},
  ["cblock"] = {-178464.000000, 75026.000000, 1615.000000, -90.0},
  ["dblock"] = {-182821.000000, -41675.000000, 1160.000000, -90.0},
  ["guns"] = {114900.375, -4946.166015625, 1292.6826171875, -88.97412109375},
  ["mtn"] = {177599.125, 9973.447265625, 10370.80859375, 53.158172607422},
  ["air"] = {168904.359375, -148973.796875, 1250.2750244141, -121.59303283691},
  ["diner"] = {212405.000000, 94489.000000, 1340.000000, 90.0},
  ["vault"] = {189784.000000, 201549.000000, 835.000000, 90.0},
  ["cinema"] = {173747.000000, 198165.000000, 2532.0, 90.0},
  ["pd"] = {171553.000000, 195234.000000, 572.0, 90.0},
  ["hosp1"] = {215242.000000, 158470.000000, 2962.000000, 90.0},
  ["hosp2"] = {212372.000000, 153763.000000, 2793.000000, 90.0},
  default = true,
}

function TeleportTo(player, dest)
  local to = TeleportList:case(dest)
  if(to == true) then return AddPlayerChat(player, dest..' invalide position') end
	AddAdminLog(player, "teleport to x =" .. to[1] ..", y= ".. to[2] ..", z= " .. to[3] ..", h= " .. to[4])

  to[4] = to[4] or -1.0
	if (GetPlayerVehicleSeat(player) == 1) then
    local vehicle = GetPlayerVehicle(player)
    SetVehicleLocation(vehicle, to[1], to[2], to[3])
    if (to[4] ~= -1.0) then
      SetVehicleHeading(vehicle, to[4])
    end

		SetVehicleLinearVelocity(vehicle, 0.0, 0.0, 0.0, true)
		SetVehicleAngularVelocity(vehicle, 0.0, 0.0, 0.0, true)
		local rx, ry, rz = GetVehicleRotation(vehicle)
		SetVehicleRotation(vehicle, 0.0, ry, 0.0)
	else
		SetPlayerLocation(player, to[1], to[2], to[3])
		if (to[4] ~= -1.0) then
			SetPlayerHeading(player, to[4])
		end
	end
end
AddCommand("tp", TeleportTo)
