Request_account = switch {
  ["IfplayerAccountExist"] = "SELECT id FROM accounts WHERE steam_id = '?' LIMIT 1;",
  ["CreatePlayerAccount"] = "INSERT INTO accounts (id, admin, steam_id, health, armor, name, cash, cash_account) VALUES (NULL, '?', '?', '?', '?', '?', '?', '?');",
  ["GetPlayerAccount"] = "SELECT accounts.id,admin_level, steam_id, health, armor, player_name, cash, cash_account FROM account_administrator RIGHT JOIN accounts ON account_administrator.account_id = accounts.id WHERE steam_id = '?';",
  ["SaveAccount"] = "UPDATE accounts SET cash= ?, cash_account=?, health= ?, armor=?  WHERE steam_id = ? LIMIT 1;",
}

Config_new_account = switch {
  ["cash"] = 500,
  ["cash_account"] = 15000,
  ["health"] = 100,
  ["armor"] = 50,
}

Config_other_account = switch {
  ["save_time"] = 300000, -- milisecond (1 min = 60000 milisecond) default - 300000
}

mariadb = { 
  host = "127.0.0.1", 
  user = "root", 
  password = "root", 
  database = "onset" 
}

config_pacakge = switch {
  ["config_file"] = "config.lua",
  ["server_folder"] = "server",
  ["display_console"] = true,
  ["log_file"] = "log_pacakge.txt",
}

import_package = switch {
  ["package"] = {
    "log",
    "data",
    "init",
    "account",
    "hub",
    "admin",
    "cmd"
  }
}

Config_init = switch {
  ["location"] = {x = -182821.000000, z = -41675.000000, y = 1160.000000, h = -90},
  ["clothing_preset"] = 1,
}

config_log_color = switch {
  ["error"] = "F82C00",
  ["warning"] = "E5B100",
  ["info"] = "0438CE",
  ["ok"] = "10CE04",
}

config_log_file = switch {
  ["folder"] = "logs",
  ["admin"] = "log_admin.txt",
  ["login"] = "log_login.txt",
  ["commande"] = "log_commande.txt",
}
