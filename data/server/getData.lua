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

function GetNameVehicleByVar(var)
    for _, v in ipairs(_CarsList) do
        if v.alias == var then
         return v.name
        end
     end
 
     return false
end
