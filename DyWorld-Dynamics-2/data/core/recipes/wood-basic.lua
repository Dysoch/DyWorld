

data:extend({
    {
        type = "recipe",
        name = "log-wood-1a",
        category = DyDs.."assembling-1",
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
        category = DyDs.."assembling-1",
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
        category = DyDs.."assembling-1",
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
    {
        type = "recipe",
        name = "greenhouse-wood-1a",
        category = DyDs.."farming",
        main_product = "log",
        Add_To_Tech = "biological",
        normal = {
            ingredients = {
                {type = "item", name = "sapling-normal", amount = 1},
                {type = "fluid", name = "water", amount = 250},
            },
            results = {
                {type = "item", name = "log", amount_min = 5, amount_max = 10, probability = 1},
                {type = "item", name = "log-sulfur", amount_min = 1, amount_max = 5, probability = 0.1},
                {type = "item", name = "sapling-normal", amount_min = 1, amount_max = 3, probability = 0.8},
            },
            main_product = "log",
            energy_required = 60,
            enabled = false,
        },
    },
    {
        type = "recipe",
        name = "greenhouse-wood-1b",
        category = DyDs.."farming",
        main_product = "log-sulfur",
        Add_To_Tech = "biological",
        normal = {
            ingredients = {
                {type = "item", name = "sapling-sulfur", amount = 1},
                {type = "fluid", name = "water", amount = 2500},
            },
            results = {
                {type = "item", name = "log-sulfur", amount_min = 5, amount_max = 10, probability = 1},
                {type = "item", name = "log", amount_min = 1, amount_max = 5, probability = 0.1},
                {type = "item", name = "sapling-sulfur", amount_min = 1, amount_max = 3, probability = 0.8},
            },
            main_product = "log-sulfur",
            energy_required = 300,
            enabled = false,
        },
    },
})
