

data:extend({
{
    type = "recipe",
    name = "log-wood-1a",
    --category = "centrifuging",
    main_product = "wood",
    normal = {
        ingredients = {
            {type = "item", name = "log", amount = 1},
        },
        results = {
            {type = "item", name = "wood", amount_min = 2, amount_max = 4, probability = 1},
        },
        main_product = "wood",
        energy_required = 5,
        enabled = true,
    },
},
{
    type = "recipe",
    name = "log-wood-1b",
    --category = "centrifuging",
    main_product = "wood-sulfur",
    normal = {
        ingredients = {
            {type = "item", name = "log-sulfur", amount = 1},
        },
        results = {
            {type = "item", name = "wood", amount_min = 1, amount_max = 1, probability = 0.75},
            {type = "item", name = "wood-sulfur", amount_min = 1, amount_max = 2, probability = 1},
        },
        main_product = "wood-sulfur",
        energy_required = 5,
        enabled = true,
    },
},
{
    type = "recipe",
    name = "log-wood-1c",
    --category = "centrifuging",
    main_product = "wood",
    normal = {
        ingredients = {
            {type = "item", name = "log-dead", amount = 1},
        },
        results = {
            {type = "item", name = "wood", amount_min = 1, amount_max = 1, probability = 0.275},
            {type = "item", name = "wood-sulfur", amount_min = 1, amount_max = 1, probability = 0.1},
        },
        main_product = "wood",
        energy_required = 5,
        enabled = true,
    },
},
})
