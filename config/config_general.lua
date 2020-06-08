--[[
   SQL
]]
_Mariadb = { 
    host = "127.0.0.1", 
    user = "root", 
    password = "root", 
    database = "onset"
};

--[[
   LANGUAGE
]]
_Language = "english"

--[[
   Console
]]
_Console_debug = {
    package = true,
    config_file = false,
    auto_backup = true
};

--[[
   ACCOUNT
]]
_Spawn_location = "small_diner" -- refer to config_list.lua (_PosPresetList)

_New_account = {
    weight_character = 30,
    cash = 500,
    cash_account = 15000,
    health = 100,
    food = 100,
    thirst = 100,
    armor = 50
}

_Character_creation = {
    form = {
        min_age = 21,
        max_age = 100,
        color = {'pants', "shirt", "hair"},
        rotate_step = 10,
        scene = true;
    },

    clothing = {
        men = {
            body = true,

            hair = {
                "business",
                "scientist",
                "police_Hair"
            },

            shirt = {
                "formalShirt_1",
                "formalShirt_2",
                "us_pullover"
            },

            pants = {
                "cargoPants",
                "denimPants",
                "jeans"
            },

            shoes = {
                "BusinessShoes",
                "NormalShoes",
                "Shoes01"
            }
        },

        women = {
            body = true,

            hair = {
                "Hair01",
                "Hair02",
                "Hair03"
            },

            shirt = {
                "formal",
                "TShirt01",
                "Pullover01"
            },

            pants = {
                "denimPants",
                "formalPants",
                "Pants01"
            },

            shoes = {
                "Shoes03",
                "Shoes05",
                "Shoes06"
            }
        }
    }
}

_Survival = {
    decrease_food = 1,
    decrease_thirst = 1,
}

--[[
   vehicle
]]
_Car = {
    alarm = {
        distance_sound = 2000, -- in milimetre
        volume = 1.0 -- where 1 is 100% volume and 2 is the 200% volume.
    },

    lock_unlock = {
        distance_nearest = 1000, -- in milimetre
        distance_sound = 2000, -- in milimetre
        volume = 1.0 -- where 1 is 100% volume and 2 is the 200% volume.
    },

    engine_beak = {
        distance_sound = 1000,-- in milimetre
        volume = 1.5-- where 1 is 100% volume and 2 is the 200% volume.
    },

    interact = {
        distance = 250
    }
}


--[[
   CHAT
]]
_Chat_account = {
    allow_chat = {
        global = true,
        range = true
    },

    chat_range_dist = 1000, -- in centimeters

    chat_global_commande = "global",
}

--[[
   ENVIRONMENT
]]
_Day_cycle = {
    start_at = 10,
    step_by_refrech = 0.1,
    refrech_time = 60000/4,

    stars_brightness = 1.0,

    multiply = {
        day = 0,
        night = 2
    }
}

--[[
   AUTO MESSAGE
]]
_Auto_message_alert = {
    active = true,

    config = {
        timer = 60000*5,
        type = "info",
        title = "Auto message", 
    },

    message = {
        "press <strong> i </strong> key to know the keys",
        "seconde am msg"
    }
}

--[[
   COP
]]
_Cop_weapon = {
    tazed_time = 6000
}

--[[
   CLOCK
]]
_Account_timer = {
    save_account_time = 60000*5 ,-- milisecond (1 min = 60000 milisecond) default - 300000
    decrease_survival_timer = 60000*5 -- milisecond (1 min = 60000 milisecond) default - 300000
}