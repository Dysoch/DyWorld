require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for i=1,Air_Filter_Amount do
data:extend(
{
  {
    type = "assembling-machine",
    name = "air-filter-"..i,
	localised_name = {"looped-name.air-filter", i},
    icons = 
	{
	  {
		icon = dyworld_path_icon.."air-filter-machine.png",
	    tint = Color_Tier[i],
	  },
	},
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "air-filter-"..i},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    max_health = 250 * (i*i),
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    fast_replaceable_group = "air-filter",
    crafting_categories = {dy.."air-filter"},
    crafting_speed = Round((1 * (i + (i/0.5))), 0),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = (-1 * (i*i)),
    },
    energy_usage = math.floor(25 * (i*(i-(0.5/i)))).."W", --"25kW",
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
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-2, 0} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {2, 0} }}
      },
    },
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
      filename = dyworld_path_entity.."air-filter-machine.png",
      priority = "high",
      width = 99,
      height = 102,
      frame_count = 32,
      line_length = 8,
	  tint = Color_Tier[i],
      shift = {0.4, -0.06}
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },
  {
    type = "item",
    name = "air-filter-"..i,
	localised_name = {"looped-name.air-filter", i},
    icons = 
	{
	  {
		icon = dyworld_path_icon.."air-filter-machine.png",
	    tint = Color_Tier[i],
	  },
	},
	icon_size = 32,
    flags = {},
    subgroup = dy.."air-filter",
    order = Order_Tiers[i],
    place_result = "air-filter-"..i,
    stack_size = 50
  },
  {
    type = "recipe",
    name = "air-filter-"..i,
    energy_required = 2.5*i,
    enabled = true,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5*i},
      {type = "item", name = "copper-plate", amount = 4*i},
      {type = "item", name = "stone", amount = 2*i},
    },
    result = "air-filter-"..i
  },
}
)
	local Insert_Recipe = {type = "item", name = "air-filter-"..(i-1), amount = 1}
	if i >= 2 then 
		table.insert(data.raw.recipe["air-filter-"..i].ingredients, Insert_Recipe)
	end
end