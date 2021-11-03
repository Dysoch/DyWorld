

local DyWorld_Prototype_1 = DyDs_CopyPrototype("inserter", "inserter", "basic-inserter", true)

DyWorld_Prototype_1.max_health = 250
DyWorld_Prototype_1.pickup_position = DyDs_Inserter_Normal_Pickup
DyWorld_Prototype_1.insert_position = DyDs_Inserter_Normal_Insert
DyWorld_Prototype_1.filter_count = 0
DyWorld_Prototype_1.stack = false
DyWorld_Prototype_1.platform_picture.sheet.tint = Tier_1
DyWorld_Prototype_1.platform_picture.sheet.hr_version.tint = Tier_1
DyWorld_Prototype_1.hand_base_picture.tint = Tier_1
DyWorld_Prototype_1.hand_base_picture.hr_version.tint = Tier_1
DyWorld_Prototype_1.hand_closed_picture.tint = Tier_1
DyWorld_Prototype_1.hand_closed_picture.hr_version.tint = Tier_1
DyWorld_Prototype_1.hand_open_picture.tint = Tier_1
DyWorld_Prototype_1.hand_open_picture.hr_version.tint = Tier_1
DyWorld_Prototype_1.fast_replaceable_group = "inserter"
DyWorld_Prototype_1.next_upgrade = "normal-inserter"


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-inserter",
    icons = {
	  {
	    icon = DyDs_path_icon_base.."inserter.png",
	    tint = Tier_1,
	  },
	},
    icon_size = 64, 
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
DyWorld_Prototype_2.next_upgrade = "normal-inserter-filter"

local DyWorld_Prototype_3 = DyDs_CopyPrototype("inserter", "basic-inserter", "basic-inserter-long", true)

DyWorld_Prototype_3.max_health = 250
DyWorld_Prototype_3.pickup_position = DyDs_Inserter_Long_Pickup
DyWorld_Prototype_3.insert_position = DyDs_Inserter_Long_Insert
DyWorld_Prototype_3.filter_count = 0
DyWorld_Prototype_3.stack = false
DyWorld_Prototype_3.next_upgrade = "normal-inserter-long"

local DyWorld_Prototype_4 = DyDs_CopyPrototype("inserter", "basic-inserter", "basic-inserter-long-filter", true)

DyWorld_Prototype_4.max_health = 250
DyWorld_Prototype_4.pickup_position = DyDs_Inserter_Long_Pickup
DyWorld_Prototype_4.insert_position = DyDs_Inserter_Long_Insert
DyWorld_Prototype_4.filter_count = 2
DyWorld_Prototype_4.stack = false
DyWorld_Prototype_4.next_upgrade = "normal-inserter-long-filter"


data:extend({
  DyWorld_Prototype_2,
  DyWorld_Prototype_3,
  DyWorld_Prototype_4,
  {
    type = "item",
    name = "basic-inserter-long",
    icons = {
	  {
	    icon = DyDs_path_icon_base.."inserter.png",
	    tint = Tier_1,
	  },
	  {
	    icon = DyDs_path_looped.."inserter-long.png",
	  },
	},
    icon_size = 64,
    subgroup = DyDs.."inserter-tier-1",
    order = "3",
    place_result = "basic-inserter-long",
    stack_size = 200,
  },
  {
    type = "item",
    name = "basic-inserter-filter",
    icons = {
	  {
	    icon = DyDs_path_icon_base.."inserter.png",
	    tint = Tier_1,
	  },
	  {
	    icon = DyDs_path_looped.."inserter-filter.png",
	  },
	},
    icon_size = 64,
    subgroup = DyDs.."inserter-tier-1",
    order = "4",
    place_result = "basic-inserter-filter",
    stack_size = 200,
  },
  {
    type = "item",
    name = "basic-inserter-long-filter",
    icons = {
	  {
	    icon = DyDs_path_icon_base.."inserter.png",
	    tint = Tier_1,
	  },
	  {
	    icon = DyDs_path_looped.."inserter-filter.png",
	  },
	  {
	    icon = DyDs_path_looped.."inserter-long.png",
	  },
	},
    icon_size = 64,
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
      },
      result = "basic-inserter-long-filter",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
})