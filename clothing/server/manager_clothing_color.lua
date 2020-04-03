function ChangeClothingColorPlayer(player, target, type, color)
    local p = getplayer(target)

    local decode = DecodeClothing(p.clothing)

    for k, v in pairs(decode["color"]) do
        if v.id == type then
            if string.len(color) >= 1 then 
                v.value = string.sub(color, 2)
                print(color)
            else
                print("empty")
                v.value = 0
            end
        end
    end

    SaveClothing(target, decode)
end
AddCommand("ccc", ChangeClothingColorPlayer)