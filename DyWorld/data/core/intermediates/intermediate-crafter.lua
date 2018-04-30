require "data/prefix"

data:extend(
{
  {
    type = "furnace",
    name = dy.."intermediate-crafter",
    icons =
	{
	  {
		icon = dyworld_path_icon.."greenhouse.png",
		tint = Color_Tier[5]
	  },
	},
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = dy.."intermediate-crafter"},
    max_health = 1000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    light = {intensity = 1, size = 10},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    module_specification =
    {
      module_slots = 1,
      module_info_icon_shift = {0, 0.8}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {dy.."pcb-crafting", dy.."gear-crafting", dy.."coil-crafting", dy.."cable-crafting"},
    result_inventory_size = 2,
    crafting_speed = 5,
    energy_usage = "100W",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.005
    },
    animation =
    {
      filename = dyworld_path_entity.."greenhouse.png",
      width = 113,
      height = 91,
      frame_count = 1,
      --shift = {0.2, 0.15},
	  tint = Color_Tier[3],
	  scale = 0.3
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
          --shift = {0.2, 0.15},
		  tint = Color_Tier[3],
		  scale = 0.3
        }
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },
  {
    type = "item",
    name = dy.."intermediate-crafter",
    icons =
	{
	  {
		icon = dyworld_path_icon.."greenhouse.png",
		tint = Color_Tier[3]
	  },
	},
	icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = dy.."assembling-special-circuit",
    order = "1",
    place_result = dy.."intermediate-crafter",
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy.."intermediate-crafter",
    energy_required = 1.5,
    enabled = true,
    ingredients =
    {
      {type = "item", name = "electronic-circuit", amount = 2},
      {type = "item", name = "stone", amount = 15},
      {type = "item", name = "iron-plate", amount = 5},
    },
    result = dy.."intermediate-crafter"
  },
}
)