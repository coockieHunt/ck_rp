function drop_cash(player, ammount)
    local x, y, z = GetPlayerLocation(player)
    local ph = GetPlayerHeading(player)
    local Vx, Vy, Vz = GetPlayerForward(player)

    local moneyType = 'medium'

    local money = {
        small = 1499,
        medium = 1501,
        big = 1443
    }

    local obj = CreateObject(money[moneyType], x, y, z)

    SetObjectAttached(obj, ATTACH_PLAYER, player, 8,  -3, -4,  -90,  0, 0 ,"hand_l")
    SetPlayerAnimation(player, _Drop_animation.animation_id)

    Delay(_Gather_animation.atach_time, function()
        DestroyObject(obj)

        local ItemText = CreateText3D("(cash) - ".. ammount, 18,  x + (Vx * 200), y + (Vy * 100), z + 20, 0,0,0)
        local pickup = CreatePickup(money[moneyType], x + (Vx * 200), y + (Vy * 100), z - 50)

        AddItemPickUpList(player, pickup, money[moneyType], ItemText, ammount, "cash")
    end)
end
AddCommand("dm", drop_cash)
