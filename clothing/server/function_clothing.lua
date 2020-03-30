function GetClothingListByKind(kind)
    if kind == "women" then
        return _Clothing_women
    end

    if kind == "men" then
        return _Clothing_men
    end

    return false
end

function ifSkeletonMeshValid(type)
    for k, v in pairs(_Registe_SkeletalMesh_player) do
        if k == type or v == type then
            return true
        end
    end

    return false
end

function ifvalueIsKind(kind)
    if kind == "women" or kind == "men" then
        return true
    end

    return false
end


function getPresetClothing(kind, id)
    local rslt = false

    if ifvalueIsKind(kind) then
        if kind == "women" then
            rslt = _Clothing_preset_women[tonumber(id)]
        end
    
        if kind == "men" then
            rslt = _Clothing_preset_men[tonumber(id)]
        end
    end

    if rslt == nil then rslt = false end

    return rslt
end