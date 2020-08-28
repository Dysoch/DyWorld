require "data/prefix"

data:extend(
{
  {
    type = "assembling-machine",
    name = dy.."blast-furnace",
	icon = dyworld_path_icon.."blast-furnace.png",
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy.."blast-furnace"},
    corpse = "big-remnants",
	collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    crafting_categories = {dy.."blast-furnace"},
    max_health = 1500,
    energy_usage = "150kW",
	crafting_speed = 1,
    module_specification =
    {
      module_slots = 5
    },
    ingredient_count = 25,
    allowed_effects = {"consumption", "speed", "pollution"},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.005
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    animation =
    {
      filename = dyworld_path_entity.."blast-furnace.png",
      priority = "medium",
      width = 212,
      height = 180,
      line_length = 5,
      frame_count = 16,
	  shift = {0.8, 0.18}
    },
	fluid_boxes =
	{
      {
        production_type = "output",
        --pipe_covers = pipecoverspictures(),
        base_area = 5,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-3, 1} }}
      }, 
	  {
        production_type = "output",
        --pipe_covers = pipecoverspictures(),
        base_area = 5,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-3, -1} }}
      }, 
      {
        production_type = "output",
        --pipe_covers = pipecoverspictures(),
        base_area = 5,
        base_level = 1,
        pipe_connections = {{ type="output", position = {3,1} }}
      }, 
	  {
        production_type = "output",
        --pipe_covers = pipecoverspictures(),
        base_area = 5,
        base_level = 1,
        pipe_connections = {{ type="output", position = {3,-1} }}
      }, 
      {
        production_type = "input",
        --pipe_covers = pipecoverspictures(),
        base_area = 5,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, -3} }}
      }, 
	  {
        production_type = "input",
        --pipe_covers = pipecoverspictures(),
        base_area = 5,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1, -3} }}
      }, 
      {
        production_type = "input",
        --pipe_covers = pipecoverspictures(),
        base_area = 5,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1,3} }}
      }, 
	  {
        production_type = "input",
        --pipe_covers = pipecoverspictures(),
        base_area = 5,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1,3} }}
      },
	},
  },
  {
	type = "item",
    name = dy.."blast-furnace",
	icon = dyworld_path_icon.."blast-furnace.png",
	flags = {},
	order = dy.."blast-furnace",
	place_result = dy.."blast-furnace",
	stack_size = 50,
	subgroup = dy.."metal-machines",
  },
  {
   	type = "recipe",
   	name = dy.."blast-furnace",
	energy_required = 10,
    enabled = false,
	ingredients = 
	{ 
	  {"electronic-circuit", 25}, 
	  {"steel-plate", 50}, 
	  {"copper-plate", 20}, 
	  {"iron-plate", 10},
	  {"stone", 50},
	},
   	result = dy.."blast-furnace",
  },
}
)

DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."blast-furnace")
DyWorld_Add_To_Tech(dy.."ore-smelting", "centrifuge")