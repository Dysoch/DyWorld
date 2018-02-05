require "data/prefix"

data:extend(
{
  {
    type = "assembling-machine",
    name = dy.."recombiner",
    icon = dyworld_path_icon.."greenhouse.png",
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy.."recombiner"},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    fast_replaceable_group = "assembling-machine",
    crafting_categories = {dy.."recombiner"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.5
    },
    energy_usage = "2500kW", --"25kW",
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
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },
    module_specification =
    {
      module_slots = 5
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
      filename = dyworld_path_entity.."greenhouse.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
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
          shift = {0.2, 0.15}
        }
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },
  {
    type = "item",
    name = dy.."recombiner",
    icon = dyworld_path_icon.."greenhouse.png",
	icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = dy.."assembling-special",
    order = dy.."recombiner",
    place_result = dy.."recombiner",
    stack_size = 20
  },
  {
    type = "recipe",
    name = dy.."recombiner",
    energy_required = 5,
    enabled = true,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "copper-plate", amount = 4},
      {type = "item", name = "stone", amount = 2},
    },
    result = dy.."recombiner"
  },
}
)

