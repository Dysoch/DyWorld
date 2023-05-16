

-- Main Ore to Ore --
data:extend({
{
    type = "recipe",
    name = "hematite-processing-2",
    category = "centrifuging",
    main_product = "iron-ore",
    Add_To_Tech = "hematite-processing-1",
    normal = {
        ingredients = {
            {type = "item", name = "hematite", amount = 10},
            {type = "fluid", name = "water", amount = 100},
        },
        results = {
            {type = "item", name = "iron-ore", amount_min = 6, amount_max = 6, probability = 1},
            {type = "item", name = "iron-ore-clean", amount_min = 1, amount_max = 2, probability = 1},
            {type = "item", name = "iron-chunk", amount_min = 1, amount_max = 1, probability = 0.5},
        },
        main_product = "iron-ore",
        energy_required = 5,
        enabled = true,
    },
},
{
    type = "recipe",
    name = "hematite-processing-3a",
    category = "centrifuging",
    main_product = "hematite-ground",
    Add_To_Tech = "hematite-processing-2",
    normal = {
        ingredients = {
            {type = "item", name = "hematite", amount = 10},
        },
        results = {
            {type = "item", name = "hematite-ground", amount_min = 10, amount_max = 10, probability = 1},
        },
        main_product = "hematite-ground",
        energy_required = 10,
        enabled = true,
    },
},
{
    type = "recipe",
    name = "hematite-processing-3b",
    category = "centrifuging",
    main_product = "iron-ore-clean",
    Add_To_Tech = "hematite-processing-2",
    normal = {
        ingredients = {
            {type = "item", name = "hematite-ground", amount = 10},
        },
        results = {
            {type = "item", name = "iron-ore", amount_min = 4, amount_max = 4, probability = 1},
            {type = "item", name = "iron-ore-clean", amount_min = 3, amount_max = 6, probability = 1},
            {type = "item", name = "iron-chunk", amount_min = 5, amount_max = 5, probability = 0.5},
        },
        main_product = "iron-ore-clean",
        energy_required = 10,
        enabled = true,
    },
},
})
