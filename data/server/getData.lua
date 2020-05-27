function GetPosById(id)
    local id = tonumber(id)
    local list = _PosPresetList[id]
    return list
end

function GetPosByVar(var)
    for _, v in ipairs(_PosPresetList) do
       if v.var == var then
        return v
       end
    end

    return false
end

function GetNameVehicleByVar(alias)
    for _, v in ipairs(_CarsList) do
        if v.alias == alias then
         return v.name
        end
     end
 
     return false
end

function GetFuelTankByAlias(alias)
    for _, v in ipairs(_CarsList) do
        if v.alias == alias then
         return v.fuel_tank
        end
     end
 
     return false
end

function GetFuelTankById(id)
    for _, v in ipairs(_CarsList) do
        if v.id == tonumber(id) then
         return v.fuel_tank
        end
     end
 
     return false
end

