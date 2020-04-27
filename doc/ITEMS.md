# Items
Add items end item types

## configurations
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
