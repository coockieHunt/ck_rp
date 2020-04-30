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

    local MaxWeight = GetInventoryMaxWeight(playerId)
    local CurWeight = CalculateInvWeight(playerId)

    ExecWebJs(playerId, DialogId, "clearInventory();") 
    ExecWebJs(playerId, DialogId, "SetWeightLift('"..CurWeight.."', '"..MaxWeight.."');")
    ExecWebJs(playerId, DialogId, "HideSidePanel()")

    local decode_inventory = GetInventory(playerId)
 
    for key, value in pairs(decode_inventory) do
       local id = value.id
       
       local object = GetItems(id)
       local type = GetItemTypeInfo(id)

       local cmd = string.format(
            "AddItem(%q, %q, %q, %q, %q, %q, %q, %q, %q, %q, %q);",
            value.id,
            object.name, 
            value.quantity,
            object.thumbnail,
            object.type,
            object.thirst,
            object.food,
            object.health,
            object.descrip,
            type.color,
            type.icon
        )

        ExecWebJs(playerId, DialogId, cmd)
    end
end

function RefrechCashInventoryUi(playerId)
    local DialogId = dialog:GetId()

    local data = getplayer(playerId)

    local cash = math.floor(data:getCash())
    local cash_account = math.floor(data:getCashAccount())

    ExecWebJs(playerId, DialogId, "SetCash('"..cash.."');") 
    ExecWebJs(playerId, DialogId, "SetBank('"..cash_account.."');")
end

