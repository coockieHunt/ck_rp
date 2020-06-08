function UpdateHitType(playerId, HitType)
    local p = getplayer(playerId)

    p.hit_type = HitType

end
AddRemoteEvent("UpdateHitType", UpdateHitType)
