function GetClothingNameByVar(gender, type, var)
    for _, v in pairs(__ClothingList) do
        local genderList = v[1]
        local typeList = v[2]
        local varList = v[3]
        local nameList = v[4]

        if(gender == genderList) then
            
            if(type == typeList) then
                if(var == varList) then
                    return nameList
                end
            end
        end
    end

    return false
end