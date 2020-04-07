function GetClothingListByGender(gender)
    if gender == "women" then
        return _Clothing_women
    end

    if gender == "men" then
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

function ifvalueIsGender(gender)
    if gender == "women" or gender == "men" then
        return true
    end

    return false
end


function getPresetClothing(gender, id)
    local rslt = false
    print(ifvalueIsGender(gender)) 
    print(gender) 
    if ifvalueIsGender(gender) then
        if gender == "women" then
            rslt = _Clothing_preset_women[tonumber(id)]
        end
    
        if gender == "men" then
            rslt = _Clothing_preset_men[tonumber(id)]
        end
    end

    if rslt == nil then rslt = false end

    return rslt
end