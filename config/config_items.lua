-- ITEM
-- exemple :
    -- item_name = {
    --     name= "dysplay name",
    --     model= 1000,
    --     size= 4,
    --     usable= false,
    --     thumbnail= "../../files_client/web/src/img/energi_drink.png",
    --     type= "drinks"
    --     hand_pos = {x = 8, y = -3, z = -4,  rx = 0.0,  ry = 0, rz = 0}
    --      or (for default pos)
    --     hand_pos = nil
    -- },
_Items = {
    energy_drinks = {
        name= "energy drinks",
        description = "Découvrez la nouvelle Boisson Energisante de Coca-Cola, Sans Taurine. Spread Your Positive",
        model= 1296,
        size= 4,
        usable= false,
        third = 5,
        food = 0,
        thumbnail= "../../files_client/web/src/img/energi_drink.png",
        type= "drinks",
        hand_pos = nil
    },
  
    banana = {
        name= "banana",
        description = "Une banane est un fruit comestible - botaniquement une baie",
        model = 1621,
        size= 4,
        usable= false,
        third = 0,
        food = 5,
        thumbnail= "../../files_client/web/src/img/banana.png",
        type= "food",
        hand_pos = {x = 8, y = -3, z = -4,  rx = -90,  ry = 0, rz = 0 }
    },

    chips = {
        name= "chips",
        description = "Les chips ou pommes chips, connues aussi sous le néologisme de croustilles au Canada",
        model = 678,
        size= 4,
        usable= false,
        third = 0,
        food = 6,
        thumbnail= "../../files_client/web/src/img/chips.png",
        type= "food",
        hand_pos = {x = 8, y = -3, z = -4,  rx = 0.0,  ry = 0, rz = 0}
    }
  }
  