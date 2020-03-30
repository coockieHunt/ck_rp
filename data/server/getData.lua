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

