![main logo](https://i.ibb.co/8zHdNXk/Sans-titre-3.png) 

<h1>Administration</h1> 

![m](https://img.shields.io/badge/Modules-13-green) ![v](https://img.shields.io/badge/Version-2-yellow) 



### Features

- Advanced module manager.
- Automatic module loading.
- Log of each action.
- All the modules necessary for the administration of your server provided at the first start-up.

![admin preview](https://zupimages.net/up/20/18/qrww.png) 

**Table of Contents**

WIP

### __Administrator management__
                
----

#### __add (wip)__
1. Connect once to the server.
2. Disconnect from the server.
3. Shut down the server.
4. Modify end execute this sql request:
- line 1 'steam id' id steam of the player who will become administrator (SET @STEAM_ID = '76561195555555555';)
- line 2 'admin_level' share administrator level (SET @ADMIN_LEVEL = 10;)

```sql
SET @STEAM_ID = 'steam id';
SET @ADMIN_LEVEL = admin_level;

SET @ACCOUNT_ID = (
	SELECT id
	FROM onset.accounts
	WHERE steam_id = @STEAM_ID
);

INSERT INTO onset.account_administrator (account_id, admin_level) VALUES (@ACCOUNT_ID, @ADMIN_LEVEL);
``` 
5. Reconnect to the server
6. Enjoy !!!
----

### add select
Allows you to create a menu that contains modules (Drop down). which makes it easier to find yourself in the interface.

1. Edit this files [*'ck_rp/config/config_admin.lua'*](https://github.com/coockieHunt/onset-ck-rp/blob/master/config/config_admin.lua).

2. Add your select in the tables *module_select*.
```lua
module_select = {
	{id = '<NEW_SELECT_ID>', name = '<NEW_SELECT_NAME>'}
}
```
> #### parameter
>- <NEW_SELECT_ID> : id which will add modules to select (<span style="color:orange">no space</span>).
>- <NEW_SELECT_NAME> : the name that will be displayed in the menu.

----

### Create module
Create a module to add a menu to administrators.

#### prerequisite 
- var module : module variable (<span style="color:orange">no space</span>).
- name module : module name.
- module level : the minimum level for an administrator to use this module.

### Create
1. create a file in the folder  [*'ck_rp/admin/server/modules'*](https://github.com/coockieHunt/onset-ck-rp/tree/master/admin/server/modules) named the <id_module> _modules.lua ( ex:  MyModule_module.lua ).
2. edit the file by adding this module structure :
```lua
local module = {
    name = "<module_name>",
    id = "<module_id>",
    select = "<select_id>",
    level = <admin_level>
}

function module:GetName()
    return module.name
end

function module:GetSelect()
    return module.select
end

function module:GetId()
    return module.id
end

function module:GetLevel()
    return module.level
end

function module:OnBuild()
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
end

AddAdminModule(module)
```

WIP
