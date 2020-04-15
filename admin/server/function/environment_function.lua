function admin_change_time(player, time)
    local level = 1

    if(AdminLevel(player, level)) then
      AddAdminLog(player, "admin " .. GetPlayerName(player) .. " change time : " .. tostring(time))
      setCurrentDayTime(time)
	end
end