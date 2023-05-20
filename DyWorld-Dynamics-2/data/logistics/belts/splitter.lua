
local DyDs_Entity = "__DyWorld-Dynamics-2__/graphics/entity/"
local DyDs_Icon = "__DyWorld-Dynamics-2__/graphics/icons/"

local DyWorld_Prototype_1a = DyW.Fx.DC("splitter", "splitter", "splitter")
local DyWorld_Prototype_1b = DyW.Fx.DC("item", "splitter", "splitter")
--DyWorld_Prototype_1a.icon = nil
DyWorld_Prototype_1a.speed = (Dy_Tier_Speeds[1] / 480)
DyWorld_Prototype_1a.next_upgrade = "fast-splitter"
DyWorld_Prototype_1a.fast_replaceable_group = "transport-belt"
DyWorld_Prototype_1a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[1])
DyWorld_Prototype_1b.stack_size = 200
DyWorld_Prototype_1b.order = "1"
DyWorld_Prototype_1b.subgroup = DyDs.."transport-splitter"

data:extend({
    DyWorld_Prototype_1a,
    DyWorld_Prototype_1b,
})

local DyWorld_Prototype_2a = DyW.Fx.DC("splitter", "splitter", "fast-splitter")
local DyWorld_Prototype_2b = DyW.Fx.DC("item", "splitter", "fast-splitter")
local DyWorld_Prototype_3a = DyW.Fx.DC("splitter", "splitter", "express-splitter")
local DyWorld_Prototype_3b = DyW.Fx.DC("item", "splitter", "express-splitter")
local DyWorld_Prototype_4a = DyW.Fx.DC("splitter", "splitter", "supreme-splitter")
local DyWorld_Prototype_4b = DyW.Fx.DC("item", "splitter", "supreme-splitter")
local DyWorld_Prototype_5a = DyW.Fx.DC("splitter", "splitter", "insane-splitter")
local DyWorld_Prototype_5b = DyW.Fx.DC("item", "splitter", "insane-splitter")

DyWorld_Prototype_2b.order = "2"
DyWorld_Prototype_3b.order = "3"
DyWorld_Prototype_4b.order = "4"
DyWorld_Prototype_5b.order = "5"
--DyWorld_Prototype_2b.icons[2].tint = Dy_Tier_Colors[2]
--DyWorld_Prototype_3b.icons[2].tint = Dy_Tier_Colors[3]
--DyWorld_Prototype_4b.icons[2].tint = Dy_Tier_Colors[4]
--DyWorld_Prototype_5b.icons[2].tint = Dy_Tier_Colors[5]

--DyWorld_Prototype_2a.icons[2].tint = Dy_Tier_Colors[2]
--DyWorld_Prototype_3a.icons[2].tint = Dy_Tier_Colors[3]
--DyWorld_Prototype_4a.icons[2].tint = Dy_Tier_Colors[4]
--DyWorld_Prototype_5a.icons[2].tint = Dy_Tier_Colors[5]

DyWorld_Prototype_2a.speed = (Dy_Tier_Speeds[2] / 480)
DyWorld_Prototype_2a.next_upgrade = "express-splitter"
DyWorld_Prototype_2a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[2])

DyWorld_Prototype_3a.speed = (Dy_Tier_Speeds[3] / 480)
DyWorld_Prototype_3a.next_upgrade = "supreme-splitter"
DyWorld_Prototype_3a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[3])

DyWorld_Prototype_4a.speed = (Dy_Tier_Speeds[4] / 480)
DyWorld_Prototype_4a.next_upgrade = "insane-splitter"
DyWorld_Prototype_4a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[4])

DyWorld_Prototype_5a.speed = (Dy_Tier_Speeds[5] / 480)
DyWorld_Prototype_5a.next_upgrade = nil
DyWorld_Prototype_5a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[5])

data:extend({
    DyWorld_Prototype_2a,
    DyWorld_Prototype_2b,
    DyWorld_Prototype_3a,
    DyWorld_Prototype_3b,
    DyWorld_Prototype_4a,
    DyWorld_Prototype_4b,
    DyWorld_Prototype_5a,
    DyWorld_Prototype_5b,
})

-- Recipe --
data:extend({
    {
        type = "recipe",
        name = "splitter",
	    --category = "assembling-tier-1",
        --Add_To_Tech = "logistics-2",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "iron-plate", amount = 5},
                {type = "item", name = "transport-belt", amount = 2},
            },
            result = "splitter",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "fast-splitter",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-2",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "fast-transport-belt", amount = 2},
                {type = "item", name = "splitter", amount = 1},
            },
            result = "fast-splitter",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "express-splitter",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-3",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "express-transport-belt", amount = 2},
                {type = "item", name = "fast-splitter", amount = 1},
            },
            result = "express-splitter",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "supreme-splitter",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-4",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "express-transport-belt", amount = 2},
                {type = "item", name = "express-splitter", amount = 1},
            },
            result = "supreme-splitter",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "insane-splitter",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-5",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "supreme-transport-belt", amount = 2},
                {type = "item", name = "supreme-splitter", amount = 1},
            },
            result = "insane-splitter",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
})