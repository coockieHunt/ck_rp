-- Package
_Pacakge = {
    server_folder = "server",
    display_console = true,
    log_file = "log_pacakge.txt",
};

_Import_package = {
    "log",
    "character",
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
};

_Gather_animation = {
    animation_id = "PICKUP_LOWER",
    atach_time = 1400,
    detach_time = 1400
}

-- LOG
_Log_color = {
    ['error'] = "F82C00",
    ['warning'] = "E5B100",
    ['info'] = "0438CE",
    ['ok'] = "10CE04"
  };
  
_Log_file = {
    folder = "logs",
    admin = "log_admin.txt",
    login = "log_login.txt",
    commande = "log_commande.txt"
};
    
-- SQL
_Mariadb = { 
    host = "127.0.0.1", 
    user = "root", 
    password = "", 
    database = "onset"
  };
  
_RequestSql = {
    IfplayerAccountExist = "SELECT id FROM accounts WHERE steam_id = '?' LIMIT 1;",
    CreatePlayerAccount = "INSERT INTO accounts (id, steam_id, health, armor, food, thirst, max_weight, cur_weight, player_name, cash, cash_account, inventory) VALUES (NULL, '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?');",
    GetPlayerAccount = "SELECT accounts.id, accounts.* , account_administrator.admin_level FROM account_administrator RIGHT JOIN accounts ON account_administrator.account_id = accounts.id WHERE steam_id = '?';",
    SaveAccount = "UPDATE accounts SET cash= ?, cash_account=?, health= ?, armor=?, food='?', thirst='?', max_weight='?', cur_weight='?', inventory='?' WHERE steam_id = ? LIMIT 1;"
};