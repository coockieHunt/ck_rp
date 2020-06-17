local dialog = {
    id = "container",
    key = "H",
    type = "press",
    dysplay_on_spawn = false,
    view = "ui_container.html",
    z_order = 2,
    frame_rate = 60
}

function dialog:onCreate(playerId, DialogId)
end

function dialog:onOpen(playerId, DialogId)
    SetupPlayerInv(playerId)
    ShowMouse(playerId, true)
    FreezePlayerInput(playerId, true)
end

function dialog:OnClose(playerId, DialogId)
    ExecWebJs(playerId, DialogId, "ClearInventory();") 
    ShowMouse(playerId, false)
    FreezePlayerInput(playerId, false)
end

function dialog:OnLoadComplete(playerId, DialogId)
end

AddDialog(dialog)

function SetupPlayerInv(playerId)
    local p = getplayer(playerId)

    local inventory_json = p.inventory
    local decode = DecodeInventory(inventory_json)

    for var, quantity in pairs(decode) do
        local item_info = getItemInfo(var)

        if item_info ~= false then
            local thumb_dir = "../../files_client/web/src/img/" .. item_info.thumbnail
            local exec_add_item = string.format(
                'AddItem("%s", "%s", "%s", "%s", "%s", "%s", "%s")', 
                item_info.var,
                item_info.name, 
                quantity, 
                thumb_dir, 
                item_info.color, 
                item_info.description,
                "player"
            )

            ExecWebJs(playerId, dialog.id, exec_add_item)
        end

        
    end
end

function SetupContainer(playerId, id_container)
    local cur_cont = GetContainer(id_container)

    ExecWebJs(playerId, dialog.id, " SetContainerTitle('"..cur_cont.name.."')")
    ExecWebJs(playerId, dialog.id, " SetPlayerTitle('"..GetPlayerName(playerId).."')")
    ExecWebJs(playerId, dialog.id, " SetContainerId('"..id_container.."')")

    local decode = DecodeInventory(cur_cont.items)

    for var, quantity in pairs(decode) do
        local item_info = getItemInfo(var)
        local thumb_dir = "../../files_client/web/src/img/" .. item_info.thumbnail

        local exec_add_item = string.format(
                'AddItem("%s", "%s", "%s", "%s", "%s", "%s", "%s")', 
                item_info.var,
                item_info.name, 
                quantity, 
                thumb_dir, 
                item_info.color, 
                item_info.description,
                "container"
            )

        ExecWebJs(playerId, dialog.id, exec_add_item)
    end
end