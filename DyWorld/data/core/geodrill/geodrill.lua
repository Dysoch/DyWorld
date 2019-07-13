require "data/prefix"

data:extend(
{
  {
    type = "assembling-machine",
    name = dy.."geodrill",
    icons =
	{
	  {
		icon = dyworld_path_icon.."greenhouse.png",
		tint = Color_Tier[3]
	  },
	},
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy.."geodrill"},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    fast_replaceable_group = "geodrill",
    crafting_categories = {dy.."geodrill"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
    },
    energy_usage = "100kW", --"25kW",
    ingredient_count = 25,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
    },
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
      filename = dyworld_path_entity.."greenhouse.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15},
	  tint = Color_Tier[3]
    },
    working_visualisations =
    {
      {
        light = {intensity = 1, size = 6},
        animation =
        {
          filename = dyworld_path_entity.."greenhouse-light.png",
          width = 113,
          height = 91,
          frame_count = 1,
          shift = {0.2, 0.15},
		  tint = Color_Tier[3]
        }
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },
  {
    type = "item",
    name = dy.."geodrill",
    icons =
	{
	  {
		icon = dyworld_path_icon.."greenhouse.png",
		tint = Color_Tier[3]
	  },
	},
	icon_size = 32,
	flags = {},
    subgroup = dy.."assembling-special",
    order = "geodrill",
    place_result = dy.."geodrill",
    stack_size = 50
  },
  {
    type = "recipe",
    name = dy.."geodrill",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "electronic-circuit", amount = 5},
      {type = "item", name = "steel-plate", amount = 25},
      {type = "item", name = "stone", amount = 15},
    },
    result = dy.."geodrill"
  },
}
)

DyWorld_Add_To_Tech("steel-processing", dy.."geodrill")