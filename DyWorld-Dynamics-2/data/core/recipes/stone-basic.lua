

data:extend({
{
    type = "recipe",
    name = "limestone-stone-1a",
    category = DyDs.."assembling-1",
    main_product = "stone",
    normal = {
        ingredients = {
            {type = "item", name = "limestone", amount = 1},
        },
        results = {
            {type = "item", name = "stone", amount_min = 1, amount_max = 3, probability = 1},
            {type = "item", name = "stone", amount_min = 10, amount_max = 30, probability = 0.01},
        },
        main_product = "stone",
        energy_required = 2.5,
        enabled = true,
    },
},
})
