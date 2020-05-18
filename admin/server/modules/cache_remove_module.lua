local module = {
    name = "cache",
    id = "cache_remove",
    select = "account",
    level = 1
}

function module:GetName()
    return module.name
end

function module:GetSelect()
    return module.select
end

function module:GetId()
    return module.id
end

function module:GetLevel()
    return module.level
end

-- func
function module:OnBuild()
    AddForm('player_cache', "target", "target", {})
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local target = tonumber(data['target'])

    AddAdminLog(playerId, "admin :"..GetPlayerName(playerId).." remove cache for : " .. GetPlayerName(target))
	SaveAccountPlayer(target)
	local steam_id = GetPlayerSteamId(target)
	KickPlayer(target ,"😨 you were kicked by an administrator who works on your user data 😨" )
	Delay(1000, function()
		DestroyPlayerData(steam_id)
	end)

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
