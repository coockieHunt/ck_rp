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
};

-- chat
_Chat_account = {
    allow_chat = {
        global = true,
        range = true
    },

    chat_range_dist = 1000, -- in centimeters

    chat_global_commande = "global",
}

-- auto fetch time
_Account_timer = {
    save_account_time = 60000*5 ,-- milisecond (1 min = 60000 milisecond) default - 300000
    decrease_survival_timer = 60000*5 -- milisecond (1 min = 60000 milisecond) default - 300000
};