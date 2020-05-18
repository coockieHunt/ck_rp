local dialog = {
    id = "inventory",
    key = "Tab",
    type = "press",
    dysplay_on_spawn = false,
    view = "ui_inventory.html"
}

function dialog:GetId()
    return dialog.id
end

function dialog:GetKey()
    return dialog.key
end

function dialog:GetDysplayOnSpawn()
    return dialog.dysplay_on_spawn
end

function dialog:GetView()
    return dialog.view
end

function dialog:GetType()
    return dialog.type
end

function dialog:onCreate(playerId, DialogId)
end

function dialog:onOpen(playerId, DialogId)
    ShowMouse(playerId, true)
    FreezePlayerInput(playerId, true)

    CloseDialogClient(playerId, "warning")
    CloseDialogClient(playerId, "alert")

    RefrechInventoryUi(playerId)
    RefrechSurvivalIventoryUi(playerId)
    RefrechCashInventoryUi(playerId)
end

function dialog:OnClose(playerId, DialogId)
    ShowMouse(playerId, false)
    FreezePlayerInput(playerId, false)

    OpenDialogClient(playerId, "warning")
    OpenDialogClient(playerId, "alert")
end

function dialog:OnLoadComplete(playerId, DialogId)
end

AddDialog(dialog)

-- func
function RefrechSurvivalIventoryUi(playerId)
    local DialogId = dialog:GetId()
    local PlayerData = getplayer(playerId)

    local data = {
        food = PlayerData:getFood(),
        thirst = PlayerData:getThirst(),
        health = math.floor(PlayerData:getHealth()),
        armor = math.floor(PlayerData:getArmor()) 
    }

    ExecWebJs(playerId, DialogId, "SetFood('"..data.food.."');")    
    ExecWebJs(playerId, DialogId, "SetThirst('"..data.thirst.."');")
    ExecWebJs(playerId, DialogId, "SetHealth('"..data.health.."');")
    ExecWebJs(playerId, DialogId, "SetArmor('"..data.armor.."');")
end

function RefrechInventoryUi(playerId)
    local DialogId = dialog:GetId()

    -- setup ui
    ExecWebJs(playerId, DialogId, "clearInventory();") 
    ExecWebJs(playerId, DialogId, "HideSidePanel()")

    -- get player
    local p = getplayer(playerId)

    -- get inventory var
    local inventory_json = p.inventory

    -- inventory set item
    local decode = DecodeInventory(inventory_json)
    for var, quantity in pairs(decode) do
        local item_info = getItemInfo(var)

        if item_info ~= false then
            local thumb_dir = "../../files_client/web/src/img/" .. item_info.thumbnail
            local exec_add_item = string.format(
                'AddItem("%s", "%s", "%s", "%s", "%s", "%s")', 
                item_info.var,
                item_info.name, 
                quantity, 
                thumb_dir, 
                item_info.color, 
                item_info.description
            )
            
            ExecWebJs(playerId, DialogId, exec_add_item)
        end
    end

    -- inventory set wheight cur/max
    local max_weight = p.MaxWeight
    local cur_weight = p.CurWeight
    local exec_set_weight =  string.format('SetWeightLift("%s", "%s")', cur_weight, max_weight)
    ExecWebJs(playerId, DialogId, exec_set_weight)
end

function RefrechCashInventoryUi(playerId)
    local DialogId = dialog:GetId()

    local data = getplayer(playerId)

    local cash = math.floor(data:getCash())
    local cash_account = math.floor(data:getCashAccount())

    ExecWebJs(playerId, DialogId, "SetCash('"..cash.."');") 
    ExecWebJs(playerId, DialogId, "SetBank('"..cash_account.."');")
end

