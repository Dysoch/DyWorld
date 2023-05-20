local DyDs_Entity = "__DyWorld-Dynamics-2__/graphics/entity/"
local DyDs_Icon = "__DyWorld-Dynamics-2__/graphics/icons/"


data.raw.loader["fast-loader"] = nil
data.raw.item["fast-loader"] = nil
data.raw.recipe["fast-loader"] = nil
data.raw.loader["express-loader"] = nil
data.raw.item["express-loader"] = nil
data.raw.recipe["express-loader"] = nil

 -- Entity--
data:extend({
    {
        type = "loader-1x1",
        name = "basic-loader",
        flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
        minable = {mining_time = 0.5, result = "basic-loader"},
        icons = {
            {
                icon = DyDs_Icon.."loader-icon-base.png",
            },
            {
                icon = DyDs_Icon.."loader-icon-mask.png",
                tint = Dy_Tier_Colors[1],
            },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = DyDs.."transport-loader",
        max_health = 170,
        filter_count = 5,
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        animation_speed_coefficient = 32,
        belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[1]),
        container_distance = 1,
        speed = (Dy_Tier_Speeds[1] / 480),
        next_upgrade = "fast-loader",
        fast_replaceable_group = "transport-belt",
        structure_render_layer = "lower-object",
        structure =
        {
            direction_in = {
                sheets = {
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-base.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            shift = { 0.125, 0 }
                        },
                        filename = DyDs_Entity.."lr-loader-base.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        shift = { 0.125, 0 }
                    },
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-mask.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            tint = Dy_Tier_Colors[1],
                            shift = { 0.125, 0 }
                        },
                        filename = DyDs_Entity.."lr-loader-mask.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        tint = Dy_Tier_Colors[1],
                        shift = { 0.125, 0 }
                    },
                },
            },
            direction_out = {
                sheets = {
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-base.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            shift = { 0.125, 0 },
                        },
                        filename = DyDs_Entity.."lr-loader-base.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        shift = { 0.125, 0 },
                    },
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-mask.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            tint = Dy_Tier_Colors[1],
                            shift = { 0.125, 0 },
                            y = 64
                        },
                        filename = DyDs_Entity.."lr-loader-mask.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        tint = Dy_Tier_Colors[1],
                        shift = { 0.125, 0 },
                        y = 32
                    },
                },
            }
        }
    },
    {
        type = "loader-1x1",
        name = "fast-loader",
        flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
        minable = {mining_time = 0.5, result = "fast-loader"},
        icons = {
            {
                icon = DyDs_Icon.."loader-icon-base.png",
            },
            {
                icon = DyDs_Icon.."loader-icon-mask.png",
                tint = Dy_Tier_Colors[2],
            },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = DyDs.."transport-loader",
        max_health = 170,
        filter_count = 5,
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        animation_speed_coefficient = 32,
        belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[2]),
        container_distance = 1,
        speed = (Dy_Tier_Speeds[2] / 480),
        next_upgrade = "express-loader",
        fast_replaceable_group = "transport-belt",
        structure_render_layer = "lower-object",
        structure =
        {
            direction_in = {
                sheets = {
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-base.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            shift = { 0.125, 0 }
                        },
                        filename = DyDs_Entity.."lr-loader-base.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        shift = { 0.125, 0 }
                    },
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-mask.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            tint = Dy_Tier_Colors[2],
                            shift = { 0.125, 0 }
                        },
                        filename = DyDs_Entity.."lr-loader-mask.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        tint = Dy_Tier_Colors[2],
                        shift = { 0.125, 0 }
                    },
                },
            },
            direction_out = {
                sheets = {
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-base.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            shift = { 0.125, 0 },
                        },
                        filename = DyDs_Entity.."lr-loader-base.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        shift = { 0.125, 0 },
                    },
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-mask.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            tint = Dy_Tier_Colors[2],
                            shift = { 0.125, 0 },
                            y = 64
                        },
                        filename = DyDs_Entity.."lr-loader-mask.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        tint = Dy_Tier_Colors[2],
                        shift = { 0.125, 0 },
                        y = 32
                    },
                },
            }
        }
    },
    {
        type = "loader-1x1",
        name = "express-loader",
        flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
        minable = {mining_time = 0.5, result = "express-loader"},
        icons = {
            {
                icon = DyDs_Icon.."loader-icon-base.png",
            },
            {
                icon = DyDs_Icon.."loader-icon-mask.png",
                tint = Dy_Tier_Colors[3],
            },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = DyDs.."transport-loader",
        max_health = 170,
        filter_count = 5,
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        animation_speed_coefficient = 32,
        belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[3]),
        container_distance = 1,
        speed = (Dy_Tier_Speeds[3] / 480),
        next_upgrade = "supreme-loader",
        fast_replaceable_group = "transport-belt",
        structure_render_layer = "lower-object",
        structure =
        {
            direction_in = {
                sheets = {
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-base.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            shift = { 0.125, 0 }
                        },
                        filename = DyDs_Entity.."lr-loader-base.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        shift = { 0.125, 0 }
                    },
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-mask.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            tint = Dy_Tier_Colors[3],
                            shift = { 0.125, 0 }
                        },
                        filename = DyDs_Entity.."lr-loader-mask.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        tint = Dy_Tier_Colors[3],
                        shift = { 0.125, 0 }
                    },
                },
            },
            direction_out = {
                sheets = {
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-base.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            shift = { 0.125, 0 },
                        },
                        filename = DyDs_Entity.."lr-loader-base.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        shift = { 0.125, 0 },
                    },
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-mask.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            tint = Dy_Tier_Colors[3],
                            shift = { 0.125, 0 },
                            y = 64
                        },
                        filename = DyDs_Entity.."lr-loader-mask.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        tint = Dy_Tier_Colors[3],
                        shift = { 0.125, 0 },
                        y = 32
                    },
                },
            }
        }
    },
    {
        type = "loader-1x1",
        name = "supreme-loader",
        flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
        minable = {mining_time = 0.5, result = "supreme-loader"},
        icons = {
            {
                icon = DyDs_Icon.."loader-icon-base.png",
            },
            {
                icon = DyDs_Icon.."loader-icon-mask.png",
                tint = Dy_Tier_Colors[4],
            },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = DyDs.."transport-loader",
        max_health = 170,
        filter_count = 5,
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        animation_speed_coefficient = 32,
        belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[4]),
        container_distance = 1,
        speed = (Dy_Tier_Speeds[4] / 480),
        next_upgrade = "insane-loader",
        fast_replaceable_group = "transport-belt",
        structure_render_layer = "lower-object",
        structure =
        {
            direction_in = {
                sheets = {
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-base.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            shift = { 0.125, 0 }
                        },
                        filename = DyDs_Entity.."lr-loader-base.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        shift = { 0.125, 0 }
                    },
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-mask.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            tint = Dy_Tier_Colors[4],
                            shift = { 0.125, 0 }
                        },
                        filename = DyDs_Entity.."lr-loader-mask.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        tint = Dy_Tier_Colors[4],
                        shift = { 0.125, 0 }
                    },
                },
            },
            direction_out = {
                sheets = {
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-base.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            shift = { 0.125, 0 },
                        },
                        filename = DyDs_Entity.."lr-loader-base.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        shift = { 0.125, 0 },
                    },
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-mask.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            tint = Dy_Tier_Colors[4],
                            shift = { 0.125, 0 },
                            y = 64
                        },
                        filename = DyDs_Entity.."lr-loader-mask.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        tint = Dy_Tier_Colors[4],
                        shift = { 0.125, 0 },
                        y = 32
                    },
                },
            }
        }
    },
    {
        type = "loader-1x1",
        name = "insane-loader",
        flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
        minable = {mining_time = 0.5, result = "insane-loader"},
        icons = {
            {
                icon = DyDs_Icon.."loader-icon-base.png",
            },
            {
                icon = DyDs_Icon.."loader-icon-mask.png",
                tint = Dy_Tier_Colors[5],
            },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = DyDs.."transport-loader",
        max_health = 170,
        filter_count = 5,
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        animation_speed_coefficient = 32,
        belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[5]),
        container_distance = 1,
        speed = (Dy_Tier_Speeds[5] / 480),
        --next_upgrade = "express-loader",
        fast_replaceable_group = "transport-belt",
        structure_render_layer = "lower-object",
        structure =
        {
            direction_in = {
                sheets = {
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-base.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            shift = { 0.125, 0 }
                        },
                        filename = DyDs_Entity.."lr-loader-base.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        shift = { 0.125, 0 }
                    },
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-mask.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            tint = Dy_Tier_Colors[5],
                            shift = { 0.125, 0 }
                        },
                        filename = DyDs_Entity.."lr-loader-mask.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        tint = Dy_Tier_Colors[5],
                        shift = { 0.125, 0 }
                    },
                },
            },
            direction_out = {
                sheets = {
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-base.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            shift = { 0.125, 0 },
                        },
                        filename = DyDs_Entity.."lr-loader-base.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        shift = { 0.125, 0 },
                    },
                    {
                        hr_version = {
                            filename = DyDs_Entity.."hr-loader-mask.png",
                            height = 64,
                            priority = "extra-high",
                            width = 80,
                            scale = 0.5,
                            tint = Dy_Tier_Colors[5],
                            shift = { 0.125, 0 },
                            y = 64
                        },
                        filename = DyDs_Entity.."lr-loader-mask.png",
                        height = 32,
                        priority = "extra-high",
                        width = 40,
                        scale = 1,
                        tint = Dy_Tier_Colors[5],
                        shift = { 0.125, 0 },
                        y = 32
                    },
                },
            }
        }
    },
})

 -- Item--
data:extend({
    {
        type = "item",
        name = "basic-loader",
        icons =
        {
            {
                icon = DyDs_Icon.."loader-icon-base.png",
            },
            {
                icon = DyDs_Icon.."loader-icon-mask.png",
                tint = Dy_Tier_Colors[1],
            },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = DyDs.."transport-loader",
        order = "1",
        place_result = "basic-loader",
        stack_size = 200,
    },
    {
        type = "item",
        name = "fast-loader",
        icons =
        {
            {
                icon = DyDs_Icon.."loader-icon-base.png",
            },
            {
                icon = DyDs_Icon.."loader-icon-mask.png",
                tint = Dy_Tier_Colors[2],
            },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = DyDs.."transport-loader",
        order = "2",
        place_result = "fast-loader",
        stack_size = 200,
    },
    {
        type = "item",
        name = "express-loader",
        icons =
        {
            {
                icon = DyDs_Icon.."loader-icon-base.png",
            },
            {
                icon = DyDs_Icon.."loader-icon-mask.png",
                tint = Dy_Tier_Colors[3],
            },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = DyDs.."transport-loader",
        order = "3",
        place_result = "express-loader",
        stack_size = 200,
    },
    {
        type = "item",
        name = "supreme-loader",
        icons =
        {
            {
                icon = DyDs_Icon.."loader-icon-base.png",
            },
            {
                icon = DyDs_Icon.."loader-icon-mask.png",
                tint = Dy_Tier_Colors[4],
            },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = DyDs.."transport-loader",
        order = "4",
        place_result = "supreme-loader",
        stack_size = 200,
    },
    {
        type = "item",
        name = "insane-loader",
        icons =
        {
            {
                icon = DyDs_Icon.."loader-icon-base.png",
            },
            {
                icon = DyDs_Icon.."loader-icon-mask.png",
                tint = Dy_Tier_Colors[5],
            },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = DyDs.."transport-loader",
        order = "5",
        place_result = "insane-loader",
        stack_size = 200,
    },
})

-- Recipe --
data:extend({
    {
        type = "recipe",
        name = "basic-loader",
	    --category = "assembling-tier-1",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "iron-plate", amount = 3},
            },
            result = "basic-loader",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "fast-loader",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-2",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "basic-loader", amount = 1},
            },
            result = "fast-loader",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "express-loader",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-3",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "fast-loader", amount = 1},
            },
            result = "express-loader",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "supreme-loader",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-4",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "express-loader", amount = 1},
            },
            result = "supreme-loader",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "insane-loader",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-5",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "supreme-loader", amount = 1},
            },
            result = "insane-loader",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
})