Request_account = switch {
  ["IfplayerAccountExist"] = "SELECT id FROM accounts WHERE steam_id = '?' LIMIT 1;",
  ["CreatePlayerAccount"] = "INSERT INTO accounts (id, admin, steam_id, health, armor, name, cash, cash_account) VALUES (NULL, '?', '?', '?', '?', '?', '?', '?');",
  ["GetPlayerAccount"] = "SELECT * FROM accounts WHERE steam_id = '?';",
  ["SaveAccount"] = "UPDATE accounts SET cash= ?, cash_account=?, health= ?, armor=?  WHERE steam_id = ? LIMIT 1;",
}

Config_new_account = switch {
  ["cash"] = 500,
  ["cash_account"] = 15000,
  ["health"] = 100,
  ["armor"] = 50,
}

