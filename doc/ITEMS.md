![main logo](https://i.ibb.co/8zHdNXk/Sans-titre-3.png) 

<h1>Items</h1> 

### Features

- Items object oriented
- Check the configuration (on start of the server)
- The whole actions of the players recorded.
- Event system advanced.

**Table of Contents**
WIP

### __Add Items__
 <span style="color:orange">/!\ attention to the coma /!\
1. To create a new file in the folder [*'./items/server/items/'*](https://github.com/coockieHunt/ck_rp/tree/master/items/server/items), name it (<NEW_ITEM_ID>_items.lua).
2. To copy the content inside.
```lua
local item = {
    name = "<name>",
    var = "<var>",
    description = "<items description>",
    model = <model_id>,
    weight = <weight>,
    thumbnail= "<thumn.png>",
    cooldown = {time_use = <time_use>, time_cooldow = <cooldown>}, or false
    color = "<HEXA_CODE>"
}


--[=====[ 
  EVENT
--]=====]

function item:OnCreate(playerId, quantity)
end

function item:OnDestroy(playerId, quantity)
end

function item:OnUse(playerId, quantity)
    return true
end

function item:OnDrop(playerId, quantity)
  drop_item(playerId, item.var, quantity)
end

function item:OnPlayerDeath(playerId, instigator)
end

function item:OnPlayerSpawn(playerId)
end

AddItem(item)
``` 

3.  To configure the item by means of table item [line 1->9]  </br><span style="color:orange">/!\ attention to the coma /!\ :
    - *name* : name dispayed for the players
    - *var* : items’ variable (To use in the package).
    - *description* : the description dispayed in the players’ inventory.
    - *model* : id of the model 3d (Refere to [*wiki*](https://dev.playonset.com/wiki/Objects) or [*advenced list*](https://onsetfreeroam.com/objectsearch/))
    - *weight* : the weigh of the item in the inventory.
    - *cooldown* : time_use = time to use the object, time_cooldown = time between each use. (if this parameter is equal to false, it will have no usage time and colldown.)
    - *tumbnail* : the picture of the item in the inventory.
    - *color* : the color displayed in the description of the item.
    
4. Your object will appear once the server rebooted.

### __Event listener__
- *Oncreate* : To call when the item is created.
    - *playerId* : id of the player.
    - *quantity* : the number of player’s items.
- *OnDestroy* : To call when the item is distroyed.
    - *playerId* : id of the player.
    - *quantity* : the number of player’s items.
- *OnUse* : To call when the item is used. (if this function return false, an alert and send to the players for their information that the object cannot be used)
    - *playerId* : id of the player.
    - *quantity* : the number of player’s items.
- *OnDrop* : To call when the item is put on the floor.
    - *playerId* : id of the player.
    - *quantity* : the number of player’s items.
- *OnPlayerDeath* : To call when the player dies and when he is owning the item.
    - *playerId* : id of the player.
    - *quantity* : the number of player’s items.
- *OnPlayerSpawn* : To call when the player appears and when he is owning the item.
    - *playerId* : id of the player.
    - *quantity* : the number of player’s items.

### __Add Thumbnail__
1.	To create a picture with the format PNG of size 1600x1600 pixels.
2. 	To put the file in the computer file ('./files_client/web/src_img/').
3.	To add the file’s directory in boards which are in the file package.json </br><span style="color:orange">/!\ attention to the coma /!\

thanks to the translator :smiley:
