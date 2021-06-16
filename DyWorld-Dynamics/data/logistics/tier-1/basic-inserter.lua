

local DyWorld_Prototype_1 = DyDs_CopyPrototype("inserter", "inserter", "basic-inserter", true)

DyWorld_Prototype_1.max_health = 250
DyWorld_Prototype_1.pickup_position = DyDs_Inserter_Normal_Pickup
DyWorld_Prototype_1.insert_position = DyDs_Inserter_Normal_Insert
DyWorld_Prototype_1.filter_count = 0
DyWorld_Prototype_1.stack = false


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-inserter",
    icon = "__base__/graphics/icons/inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-1",
    order = "2",
    place_result = "basic-inserter",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-inserter",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "basic-inserter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
})

local DyWorld_Prototype_2 = DyDs_CopyPrototype("inserter", "basic-inserter", "basic-inserter-filter", true)

DyWorld_Prototype_2.max_health = 250
DyWorld_Prototype_2.pickup_position = DyDs_Inserter_Normal_Pickup
DyWorld_Prototype_2.insert_position = DyDs_Inserter_Normal_Insert
DyWorld_Prototype_2.filter_count = 2
DyWorld_Prototype_2.stack = false

local DyWorld_Prototype_3 = DyDs_CopyPrototype("inserter", "basic-inserter", "basic-inserter-long", true)

DyWorld_Prototype_3.max_health = 250
DyWorld_Prototype_3.pickup_position = DyDs_Inserter_Long_Pickup
DyWorld_Prototype_3.insert_position = DyDs_Inserter_Long_Insert
DyWorld_Prototype_3.filter_count = 0
DyWorld_Prototype_3.stack = false

local DyWorld_Prototype_4 = DyDs_CopyPrototype("inserter", "basic-inserter", "basic-inserter-long-filter", true)

DyWorld_Prototype_4.max_health = 250
DyWorld_Prototype_4.pickup_position = DyDs_Inserter_Long_Pickup
DyWorld_Prototype_4.insert_position = DyDs_Inserter_Long_Insert
DyWorld_Prototype_4.filter_count = 2
DyWorld_Prototype_4.stack = false


data:extend({
  DyWorld_Prototype_2,
  DyWorld_Prototype_3,
  DyWorld_Prototype_4,
  {
    type = "item",
    name = "basic-inserter-long",
    icon = "__base__/graphics/icons/inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-1",
    order = "3",
    place_result = "basic-inserter-long",
    stack_size = 200,
  },
  {
    type = "item",
    name = "basic-inserter-filter",
    icon = "__base__/graphics/icons/inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-1",
    order = "4",
    place_result = "basic-inserter-filter",
    stack_size = 200,
  },
  {
    type = "item",
    name = "basic-inserter-long-filter",
    icon = "__base__/graphics/icons/inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-1",
    order = "5",
    place_result = "basic-inserter-long-filter",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-inserter-long",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "basic-inserter", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "basic-inserter-long",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "basic-inserter-filter",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "basic-inserter", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "basic-inserter-filter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "basic-inserter-long-filter",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "basic-inserter-filter", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "basic-inserter-long-filter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
})