

-- Package
_Pacakge = {
    server_folder = "server",
    display_console = true,
    log_file = "log_pacakge.txt",
};

_Import_package = {
    "translate",
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
    CreateNewAccountCar = "SET @ACCOUNT_ID = (SELECT id FROM accounts WHERE steam_id = '?');INSERT INTO account_vehicle (account_id, car_id, plate, color) VALUES (@ACCOUNT_ID, '?', '?', '?');",
    GetAccountCar = "SELECT * FROM account_vehicle WHERE account_id = ?;",
    IfCarExistLicensePlate = "SELECT * FROM account_vehicle WHERE plate = '?';",
};

-- register
_Registe_SkeletalMesh_player = {
    body = "Body",
    hair = "Clothing0",
    shirt = "Clothing1",
    accessory = "Clothing3",
    pants = "Clothing4",
    shoes = "Clothing5"
}