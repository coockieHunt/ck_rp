
# disclaimer
this code is only in its preamble, a public installation and not recommended
# onset ck role play
privacy package rp coockie
## athor
- *coockie-hunt* - Main dev
- *daryl* - helper
### links
- dicrod : https://discord.gg/7kwfCth
- youtube : https://www.youtube.com/playlist?list=PLHzBb4XCRN45K_v5DZhlpCENPL-BITdX8
### special thank
- dictateurfou - https://github.com/dictateurfou/importer
- vugi99 - https://github.com/vugi99/onset-drift
- FinnCoding - https://github.com/FinnCoding/OnsetRagdoll

### guide
- game officiel doc : https://dev.playonset.com/wiki/Main_Page
- mysql doc : https://dev.mysql.com/doc/

### error codde
- EC001 : server failed to retrieve the user's steam ID.
- EC002 : server failed to retrieve user data on Connection.
- EC003 : server failed to create user profile.
- EC004 : server failed to configure value items nill.
- EC005 : server failed to configure value items not like.
- EC006 : a player does not have a valid kind (clothing)

***installation guide***
1. Create an onset server (doc: https://dev.playonset.com/wiki/DedicatedServer)
2. Setup MariaDB 10.x (http://bit.ly/2tG3bWC)
3. Execute sql request :
```sql
-- --------------------------------------------------------
-- ref:             1.0
-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `onset`;
USE `onset`;

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam_id` varchar(20) DEFAULT NULL,
  `health` smallint(6) DEFAULT 100,
  `armor` smallint(6) DEFAULT 100,
  `food` smallint(11) DEFAULT NULL,
  `thirst` smallint(11) DEFAULT NULL,
  `max_weight` int(11) DEFAULT NULL,
  `cur_weight` int(11) DEFAULT NULL,
  `player_name` varchar(50) DEFAULT NULL,
  `cash` int(11) DEFAULT 0,
  `cash_account` int(11) DEFAULT 0,
  `inventory` longtext DEFAULT '{}',
  `clothing` longtext DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `account_administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `admin_level` int(11) NOT NULL,
  `last_at_admin_state` timestamp NULL DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

```
4. move all file to *"yourserveronset\packages\ck_rp"*
5. update *"server_config"*  :
```lua
	"plugins": [
		"mariadb",
		"ini-plugin"
	],
	"packages": [
		"ck_rp"
	],
```
6. edit sql account *_Mariadb* *"yourserveronset\packages\ck_rp\config\config_systeme.lua"*
```lua
_Mariadb = { 
    host = "127.0.0.1", --sql server
    user = "root", --sql user
    password = "", -- sql password
    database = "onset" -- database name
};
```
7. enjoy

***config guide***
- items : [here](https://github.com/coockieHunt/onset-ck-rp/blob/master/doc/ITEMS.md) 
