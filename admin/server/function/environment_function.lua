function admin_change_time(player, time)
  AddAdminLog(player, "admin " .. GetPlayerName(player) .. " change time : " .. tostring(time))
  setCurrentDayTime(time)
end