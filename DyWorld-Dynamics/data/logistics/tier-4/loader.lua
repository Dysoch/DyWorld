

local DyWorld_Prototype_1 = DyDs_CopyPrototype("loader-1x1", "loader-1x1", "loader-4", true)
DyWorld_Prototype_1.minable = {mining_time = 0.5, result = "loader-4"}
DyWorld_Prototype_1.flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"}
DyWorld_Prototype_1.speed = (120 / 480)
DyWorld_Prototype_1.belt_animation_set = DyWorld_basic_belt_animation_set(Tier_4)
DyWorld_Prototype_1.icon = nil
DyWorld_Prototype_1.next_upgrade = "loader-5"
DyWorld_Prototype_1.fast_replaceable_group = "transport-belt"
DyWorld_Prototype_1.icons = {
	  {
		icon = DyDs_path_icon.."loader-icon-base.png",
	  },
	  {
		icon = DyDs_path_icon.."loader-icon-mask.png",
		tint = Tier_4,
	  },
	}
DyWorld_Prototype_1.structure = {
        direction_in = {
            sheets = {
                {
                    hr_version = {
                        filename = DyDs_path_entity.."hr-loader-base.png",
                        height = 64,
                        priority = "extra-high",
                        width = 80,
                        scale = 0.5,
                        shift = { 0.125, 0 }
                    },
                    filename = DyDs_path_entity.."lr-loader-base.png",
                    height = 32,
                    priority = "extra-high",
                    width = 40,
                    scale = 1,
                    shift = { 0.125, 0 }
                },
                {
                    hr_version = {
                        filename = DyDs_path_entity.."hr-loader-mask.png",
                        height = 64,
                        priority = "extra-high",
                        width = 80,
                        scale = 0.5,
                        tint = Tier_4,
                        shift = { 0.125, 0 }
                    },
                    filename = DyDs_path_entity.."lr-loader-mask.png",
                    height = 32,
                    priority = "extra-high",
                    width = 40,
                    scale = 1,
                    tint = Tier_4,
                    shift = { 0.125, 0 }
                },
            },
        },
        direction_out = {
            sheets = {
                {
                    hr_version = {
                        filename = DyDs_path_entity.."hr-loader-base.png",
                        height = 64,
                        priority = "extra-high",
                        width = 80,
                        scale = 0.5,
                        shift = { 0.125, 0 },
                    },
                    filename = DyDs_path_entity.."lr-loader-base.png",
                    height = 32,
                    priority = "extra-high",
                    width = 40,
                    scale = 1,
                    shift = { 0.125, 0 },
                },
                {
                    hr_version = {
                        filename = DyDs_path_entity.."hr-loader-mask.png",
                        height = 64,
                        priority = "extra-high",
                        width = 80,
                        scale = 0.5,
                        tint = Tier_4,
                        shift = { 0.125, 0 },
                        y = 64
                    },
                    filename = DyDs_path_entity.."lr-loader-mask.png",
                    height = 32,
                    priority = "extra-high",
                    width = 40,
                    scale = 1,
                    tint = Tier_4,
                    shift = { 0.125, 0 },
                    y = 32
                },
            },
        }
    }

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "loader-4",
    icons = 
	{
	  {
		icon = DyDs_path_icon.."loader-icon-base.png",
	  },
	  {
		icon = DyDs_path_icon.."loader-icon-mask.png",
		tint = Tier_4,
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."transport-loader",
    order = "4",
    place_result = "loader-4",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "loader-4",
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "transport-belt-4", amount = 1},
      },
      result = "loader-4",
	  result_count = 1,
	  energy_required = 2,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 4},
        {type = "item", name = "bronze-gear", amount = 3},
        {type = "item", name = "transport-belt-4", amount = 2},
      },
      result = "loader-4",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})