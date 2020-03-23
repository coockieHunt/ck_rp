
# disclaimer
this code is only in its preamble, a public installation and not recommended
# onset ck role play
privacy package rp coockie
## athor
- *coockie-hunt* - Main dev
- *daryl* - helper

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
6. edit sql account *"yourserveronset\packages\ck_rp\config\config_sql.lua"*
7. enjoy

