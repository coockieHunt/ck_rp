local dialog = {
    id = "info",
    key = "I",
    type = "release",
    dysplay_on_spawn = false,
    view = "ui_info.html",
    z_order = 1,
    frame_rate = 60
}

function dialog:onCreate(playerId, DialogId)
end

function dialog:onOpen(playerId, DialogId)
end

function dialog:OnClose(playerId, DialogId)
end

function dialog:OnLoadComplete(playerId, DialogId)
    ExecWebJs(playerId, DialogId, "addKey('inventory', '".._Key_ui['survival'].."')")
    ExecWebJs(playerId, DialogId, "addKey('interaction', '".._Key_ui['interact'].."')")
end

AddDialog(dialog)