![main logo](https://i.ibb.co/8zHdNXk/Sans-titre-3.png) 

<h1>Administration</h1> 

![m](https://img.shields.io/badge/Modules-13-green) ![v](https://img.shields.io/badge/Version-2-yellow) 



### Features

- Advanced module manager.
- Automatic module loading.
- Log of each action.
- All the modules necessary for the administration of your server provided at the first start-up.



**Table of Contents**

WIP

### Administrator management
                
----

#### add (wip)
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


