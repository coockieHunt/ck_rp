function DecodeInventory(json)
    local inv_decoode = json_decode(json)

    return inv_decoode
end

function EncodeInventory(inv)
    return json_encode(inv)
end

function SaveInventory(playerId, json_inventory)
    local p = getplayer(playerId)

    p:setInventory(json_inventory) 
end