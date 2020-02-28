-- ITEM
-- exemple :
    -- item_name = {
    --     name= "dysplay name",
    --     model= 1000,
    --     size= 4,
    --     usable= false,
    --     thumbnail= "../../files_client/web/src/img/energi_drink.png",
    --     type= "drinks"
    --     hand_pos = {8, -3, -8, 0.0, 0, 0}
    -- },
_Items = {
    energy_drinks = {
        name= "energy drinks",
        model= 1296,
        size= 4,
        usable= false,
        thumbnail= "../../files_client/web/src/img/energi_drink.png",
        type= "drinks",
        hand_pos = nil
    },
  
    banana = {
        name= "banana",
        model = 1621,
        size= 4,
        usable= false,
        thumbnail= "../../files_client/web/src/img/banana.png",
        type= "food",
        hand_pos = {x = 8, y = -3, z = -4,  rx = -90,  ry = 0, rz = 0 }
    },

    chips = {
        name= "chips",
        model = 678,
        size= 4,
        usable= false,
        thumbnail= "../../files_client/web/src/img/chips.png",
        type= "food",
        hand_pos = {x = 8, y = -3, z = -4,  rx = 0.0,  ry = 0, rz = 0}
    }
  }
  