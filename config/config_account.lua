-- new account
_New_account = {
    cash = 500,
    cash_account = 15000,
    health = 100,
    food = 100,
    thirst = 100,
    armor = 50
};

_Inventory_account = {
    weight_character = 30
}
  
_Init_player = {
    location = "bank",
    clothing_preset = 5
};

_Survival = {
    decrease_food = 1,
    decrease_thirst = 1,
};

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
            body = {
                "body_normal_1",
                "body_normal_2",
                "body_normal_3"
            },

            hair = {
                "business",
                "scientist",
                "police_Hair"
            },

            shirt = {
                "formalShirt_1",
                "prison_Guard",
                "prisoner"
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
            body = {
                "Female01",
                "Female02",
                "Female03"
            },

            hair = {
                "Hair01",
                "Hair02",
                "Hair03"
            },

            shirt = {
                "formal",
                "prisoner",
                "prison-Guard"
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
};

_Auto_message_alert = {
    active = true,

    config = {
        timer = 60000*1, -- milisecond (1 min = 60000 milisecond) default - 300000
        type = "info",
        title = "Auto message", 
    },

    message = {
        "press <strong> i </strong> key to know the keys",
        "seconde am msg"
    }
}

-- auto fetch time
_Account_timer = {
    save_account_time = 60000*5 ,-- milisecond (1 min = 60000 milisecond) default - 300000
    decrease_survival_timer = 60000*5 -- milisecond (1 min = 60000 milisecond) default - 300000
};