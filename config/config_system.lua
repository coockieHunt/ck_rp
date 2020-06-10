-- Package
_Pacakge = {
    server_folder = "server",
    log_file = "log_pacakge.txt",
};

_Import_package = {
    "translate",
    "sound",
    "log",
    "environment",
    "character",
    "clothing",
    "data",
    "inventory",
    "dialog",
    "items",
    "car",
    "data",
    "init",
    "account",
    "admin",
    "utils",
    "survival",
    "cop"
};

-- VEHICLE
_Vehicle = {
    velocity_cap = 500,
    velocity_decreases_fuel_add = 1,
    normal_decreases_fuel = 1,
}

-- ANIMATION
_Drop_animation = {
    animation_id = "PICKUP_LOWER",
    detach_time = 1400
}

_Gather_animation = {
    animation_id = "PICKUP_LOWER",
    atach_time = 1400,
    detach_time = 1400
}

_Eat_animation = {
    animation_id = "DRINKING",
    atach_time = 1250
}

_Medic_animation = {
    animation_id = "CHECK_EQUIPMENT",
}

-- LOG
_Log_color = {
    ['error'] = "F82C00",
    ['warning'] = "E5B100",
    ['info'] = "0438CE",
    ['ok'] = "10CE04"
  };
  
_Log_file = {
    admin = "log_admin.txt",
    login = "log_login.txt",
    commande = "log_commande.txt"
};
    
-- SQL
_RequestSql = {
    IfplayerAccountExist = "SELECT id FROM accounts WHERE steam_id = '?' LIMIT 1;",
    CheckIfBanAccount = "SELECT * FROM ban WHERE steam_id = '?' AND active = 1 LIMIT 1;",
    CheckIfBanAccountAll = "SELECT * FROM ban WHERE steam_id = '?';",
    SetActiveBanAccount = "UPDATE ban SET active= ? WHERE  id= ?;",
    CreatePlayerAccount = "INSERT INTO accounts (id, steam_id, health, armor, food, thirst, max_weight, cur_weight, player_name, cash, cash_account, inventory, clothing) VALUES (NULL, '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?');",
    GetPlayerAccount = "SELECT accounts.id, accounts.* , account_administrator.admin_level FROM account_administrator RIGHT JOIN accounts ON account_administrator.account_id = accounts.id WHERE steam_id = '?';",
    SaveAccount = "UPDATE accounts SET player_name='?', cash= ?, cash_account=?, health= ?, armor=?, food='?', thirst='?', max_weight='?', cur_weight='?', inventory='?', clothing='?' WHERE steam_id = ? LIMIT 1;",
    SaveAccountClothing = "UPDATE accounts SET clothing='?' WHERE steam_id = ? LIMIT 1;",
    SaveAccountSurvival = "UPDATE accounts SET health= ?, armor=?, food='?', thirst='?' WHERE steam_id = ? LIMIT 1;",
    SaveAccountCash = "UPDATE accounts SET cash= ?, cash_account=?, WHERE steam_id = ? LIMIT 1;",
    SaveAccountInventory = "UPDATE accounts SET max_weight='?', cur_weight='?', inventory='?' WHERE steam_id = ? LIMIT 1;",
    CreateNewAccountCar = "INSERT INTO account_vehicle (account_id, car_id, plate, color, upgrade, otr) VALUES ('?', '?', '?', '?', '?', '?');",
    GetAllAccountCar = "SELECT * FROM account_vehicle WHERE account_id LIKE '?';",
    GetAccountCar = "SELECT * FROM account_vehicle WHERE account_id LIKE '?' AND id = '?';",
    IfCarExistLicensePlate = "SELECT * FROM account_vehicle WHERE plate = '?';",
    StoreCar = "UPDATE account_vehicle SET account_id='?', damage='?', plate ='?',color ='?', fuel='?', upgrade='?' WHERE  id= ?;",
    SetOnTheRoad = "UPDATE account_vehicle SET otr='?' WHERE id='?';",
    SetAllOnTheRoad = "UPDATE account_vehicle SET otr='?';"
};

-- register
_Registe_SkeletalMesh_player = {
    body = "Body",
    hair = "Clothing0",
    shirt = "Clothing1",
    accessory = "Clothing3",
    pants = "Clothing4",
    shoes = "Clothing5"
};

_Registe_HitType = {
    ["1"] = "HIT_AIR",
    ["2"] = "HIT_PLAYER",
    ["3"] = "HIT_VEHICLE",
    ["4"] = "HIT_NPC",
    ["5"] = "HIT_OBJECT",
    ["6"] = "HIT_LANDSCAPE",
    ["7"] = "HIT_WATER",
    ["8"] = "HIT_DOOR"
}