
local DyDs_Entity = "__DyWorld-Dynamics-2__/graphics/entity/"
local DyDs_Icon = "__DyWorld-Dynamics-2__/graphics/icons/"

local DyWorld_Prototype_1a = DyW.Fx.DC("transport-belt", "transport-belt", "transport-belt")
local DyWorld_Prototype_1b = DyW.Fx.DC("item", "transport-belt", "transport-belt")
DyWorld_Prototype_1a.icon = nil
DyWorld_Prototype_1a.related_underground_belt = "underground-belt"
DyWorld_Prototype_1a.speed = (Dy_Tier_Speeds[1] / 480)
DyWorld_Prototype_1a.next_upgrade = "fast-transport-belt"
DyWorld_Prototype_1a.fast_replaceable_group = "transport-belt"
DyWorld_Prototype_1a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[1])
DyWorld_Prototype_1a.icons = {
	  {
		icon = DyDs_Icon.."belt-icon-base.png",
	  },
	  {
		icon = DyDs_Icon.."belt-icon-mask.png",
		tint = Dy_Tier_Colors[1],
	  },
	}
DyWorld_Prototype_1a.icon = nil
DyWorld_Prototype_1b.icons = {
	  {
		icon = DyDs_Icon.."belt-icon-base.png",
	  },
	  {
		icon = DyDs_Icon.."belt-icon-mask.png",
		tint = Dy_Tier_Colors[1],
	  },
	}
DyWorld_Prototype_1b.stack_size = 200
DyWorld_Prototype_1b.order = "1"
DyWorld_Prototype_1b.subgroup = DyDs.."transport-belt"

data:extend({
    DyWorld_Prototype_1a,
    DyWorld_Prototype_1b,
})

local DyWorld_Prototype_2a = DyW.Fx.DC("transport-belt", "transport-belt", "fast-transport-belt")
local DyWorld_Prototype_2b = DyW.Fx.DC("item", "transport-belt", "fast-transport-belt")
local DyWorld_Prototype_3a = DyW.Fx.DC("transport-belt", "transport-belt", "express-transport-belt")
local DyWorld_Prototype_3b = DyW.Fx.DC("item", "transport-belt", "express-transport-belt")
local DyWorld_Prototype_4a = DyW.Fx.DC("transport-belt", "transport-belt", "supreme-transport-belt")
local DyWorld_Prototype_4b = DyW.Fx.DC("item", "transport-belt", "supreme-transport-belt")
local DyWorld_Prototype_5a = DyW.Fx.DC("transport-belt", "transport-belt", "insane-transport-belt")
local DyWorld_Prototype_5b = DyW.Fx.DC("item", "transport-belt", "insane-transport-belt")

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

DyWorld_Prototype_2a.related_underground_belt = "fast-underground-belt"
DyWorld_Prototype_2a.speed = (Dy_Tier_Speeds[2] / 480)
DyWorld_Prototype_2a.next_upgrade = "express-transport-belt"
DyWorld_Prototype_2a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[2])

DyWorld_Prototype_3a.related_underground_belt = "express-underground-belt"
DyWorld_Prototype_3a.speed = (Dy_Tier_Speeds[3] / 480)
DyWorld_Prototype_3a.next_upgrade = "supreme-transport-belt"
DyWorld_Prototype_3a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[3])

--DyWorld_Prototype_4a.related_underground_belt = "supreme-underground-belt"
DyWorld_Prototype_4a.speed = (Dy_Tier_Speeds[4] / 480)
DyWorld_Prototype_4a.next_upgrade = "insane-transport-belt"
DyWorld_Prototype_4a.belt_animation_set = DyWorld_basic_belt_animation_set(Dy_Tier_Colors[4])

--DyWorld_Prototype_5a.related_underground_belt = "insane-underground-belt"
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
        name = "transport-belt",
	    --category = "assembling-tier-1",
        --Add_To_Tech = "logistics-2",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "iron-plate", amount = 5},
            },
            result = "transport-belt",
	        result_count = 5,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "fast-transport-belt",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-2",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "transport-belt", amount = 5},
            },
            result = "fast-transport-belt",
	        result_count = 5,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "express-transport-belt",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-3",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "fast-transport-belt", amount = 5},
            },
            result = "express-transport-belt",
	        result_count = 5,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "supreme-transport-belt",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-4",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "express-transport-belt", amount = 5},
            },
            result = "supreme-transport-belt",
	        result_count = 5,
	        energy_required = 2,
	        enabled = true,
        },
    },
    {
        type = "recipe",
        name = "insane-transport-belt",
	    --category = "assembling-tier-1",
        Add_To_Tech = "logistics-5",
        normal =
        {
            ingredients =
            {
                {type = "item", name = "supreme-transport-belt", amount = 5},
            },
            result = "insane-transport-belt",
	        result_count = 5,
	        energy_required = 2,
	        enabled = true,
        },
    },
})