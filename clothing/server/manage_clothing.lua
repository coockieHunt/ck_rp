function SetPlayerClothing(pi)
    local p = getplayer(pi)

    local decode = DecodeClothing(p.clothing)


    local kind
    for k, v in pairs(decode["clothing"]) do
        if v.id == "kind" then
            kind = v.value
        end
    end

    for k, v in pairs(decode["clothing"]) do
        if v.id ~= "kind" and ifSkeletonMeshValid(v.id) then
            setClothing(pi, kind, v.id, v.value)
        end
    end
end
AddCommand("sc", SetPlayerClothing)

function ChangeClothingPlayer(player, target, type, id)
    local p = getplayer(target)

    local decode = DecodeClothing(p.clothing)

    for k, v in pairs(decode["clothing"]) do
        if v.id == type then
            v.value = id
        end
    end

    SaveClothing(target, decode)
end
AddCommand("cc", ChangeClothingPlayer)

function ChangeClothingPresetPlayer(player, target, kind, presetId)
    local p = getplayer(target)

    local decode = DecodeClothing(p.clothing)

    local presetTable = getPresetClothing(kind, presetId)

    ChangeClothingPlayer(player, target, "kind", kind)
    for skeletonMeches, id in pairs(presetTable['part']) do
        ChangeClothingPlayer(player, target, skeletonMeches, id)
    end

end
AddCommand("ccp", ChangeClothingPresetPlayer)

function setClothing(target, kind, skeletonMeches, id)
    local list = GetClothingListByKind(kind)
    if list == false then 
        DestroyPlayerData(GetPlayerSteamId(target))
        return KickPlayer(target, "EC006 : your account has a skeleton mesh problem please contact an administrator.")
    end

    list = list[skeletonMeches] 

    if(id ~= 0) then
        local slct = list[tonumber(id)]
        if slct ~= nil then
            CallRemoteEvent(target, "setSkeletalMesh", skeletonMeches, slct['dir'])
        end

    else
        CallRemoteEvent(target, "removeSkeletalMesh", skeletonMeches)
    end
end