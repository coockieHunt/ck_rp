# onset ck role play
privacy package rp coockie
## athor
- *coockie-hunt* - Main dev
- *daryl* - helper

### special thank
dictateurfou - https://github.com/dictateurfou/importer

### guide
- game officiel doc : https://dev.playonset.com/wiki/Main_Page
- mysql doc : https://dev.mysql.com/doc/

### error codde
- EC001 : server failed to retrieve the user's steam ID.
- EC002 : server failed to retrieve user data on Connection.
- EC003 : server failed to create user profile.

***installation guide***
1. Create an onset server (doc: https://dev.playonset.com/wiki/DedicatedServer)
2. Setup MariaDB 10.x (http://bit.ly/2tG3bWC)
3. Execute ck_rp.sql
4. move file *"ck_rp"* to *"yourserveronset\packages"*
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
6. edit config.lua *"yourserveronset\packages\ck_rp\config"*
7. enjoy

