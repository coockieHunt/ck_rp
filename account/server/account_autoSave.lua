function OnPackageStart()
    local backup = CreateTimer(function()
        if(tablelength(playerData) > 0) then
            local countSaved = 0
            for key, value in pairs(playerData) do
                if(value.active and value.backup_status) then
                    countSaved = countSaved + 1
                    SaveAccountPlayer(value.id_client)
                end
            end
            
            if countSaved > 0 and auto_backup then print("> Automatic backup account: "..countSaved.." backup") end
        end
    end, _Account_timer.save_account_time)
end
AddEvent("OnPackageStart", OnPackageStart)