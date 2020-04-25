function admin_cash(playerId, target, ammount, type, action)
    local data = getplayer(target)

    local new_val = 0
    ammount = tonumber(ammount)

    if type == "cash" then 
        local old_cash = data["cash"]
        local new_cash


        if action == "give" then
            new_val = old_cash + ammount
        else
            new_val = old_cash - ammount
        end
    else
        local old_cash_account = data["cash_account"]
        local new_cash_account 

        if action == "give" then
            new_val = old_cash_account + ammount
        else
            new_val = old_cash_account - ammount
        end
    end

    if new_val < 0 then new_val = 0 end

	AddAdminLog(playerId, GetPlayerName(playerId).." ".. action .." | ammount: ".. ammount .. "  ".. type)

    data[type] = math.floor(new_val)

    SaveAccountPlayer(target, "cash")

end