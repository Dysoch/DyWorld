
data:extend({
    {
        type = "recipe",
        name = "basic-circuit",
        category = DyDs.."assembling-1",
        main_product = "basic-circuit",
        Add_To_Tech = nil,
        normal = {
            ingredients = {
                {type = "item", name = "copper-stick", amount = 1},
                {type = "item", name = "wood", amount = 1},
            },
            results = {
                {type = "item", name = "basic-circuit", amount_min = 3, amount_max = 5, probability = 1},
            },
            main_product = "basic-circuit",
            energy_required = 1,
            enabled = true,
        },
    },
    {
        type = "recipe",
        name = "electronic-circuit",
        category = DyDs.."assembling-1",
        main_product = "electronic-circuit",
        Add_To_Tech = nil,
        normal = {
            ingredients = {
                {type = "item", name = "basic-circuit", amount = 1},
                {type = "item", name = "copper-frame", amount = 1},
            },
            results = {
                {type = "item", name = "electronic-circuit", amount_min = 1, amount_max = 1, probability = 1},
            },
            main_product = "electronic-circuit",
            energy_required = 1,
            enabled = true,
        },
    },
    --[[{
        type = "recipe",
        name = "advanced-circuit",
        category = DyDs.."assembling-2",
        main_product = "electronic-circuit",
        Add_To_Tech = nil,
        normal = {
            ingredients = {
                {type = "item", name = "electronic-circuit", amount = 1},
                {type = "item", name = "tin-cable", amount = 1},
                {type = "item", name = "zinc-stick", amount = 1},
            },
            results = {
                {type = "item", name = "advanced-circuit", amount_min = 1, amount_max = 1, probability = 1},
            },
            main_product = "advanced-circuit",
            energy_required = 1,
            enabled = true,
        },
    },]]--
})