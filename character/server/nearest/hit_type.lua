function UpdateHitType(playerId, HitType, HitId)
    local p = getplayer(playerId)
    
    p.hit_type.type = HitType
    p.hit_type.id = HitId
end
AddRemoteEvent("UpdateHitType", UpdateHitType)

function GetHitTypeClient(playerId)
    local p = getplayer(playerId)
    local hit_type = GetHitTypeVar(p.hit_type.type)
    
    if not isnil(hit_type) then 
        return {type = hit_type, id = p.hit_type.id}
    end

    return false
end
