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
}

-- auto fetch time
_Account_timer = {
    save_account_time = 60000*5 ,-- milisecond (1 min = 60000 milisecond) default - 300000
    decrease_survival_timer = 60000*5 -- milisecond (1 min = 60000 milisecond) default - 300000
};