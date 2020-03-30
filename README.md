
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
- EC006 : a player does not have a valid kind (clothing)

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

***config guide***

1. add item:
in *"config/config_items.lua"*
```lua
item_var = { -- item var
        name= "dysplay", -- dysplay name
        description = "lorem ipsum", -- dysplay descrip item
        model = 795, -- 3d model id (https://dev.playonset.com/wiki/Objects)
        weight= 1, -- weight item
        health = 75, -- added health point to player 'positive value (5) negative (-5) or null (0) are accepted)'
        thirst = 0, -- added thirst point to player 'positive value (5) negative (-5) or null (0) are accepted)'
        food = 0, -- added food point to player 'positive value (5) negative (-5) or null (0) are accepted)'
        usable= "", -- call a function when the object is used
        thumbnail= "../../files_client/web/src/img/first_aid_kit.png", --image display to player
        type= "medic", -- type item
        hand_pos = { -- pos hand during the animation
            drop = {x = 8, y = -3, z = -4,  rx = 0.0,  ry = 0, rz = 0},
            use = false
        }
    }
```

1. add type:
in *"config/config_items.lua"*
```lua
 food = { -- var type
        color = "#ffdb4d", -- color description dysplay
        icon = 'food', -- svg icon
        consume_time = 2000 -- consume time
    },
```