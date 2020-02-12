--[[
  @author Digital.
  @url https://github.com/dig/onset-data
]]

--[[
  Vehicles
]]
function GetVehicleName(id)
  if VEHICLE_DATA[id] == nil then return false end
  return VEHICLE_DATA[id]['name']
end

function GetVehicleByName(name)
  for i, v in ipairs(VEHICLE_DATA) do
    -- Name
    if string.lower(v['name']) == string.lower(name) then
      return i
    end

    -- Alias
    for _, va in ipairs(VEHICLE_DATA[i]['alias']) do
      if string.lower(va) == string.lower(name) then
        return i
      end
    end
  end

  return 0
end

function GetCountVehicleList()
  return tablelength(VEHICLE_DATA)
end

function GetAllVehiclesList()
  for i, v in ipairs(VEHICLE_DATA) do
    local name = v['name']
    local alias = VEHICLE_DATA[i]['alias'][1]
    local id = i
  end
end

--[[
  Clothing preset
]]
function GetGlotingPresetName(id)
  if CLOTHING_PRESET_DATA[id] == nil then return false end
  return CLOTHING_PRESET_DATA[id]['name']
end

function GetGlotingPresetByName(name)
  for i, v in ipairs(CLOTHING_PRESET_DATA) do
    -- Name
    if string.lower(v['name']) == string.lower(name) then
      return i
    end

    -- Alias
    for _, va in ipairs(CLOTHING_PRESET_DATA[i]['alias']) do
      if string.lower(va) == string.lower(name) then
        return i
      end
    end
  end

  return 0
end

function GetCountGlotingPresetList()
  return tablelength(CLOTHING_PRESET_DATA)
end

function GetAllGlotingPresetList()
  for i, v in ipairs(CLOTHING_PRESET_DATA) do
    local name = v['name']
    local alias = CLOTHING_PRESET_DATA[i]['alias'][1]
    local id = i
  end
end

--[[
  Weapons
]]
function GetWeaponName(id)
  if WEAPON_DATA[id] == nil then return false end
  return WEAPON_DATA[id]['name']
end

function GetWeaponByName(name)
  for i, v in ipairs(WEAPON_DATA) do
    -- Name
    if string.lower(v['name']) == string.lower(name) then
      return i
    end

    -- Alias
    for _, va in ipairs(WEAPON_DATA[i]['alias']) do
      if string.lower(va) == string.lower(name) then
        return i
      end
    end
  end

  return 0
end
