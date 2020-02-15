--[[
  @author Digital.
  @url https://github.com/dig/onset-data
]]
AddRemoteEvent("GetPosByName", function(name , player, target)

  local name = tonumber(name)
  local list = POS_PRESET_DATA[name]

  local x = POS_PRESET_DATA[name]["x"]
  local y = POS_PRESET_DATA[name]["y"]
  local z = POS_PRESET_DATA[name]["z"]
  local h = POS_PRESET_DATA[name]["h"]

  CallRemoteEvent("admin_tp_preset_pos", target, x, y, z, h)

end)


