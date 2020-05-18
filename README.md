![main logo](https://i.ibb.co/8zHdNXk/Sans-titre-3.png)

# /!\ DICLAMER /!\
This code is only in its preamble, a public installation and not recommended.

If there is a problem after a pacakge update. reset the data bass.
# onset ck role play
## athor
- *coockie-hunt* - Main dev
- *daryl* - helper
### links
- discord : https://discord.gg/7kwfCth
- youtube : https://www.youtube.com/playlist?list=PLHzBb4XCRN45K_v5DZhlpCENPL-BITdX8
### special thank
- dictateurfou - https://github.com/dictateurfou/importer
- vugi99 - https://github.com/vugi99/onset-drift
- FinnCoding - https://github.com/FinnCoding/OnsetRagdoll

### guide
- game officiel doc : https://dev.playonset.com/wiki/Main_Page
- mysql doc : https://dev.mysql.com/doc/

### error codes
- EC001 : server failed to retrieve the user's steam ID.
- EC002 : server failed to retrieve user data on Connection.
- EC003 : server failed to create user profile.
- EC004 : a player has a problem with inventory weight management.

***installation guide***
1. Create an onset server (doc: https://dev.playonset.com/wiki/DedicatedServer)
2. Setup MariaDB 10.x (http://bit.ly/2tG3bWC)
3. Execute sql request :
```sql
-- --------------------------------------------------------
-- ref:             2.0
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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `account_administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `admin_level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_account_administrator_accounts` (`account_id`),
  CONSTRAINT `FK_account_administrator_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam_id` varchar(20) NOT NULL DEFAULT '0',
  `at` timestamp NOT NULL DEFAULT current_timestamp(),
  `end` timestamp NOT NULL DEFAULT current_timestamp(),
  `by` longtext NOT NULL DEFAULT 'none',
  `reason` longtext NOT NULL DEFAULT 'reason long text',
  `active` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `account_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `damage` int(11) DEFAULT 5000,
  `plate` text DEFAULT NULL,
  `color` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_account_vehicle_accounts` (`account_id`),
  CONSTRAINT `FK_account_vehicle_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;


```
4. Move all files to *"yourserveronset\packages\ck_rp"*
5. Update *"server_config"*  :
```lua
	"plugins": [
		"mariadb",
		"ini-plugin"
	],
	"packages": [
		"ck_rp"
	],
```
6. Edit sql account *_Mariadb* *"yourserveronset\packages\ck_rp\config\config_general.lua"*
```lua
_Mariadb = { 
    host = "127.0.0.1", --sql server
    user = "root", --sql user
    password = "", -- sql password
    database = "onset" -- database name
};
```
7. Set first administrator -> https://github.com/coockieHunt/onset-ck-rp/blob/master/doc/ADMIN.md#add-wip
8. Enjoy

***config guide***
- items : [here](https://github.com/coockieHunt/onset-ck-rp/blob/master/doc/ITEMS.md) 
- function : [here](https://github.com/coockieHunt/onset-ck-rp/blob/master/doc/FUNC.md) 
- admin : [here](https://github.com/coockieHunt/onset-ck-rp/blob/master/doc/ADMIN.md) 
