

local DyWorld_Prototype_1 = DyDs_CopyPrototype("transport-belt", "express-transport-belt", "transport-belt-5", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("item", "express-transport-belt", "transport-belt-5", true)
DyWorld_Prototype_1.speed = (240 / 480)
DyWorld_Prototype_1.belt_animation_set = DyWorld_basic_belt_animation_set(Tier_5)
DyWorld_Prototype_1.icon = nil
DyWorld_Prototype_1.next_upgrade = nil
DyWorld_Prototype_1.fast_replaceable_group = "transport-belt"
DyWorld_Prototype_1.related_underground_belt = "underground-belt-5"
DyWorld_Prototype_1.icons = {
	  {
		icon = DyDs_path_icon.."belt-icon-base.png",
	  },
	  {
		icon = DyDs_path_icon.."belt-icon-mask.png",
		tint = Tier_5,
	  },
	}
DyWorld_Prototype_2.icon = nil
DyWorld_Prototype_2.icons = {
	  {
		icon = DyDs_path_icon.."belt-icon-base.png",
	  },
	  {
		icon = DyDs_path_icon.."belt-icon-mask.png",
		tint = Tier_5,
	  },
	}
	DyWorld_Prototype_2.stack_size = 200
	DyWorld_Prototype_2.order = "5"
	DyWorld_Prototype_2.subgroup = DyDs.."transport-belt"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "recipe",
    name = "transport-belt-5",
	category = "assembling-tier-5",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 2},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "transport-belt-5",
	  result_count = 2,
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 4},
        {type = "item", name = "bronze-gear", amount = 1},
      },
      result = "transport-belt-5",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})