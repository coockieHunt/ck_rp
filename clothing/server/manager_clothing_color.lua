function ChangeClothingColorPlayer(player, target, type, color)
    local p = getplayer(target)

    local decode = DecodeClothing(p.clothing)

    for k, v in pairs(decode["color"]) do
        if v.id == type then
            v.value = color
        end
    end

    SaveClothing(target, decode)
end
AddCommand("ccc", ChangeClothingColorPlayer)