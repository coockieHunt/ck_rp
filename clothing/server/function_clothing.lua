function GetClothingListByKind(kind)
    local rslt = false

    if kind == "women" then
        rslt = _Clothing_women
    end

    if kind == "men" then
        rslt = _Clothing_men
    end

    return rslt
end

function ifSkeletonMeshValid(type)
    for k, v in pairs(_Registe_SkeletalMesh_player) do
        if k == type or v == type then
            return true
        end
    end

    return false
end