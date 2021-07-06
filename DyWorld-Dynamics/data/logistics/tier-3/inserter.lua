

local DyWorld_Prototype_1 = DyDs_CopyPrototype("inserter", "inserter", "advanced-inserter", true)

DyWorld_Prototype_1.max_health = 1500
DyWorld_Prototype_1.pickup_position = DyDs_Inserter_Normal_Pickup
DyWorld_Prototype_1.insert_position = DyDs_Inserter_Normal_Insert
DyWorld_Prototype_1.extension_speed = 0.12
DyWorld_Prototype_1.rotation_speed = 0.056
DyWorld_Prototype_1.filter_count = 0
DyWorld_Prototype_1.stack = true
DyWorld_Prototype_1.platform_picture.sheet.tint = Tier_3
DyWorld_Prototype_1.platform_picture.sheet.hr_version.tint = Tier_3
DyWorld_Prototype_1.hand_base_picture.tint = Tier_3
DyWorld_Prototype_1.hand_base_picture.hr_version.tint = Tier_3
DyWorld_Prototype_1.hand_closed_picture.tint = Tier_3
DyWorld_Prototype_1.hand_closed_picture.hr_version.tint = Tier_3
DyWorld_Prototype_1.hand_open_picture.tint = Tier_3
DyWorld_Prototype_1.hand_open_picture.hr_version.tint = Tier_3


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "advanced-inserter",
    icons = {
	  {
	    icon = "__base__/graphics/icons/inserter.png",
	    tint = Tier_3,
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-3",
    order = "1",
    place_result = "advanced-inserter",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "advanced-inserter",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "control-board-3", amount = 1},
      },
      result = "advanced-inserter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
})

local DyWorld_Prototype_2 = DyDs_CopyPrototype("inserter", "advanced-inserter", "advanced-inserter-filter", true)

DyWorld_Prototype_2.max_health = 1500
DyWorld_Prototype_2.pickup_position = DyDs_Inserter_Normal_Pickup
DyWorld_Prototype_2.insert_position = DyDs_Inserter_Normal_Insert
DyWorld_Prototype_2.filter_count = 4
DyWorld_Prototype_2.stack = true

local DyWorld_Prototype_3 = DyDs_CopyPrototype("inserter", "advanced-inserter", "advanced-inserter-long", true)

DyWorld_Prototype_3.max_health = 1500
DyWorld_Prototype_3.pickup_position = DyDs_Inserter_Long_Pickup
DyWorld_Prototype_3.insert_position = DyDs_Inserter_Long_Insert
DyWorld_Prototype_3.filter_count = 0
DyWorld_Prototype_3.stack = true

local DyWorld_Prototype_4 = DyDs_CopyPrototype("inserter", "advanced-inserter", "advanced-inserter-long-filter", true)

DyWorld_Prototype_4.max_health = 1500
DyWorld_Prototype_4.pickup_position = DyDs_Inserter_Long_Pickup
DyWorld_Prototype_4.insert_position = DyDs_Inserter_Long_Insert
DyWorld_Prototype_4.filter_count = 4
DyWorld_Prototype_4.stack = true

local DyWorld_Prototype_5 = DyDs_CopyPrototype("inserter", "advanced-inserter", "advanced-inserter-far", true)

DyWorld_Prototype_5.max_health = 1500
DyWorld_Prototype_5.pickup_position = DyDs_Inserter_Extra_Long_Pickup
DyWorld_Prototype_5.insert_position = DyDs_Inserter_Extra_Long_Insert
DyWorld_Prototype_5.filter_count = 0
DyWorld_Prototype_5.stack = true

local DyWorld_Prototype_6 = DyDs_CopyPrototype("inserter", "advanced-inserter", "advanced-inserter-far-filter", true)

DyWorld_Prototype_6.max_health = 1500
DyWorld_Prototype_6.pickup_position = DyDs_Inserter_Extra_Long_Pickup
DyWorld_Prototype_6.insert_position = DyDs_Inserter_Extra_Long_Insert
DyWorld_Prototype_6.filter_count = 4
DyWorld_Prototype_6.stack = true


data:extend({
  DyWorld_Prototype_2,
  DyWorld_Prototype_3,
  DyWorld_Prototype_4,
  DyWorld_Prototype_5,
  DyWorld_Prototype_6,
  {
    type = "item",
    name = "advanced-inserter-long",
    icons = {
	  {
	    icon = "__base__/graphics/icons/inserter.png",
	    tint = Tier_3,
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-3",
    order = "3",
    place_result = "advanced-inserter-long",
    stack_size = 200,
  },
  {
    type = "item",
    name = "advanced-inserter-filter",
    icons = {
	  {
	    icon = "__base__/graphics/icons/inserter.png",
	    tint = Tier_3,
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-3",
    order = "4",
    place_result = "advanced-inserter-filter",
    stack_size = 200,
  },
  {
    type = "item",
    name = "advanced-inserter-long-filter",
    icons = {
	  {
	    icon = "__base__/graphics/icons/inserter.png",
	    tint = Tier_3,
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-3",
    order = "5",
    place_result = "advanced-inserter-long-filter",
    stack_size = 200,
  },
  {
    type = "item",
    name = "advanced-inserter-far",
    icons = {
	  {
	    icon = "__base__/graphics/icons/inserter.png",
	    tint = Tier_3,
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-3",
    order = "6",
    place_result = "advanced-inserter-far",
    stack_size = 200,
  },
  {
    type = "item",
    name = "advanced-inserter-far-filter",
    icons = {
	  {
	    icon = "__base__/graphics/icons/inserter.png",
	    tint = Tier_3,
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-3",
    order = "7",
    place_result = "advanced-inserter-far-filter",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "advanced-inserter-long",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 2},
        {type = "item", name = "advanced-inserter", amount = 1},
        {type = "item", name = "control-board-3", amount = 1},
      },
      result = "advanced-inserter-long",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "advanced-inserter-far",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 6},
        {type = "item", name = "advanced-inserter", amount = 1},
        {type = "item", name = "control-board-3", amount = 3},
      },
      result = "advanced-inserter-far",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "advanced-inserter-filter",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 2},
        {type = "item", name = "advanced-inserter", amount = 1},
        {type = "item", name = "control-board-3", amount = 1},
      },
      result = "advanced-inserter-filter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "advanced-inserter-long-filter",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 2},
        {type = "item", name = "advanced-inserter-filter", amount = 1},
        {type = "item", name = "control-board-3", amount = 1},
      },
      result = "advanced-inserter-long-filter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "advanced-inserter-far-filter",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 6},
        {type = "item", name = "advanced-inserter-filter", amount = 1},
        {type = "item", name = "control-board-3", amount = 3},
      },
      result = "advanced-inserter-far-filter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
})