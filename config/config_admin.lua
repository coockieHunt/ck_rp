_Dialog_admin = {
    drop_down = {
        car = "car",
        teleport = "teleport",
        inventory = "inventory",
        survival = "survival",
        environment = "environment",
        account = "account",
    };

    section = {
        -- CAR
        car_spawn = {
            name = "spawn",
            level = 1,
            drop_down_id = "car",
            form = {
                {type = "vehicles", id = "car_id", custom = "", name = "cars"},

                {type = "color", id = "color", custom = "", name = "color"},

                {type = "checkbox", id = "boost", custom = "", name = "boost", checked = true},

                {type = "checkbox", id = "AutoMount", custom = "", name = "auto mount", checked = true},
            }
        };

        -- Teleport
        tp_pos = {
            name = "teleport XYZ",
            drop_down_id = "teleport",
            level = 1,
            form = {
                {type = "player", id = "target", custom = "", name = "target"},

                {type = "text", id = "x", custom = "", name = "x"},
                {type = "text", id = "y", custom = "", name = "y"},
                {type = "text", id = "z", custom = "", name = "z"},
            }
        };

        tp_to = {
            name = "teleport to",
            drop_down_id = "teleport",
            level = 1,
            form = {
                {type = "player", id = "main", custom = "", name = "player"},
                {type = "player", id = "to", custom = "", name = "target"},
            }
        };

        tp_preset = {
            name = "teleport preset",
            drop_down_id = "teleport",
            level = 1,
            form = {
                {type = "player", id = "target", custom = "", name = "player"},
                {type = "preset_pos", id = "preset_id", custom = "", name = "preset"},
            }
        };

        -- Iventroy
        weapon = {
            name = "weapon",
            drop_down_id = "inventory",
            level = 1,
            form = {
                {type = "player", id = "target", custom = "", name = "player"},
                {type = "text", id = "ammo", custom = "", name = "ammo amount"},
                {type = "weapons", id = "weapons_id", custom = "", name = "player"},
                {type = "select", id = "slot", custom = "", name = "slot", 
                    options = {
                        slot1 = "1",
                        slot2 = "2",
                        slot3 = "3",
                    }
                },
            }
        };

        give_remove_item = {
            name = "give | remove items",
            drop_down_id = "inventory",
            level = 1,
            form = {
                {type = "player", id = "target", custom = "", name = "player"},
                {type = "text", id = "quantity", custom = "", name = "quantity"},
                {type = "items", id = "item_id", custom = "", name = "items"},
                {type = "select", id = "action", custom = "", name = "action", 
                    options = {
                        give = "give",
                        remove = "remove",
                    }
                },
            }
        };

        -- Survival
        health_armor = {
            name = "health armor",
            drop_down_id = "survival",
            level = 1,
            form = {
                {type = "player", id = "target", custom = "", name = "player"},
                {type = "text", id = "amount", custom = "", name = "amount"},
                {type = "select", id = "type", custom = "", name = "type", 
                    options = {
                        healt = "healt",
                        armor = "armor",
                    }
                },
            }
        };

        food_thirst = {
            name = "food thirst",
            drop_down_id = "survival",
            level = 1,
            form = {
                {type = "player", id = "target", custom = "", name = "player"},
                {type = "text", id = "amount", custom = "", name = "amount"},
                {type = "select", id = "type", custom = "", name = "type", 
                    options = {
                        food = "food",
                        thirst = "thirst",
                    }
                },
            }
        };

        kill = {
            name = "kill",
            drop_down_id = "survival",
            level = 1,
            form = {
                {type = "player", id = "target", custom = "", name = "player"},
            }
        };

        -- Environment
        change_time = {
            name = "time",
            drop_down_id = "environment",
            level = 1,
            form = {
                {type = "text", id = "time", custom = "", name = "time <0 - 24>"},
            }
        };

        -- Account
        cache_remove = {
            name = "cache",
            drop_down_id = "account",
            level = 1,
            form = {
                {type = "spacer", title = "remove cache"},
                {type = "player_cache", id = "target", custom = "", name = "player"},
            }
        };
    }
};