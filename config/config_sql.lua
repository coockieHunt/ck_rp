-- SQL
_Mariadb = { 
    host = "127.0.0.1", 
    user = "root", 
    password = "root", 
    database = "onset"
  };
  
_RequestSql = {
    IfplayerAccountExist = "SELECT id FROM accounts WHERE steam_id = '?' LIMIT 1;",
    CreatePlayerAccount = "INSERT INTO accounts (id, steam_id, health, armor, player_name, cash, cash_account, inventory) VALUES (NULL, '?', '?', '?', '?', '?', '?', '?');",
    GetPlayerAccount = "SELECT accounts.id, steam_id, health, armor, player_name, cash, cash_account, inventory, account_administrator.admin_level FROM account_administrator RIGHT JOIN accounts ON account_administrator.account_id = accounts.id WHERE steam_id = '?';",
    SaveAccount = "UPDATE accounts SET cash= ?, cash_account=?, health= ?, armor=?  WHERE steam_id = ? LIMIT 1;"
};