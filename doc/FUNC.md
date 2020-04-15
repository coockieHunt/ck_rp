# Function api
All of the functions listed here allow you to manage the framework. for added functionality

## Player

*getplayer*
#### Description
retrieves player data as an object
#### syntax
```lua 
getplayer(player)
```
#### Parameters
- **player [int]** (player id)

------------

*SaveAccountPlayer*
#### Description
allows to save the data of an account.
#### syntax
```lua 
SaveAccountPlayer(player, [filter])
```
#### Parameters
- **player [int]** (player id)
- **filter [string]** (save the corresponding data ***[all, inventoy, clothing, surival, cash] ***)


------------

*DestroyPlayerData*
#### Description
destroy all player data in the server cache
#### syntax
```lua 
DestroyPlayerData(steam_id)
```
#### Parameters
- **steam_id [int]** (customer's steam id)

------------

*IfCachedPlayer*
#### Description
check if the player and an existing cache.
#### syntax
```lua 
IfCachedPlayer(player)
```
#### Parameters
- **player [int]** (player id)

## items
*CreateDropItem*
#### Description
create an object on the ground that will be picked up.
#### syntax
```lua 
CreateDropItem(player, item_id, quantity)
```
#### Parameters
- **player [int]** (player id)
- **item_id [int]** (custom id items)
- **quantity [int]** (number item)

------------

*RemoveDropedItem*
#### Description
destroys an object on the ground.
#### syntax
```lua 
RemoveDropedItem(droped_id)
```
#### Parameters
- **droped_id [int]** (custom droped items)


## inventroy
**WIP DOC**




