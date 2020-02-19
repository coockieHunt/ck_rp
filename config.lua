-- SQL
_Mariadb = { 
  host = "127.0.0.1", 
  user = "root", 
  password = "root", 
  database = "onset"
};

_RequestSql = {
  IfplayerAccountExist = "SELECT id FROM accounts WHERE steam_id = '?' LIMIT 1;",
  CreatePlayerAccount = "INSERT INTO accounts (id, steam_id, health, armor, player_name, cash, cash_account) VALUES (NULL, '?', '?', '?', '?', '?', '?');",
  GetPlayerAccount = "SELECT accounts.id, steam_id, health, armor, player_name, cash, cash_account, account_administrator.admin_level FROM account_administrator RIGHT JOIN accounts ON account_administrator.account_id = accounts.id WHERE steam_id = '?';",
  SaveAccount = "UPDATE accounts SET cash= ?, cash_account=?, health= ?, armor=?  WHERE steam_id = ? LIMIT 1;"
};

-- NEW ACCOUNT
_New_account = {
  cash = 500,
  cash_account = 15000,
  health = 100,
  armor = 50
};

_Init_player = {
  location = {x = -182821.000000, z = -41675.000000, y = 1160.000000, h = -90},
  clothing_preset = 1
};

-- FETCH
_Save_profile = {
  save_account_time = 300000 -- milisecond (1 min = 60000 milisecond) default - 300000
};

-- SYSTEM
_Pacakge = {
  server_folder = "server",
  display_console = true,
  log_file = "log_pacakge.txt",
};

_Import_package = {
    "log",
    "car",
    "data",
    "init",
    "account",
    "survival",
    "admin",
    "utils",
    "cop"
};

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


