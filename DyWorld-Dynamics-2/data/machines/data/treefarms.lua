

local DyWorld_Prototype_1 = DyDs_CopyPrototype("mining-drill", "burner-mining-drill", "basic-treefarm", true)
	DyWorld_Prototype_1.resistances = Resist_Tier_1(0.2)
	DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
	DyWorld_Prototype_1.collision_box = {{ -1.4, -1.4}, {1.4, 1.4}}
	DyWorld_Prototype_1.selection_box = {{ -1.5, -1.5}, {1.5, 1.5}}
	DyWorld_Prototype_1.energy_usage = "450W"
	DyWorld_Prototype_1.icon = DyDs_path_icon.."greenhouse.png"
	DyWorld_Prototype_1.icon_size = 32
	DyWorld_Prototype_1.mining_speed = 1
	DyWorld_Prototype_1.radius_visualisation_picture = data.raw["mining-drill"]["electric-mining-drill"].radius_visualisation_picture
	DyWorld_Prototype_1.resource_categories = {"resource-trees"}
	DyWorld_Prototype_1.energy_source.fuel_category = "carbon"
	DyWorld_Prototype_1.energy_source.emissions_per_minute = -10
	DyWorld_Prototype_1.input_fluid_box = data.raw["mining-drill"]["electric-mining-drill"].input_fluid_box
	DyWorld_Prototype_1.input_fluid_box.base_area = 5
	DyWorld_Prototype_1.vector_to_place_result = data.raw["mining-drill"]["electric-mining-drill"].vector_to_place_result
	DyWorld_Prototype_1.resource_searching_radius = data.raw["mining-drill"]["electric-mining-drill"].resource_searching_radius
	DyWorld_Prototype_1.animations.north = {
        layers =
        {
          {
			filename = DyDs_path_entity.."greenhouse.png",
			width = 113,
			height = 91,
			frame_count = 1,
			shift = {0.2, 0.15},
          },
          {
			filename = DyDs_path_entity.."greenhouse-light.png",
			width = 113,
			height = 91,
			frame_count = 1,
			shift = {0.2, 0.15}
          }
        }
      }
	DyWorld_Prototype_1.animations.east = {
        layers =
        {
          {
			filename = DyDs_path_entity.."greenhouse.png",
			width = 113,
			height = 91,
			frame_count = 1,
			shift = {0.2, 0.15},
          },
          {
			filename = DyDs_path_entity.."greenhouse-light.png",
			width = 113,
			height = 91,
			frame_count = 1,
			shift = {0.2, 0.15}
          }
        }
      }
	DyWorld_Prototype_1.animations.south = {
        layers =
        {
          {
			filename = DyDs_path_entity.."greenhouse.png",
			width = 113,
			height = 91,
			frame_count = 1,
			shift = {0.2, 0.15},
          },
          {
			filename = DyDs_path_entity.."greenhouse-light.png",
			width = 113,
			height = 91,
			frame_count = 1,
			shift = {0.2, 0.15}
          }
        }
      }
	DyWorld_Prototype_1.animations.west = {
        layers =
        {
          {
			filename = DyDs_path_entity.."greenhouse.png",
			width = 113,
			height = 91,
			frame_count = 1,
			shift = {0.2, 0.15},
          },
          {
			filename = DyDs_path_entity.."greenhouse-light.png",
			width = 113,
			height = 91,
			frame_count = 1,
			shift = {0.2, 0.15}
          }
        }
      }

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-treefarm",
    icon = DyDs_path_icon.."greenhouse.png",
    icon_size = 32, icon_mipmaps = 4,
    subgroup = DyDs.."burner-machines",
    order = "basic-treefarm",
    place_result = "basic-treefarm",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-treefarm",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-pipe", amount = 1},
        {type = "item", name = "bronze-plate", amount = 4},
        {type = "item", name = "wood", amount = 1},
      },
      result = "basic-treefarm",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-pipe", amount = 5},
        {type = "item", name = "bronze-plate", amount = 80},
        {type = "item", name = "wood", amount = 5},
        {type = "item", name = "limestone", amount = 15},
      },
      result = "basic-treefarm",
	  enabled = false,
	  energy_required = 2,
    },
  },
})