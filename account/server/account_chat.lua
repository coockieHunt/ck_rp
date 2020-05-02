AddEvent("OnPlayerChat", function(playerId, text)
    if _Chat_account.allow_chat.range then
        local x, y = GetPlayerLocation(playerId)
        AddPlayerChatRange(x, y, _Chat_account.chat_range_dist, _("on_player_chat_range", '"#43d815"', GetPlayerName(playerId), text))
    else
        AddPlayerChat(playerId, _("chat_not_allow", '"#D76735"', "range"))
    end
end)

function cmd_chat_global(playerId, text)
    if _Chat_account.allow_chat.global then
    	AddPlayerChatAll(_("on_player_chat", '"#43d815"', GetPlayerName(playerId), text))
    else
        AddPlayerChat(playerId, _("chat_not_allow", '"#D76735"', "global"))
    end
end
AddCommand(_Chat_account.chat_global_commande, cmd_chat_global)