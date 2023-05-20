
local DyDs_Entity = "__DyWorld-Dynamics-2__/graphics/entity/"
local DyDs_Icon = "__DyWorld-Dynamics-2__/graphics/icons/"

local DyWorld_Prototype_1a = DyW.Fx.DC("underground-belt", "underground-belt", "underground-belt")
local DyWorld_Prototype_1b = DyW.Fx.DC("item", "underground-belt", "underground-belt")
DyWorld_Prototype_1a.icon = nil
DyWorld_Prototype_1a.max_distance = 10
DyWorld_Prototype_1a.speed = (Dy_Tier_Speeds[1] / 480)
DyWorld_Prototype_1a.next_upgrade = "fast-underground-belt"
DyWorld_Prototype_1a.fast_replaceable_group = "transport-belt"
DyWorld_Prototype_1a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[1])
DyWorld_Prototype_1a.icons = {
	  {
		icon = DyDs_Icon.."under-icon-base.png",
	  },
	  {
		icon = DyDs_Icon.."under-icon-mask.png",
		tint = Dy_Tier_Colors[1],
	  },
	}
DyWorld_Prototype_1a.icon = nil
DyWorld_Prototype_1b.icons = {
	  {
		icon = DyDs_Icon.."under-icon-base.png",
	  },
	  {
		icon = DyDs_Icon.."under-icon-mask.png",
		tint = Dy_Tier_Colors[1],
	  },
	}
DyWorld_Prototype_1b.stack_size = 200
DyWorld_Prototype_1b.order = "1"
DyWorld_Prototype_1b.subgroup = DyDs.."transport-belt-underground"

data:extend({
    DyWorld_Prototype_1a,
    DyWorld_Prototype_1b,
})

local DyWorld_Prototype_2a = DyW.Fx.DC("underground-belt", "underground-belt", "fast-underground-belt")
local DyWorld_Prototype_2b = DyW.Fx.DC("item", "underground-belt", "fast-underground-belt")
local DyWorld_Prototype_3a = DyW.Fx.DC("underground-belt", "underground-belt", "express-underground-belt")
local DyWorld_Prototype_3b = DyW.Fx.DC("item", "underground-belt", "express-underground-belt")
local DyWorld_Prototype_4a = DyW.Fx.DC("underground-belt", "underground-belt", "supreme-underground-belt")
local DyWorld_Prototype_4b = DyW.Fx.DC("item", "underground-belt", "supreme-underground-belt")
local DyWorld_Prototype_5a = DyW.Fx.DC("underground-belt", "underground-belt", "insane-underground-belt")
local DyWorld_Prototype_5b = DyW.Fx.DC("item", "underground-belt", "insane-underground-belt")

DyWorld_Prototype_2b.order = "2"
DyWorld_Prototype_3b.order = "3"
DyWorld_Prototype_4b.order = "4"
DyWorld_Prototype_5b.order = "5"
DyWorld_Prototype_2b.icons[2].tint = Dy_Tier_Colors[2]
DyWorld_Prototype_3b.icons[2].tint = Dy_Tier_Colors[3]
DyWorld_Prototype_4b.icons[2].tint = Dy_Tier_Colors[4]
DyWorld_Prototype_5b.icons[2].tint = Dy_Tier_Colors[5]

DyWorld_Prototype_2a.icons[2].tint = Dy_Tier_Colors[2]
DyWorld_Prototype_3a.icons[2].tint = Dy_Tier_Colors[3]
DyWorld_Prototype_4a.icons[2].tint = Dy_Tier_Colors[4]
DyWorld_Prototype_5a.icons[2].tint = Dy_Tier_Colors[5]

DyWorld_Prototype_2a.speed = (Dy_Tier_Speeds[2] / 480)
DyWorld_Prototype_2a.next_upgrade = "express-underground-belt"
DyWorld_Prototype_2a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[2])
DyWorld_Prototype_2a.max_distance = 15

DyWorld_Prototype_3a.speed = (Dy_Tier_Speeds[3] / 480)
DyWorld_Prototype_3a.next_upgrade = "supreme-underground-belt"
DyWorld_Prototype_3a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[3])
DyWorld_Prototype_3a.max_distance = 20

DyWorld_Prototype_4a.speed = (Dy_Tier_Speeds[4] / 480)
DyWorld_Prototype_4a.next_upgrade = "insane-underground-belt"
DyWorld_Prototype_4a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[4])
DyWorld_Prototype_4a.max_distance = 25

DyWorld_Prototype_5a.speed = (Dy_Tier_Speeds[5] / 480)
DyWorld_Prototype_5a.next_upgrade = nil
DyWorld_Prototype_5a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[5])
DyWorld_Prototype_5a.max_distance = 30

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
        name = "underground-belt",
	    --category = "assembling-tier-1",
        --Add_To_Tech = "logistics-2",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "iron-plate", amount = 5},
                {type = "item", name = "transport-belt", amount = 2},
            },
            result = "underground-belt",
	        result_count = 2,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "fast-underground-belt",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-2",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "underground-belt", amount = 2},
                {type = "item", name = "fast-transport-belt", amount = 5},
            },
            result = "fast-underground-belt",
	        result_count = 2,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "express-underground-belt",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-3",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "fast-underground-belt", amount = 2},
                {type = "item", name = "express-transport-belt", amount = 5},
            },
            result = "express-underground-belt",
	        result_count = 2,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "supreme-underground-belt",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-4",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "express-underground-belt", amount = 2},
                {type = "item", name = "supreme-transport-belt", amount = 5},
            },
            result = "supreme-underground-belt",
	        result_count = 2,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "insane-underground-belt",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-5",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "supreme-underground-belt", amount = 2},
                {type = "item", name = "insane-transport-belt", amount = 5},
            },
            result = "insane-underground-belt",
	        result_count = 2,
	        energy_required = 2,
	        enabled = true,
        },
    },
})