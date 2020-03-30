function SetPlayerClothing(pi)
    local p = getplayer(pi)

    local decode = DecodeClothing(p.clothing)


    local kind
    for k, v in pairs(decode) do
        if v.id == "kind" then
            kind = v.value
        end
    end

    for k, v in pairs(decode) do
        if v.id ~= "kind" and ifSkeletonMeshValid(v.id) then
            setClothing(pi, kind, v.id, v.value)
        end
    end
end
AddCommand("sc", SetPlayerClothing)

function ChangeClothingPlayer(player, target, type, id)
    local p = getplayer(target)

    local decode = DecodeClothing(p.clothing)

    for k, v in pairs(decode) do
        if v.id == type then
            if tonumber(id) == 0 then
                v.value = "none"
            else
                v.value = tonumber(id)
            end
        end
    end

    SaveClothing(target, decode)
end
AddCommand("cc", ChangeClothingPlayer)


function setClothing(target, kind, skeletonMeches, id)
    local list = GetClothingListByKind(kind)
    if list == false then 
        DestroyPlayerData(GetPlayerSteamId(target))
        return KickPlayer(target, "EC006 : your account has a skeleton mesh problem please contact an administrator.")
    end

    list = list[skeletonMeches] 

    if(id ~= "none") then
        local slct = list[tonumber(id)]
        if slct ~= nil then
            CallRemoteEvent(target, "setSkeletalMesh", skeletonMeches, slct['dir'])
        end
    else
        CallRemoteEvent(target, "removeSkeletalMesh", skeletonMeches)
    end
end