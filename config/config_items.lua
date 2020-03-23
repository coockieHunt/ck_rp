_Items = {
    energy_drinks = {
        name= "energy drinks",
        description = "Découvrez la nouvelle Boisson Energisante de Coca-Cola, Sans Taurine. Spread Your Positive",
        model= 1296,
        weight= 1,
        usable= false,
        health = 0,
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
        health = 0,
        thirst = 0,
        food = 20,
        usable= false,
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
        health = 0,
        thirst = -5,
        food = 6,
        usable= false,
        thumbnail= "../../files_client/web/src/img/chips.png",
        type= "food",
        hand_pos = {
            drop = {x = 8, y = -3, z = -4,  rx = 0.0,  ry = 0, rz = 0},
            use = nil
        }
    },

    first_aid_kit = {
        name= "first aid kit",
        description = "Le Trousse de secours d’Urgence est une trousse de secours très complète, contenant tout le matériel important de premiers secour.",
        model = 795,
        weight= 1,
        health = 75,
        thirst = 0,
        food = 0,
        usable= false,
        thumbnail= "../../files_client/web/src/img/first_aid_kit.png",
        type= "medic",
        hand_pos = {
            drop = {x = 8, y = -3, z = -4,  rx = 0.0,  ry = 0, rz = 0},
            use = nil
        }
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
    },

    medic = {
        color = "#d85a5a",
        icon = 'heart'
    }
}
  