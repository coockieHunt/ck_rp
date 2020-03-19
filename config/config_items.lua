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
        weight= 1,
        usable= false,
        thirst = 5,
        food = 0,
        thumbnail= "../../files_client/web/src/img/energi_drink.png",
        type= "drinks",
        hand_pos = {
            drop = nil,
            use = nil
        }
    },
  
    banana = {
        name= "banana",
        description = "Une banane est un fruit comestible - botaniquement une baie",
        model = 1621,
        weight= 1,
        usable= false,
        thirst = 0,
        food = 20,
        thumbnail= "../../files_client/web/src/img/banana.png",
        type= "food",
        hand_pos = {
            drop = {x = 8, y = -3, z = -4,  rx = -90,  ry = 0, rz = 0 },
            use = nil
        }
    },

    chips = {
        name= "chips",
        description = "Les chips ou pommes chips, connues aussi sous le néologisme de croustilles au Canada",
        model = 678,
        weight= 1,
        usable= false,
        thirst = -5,
        food = 6,
        thumbnail= "../../files_client/web/src/img/chips.png",
        type= "food",
        hand_pos = {
            drop = {x = 8, y = -3, z = -4,  rx = 0.0,  ry = 0, rz = 0},
            use = nil
        }
    }
}

_Default_item = {
    hand_pos = {
        drop = {x = 8, y = -3, z = -8,  rx = 0.0,  ry = 0, rz = 0},
        use = {x = 8, y = 0, z = -8,  rx = 0.0,  ry = 0, rz = 0}
    }
}

_Item_type = {
    food = {
        color = "#ffdb4d",
        icon = 'food'
    },

    drinks = {
        color = "#66c2ff",
        icon = 'thirst'
    }
}
  