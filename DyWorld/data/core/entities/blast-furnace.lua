require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

local function Crafting_Speed(i)
	if i == 1 then
		return 1
	elseif i == 2 then
		return 3
	elseif i == 3 then
		return 5.5
	elseif i == 4 then
		return 8
	elseif i == 5 then
		return 15
	end
end

for i=1,Metallurgy_Machines_Amount do
data:extend(
{
  {
    type = "assembling-machine",
    name = "blast-furnace-"..i,
	localised_name = {"looped-name.blast-furnace", i},
	localised_description = {"looped-name.blast-furnace-tp", 500 * i},
    icons = 
	{
	  {
		icon = dyworld_path_icon.."blast-furnace.png",
	    tint = Color_Tier[i],
	  },
	},
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "blast-furnace-"..i},
	collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 250 * (i*i),
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    fast_replaceable_group = "blast-furnace",
    crafting_categories = {dy.."melting"},
    crafting_speed = Crafting_Speed(i),
    energy_source =
    {
      type = "heat",
      max_temperature = 500 * i,
      specific_heat = "1MJ",
      max_transfer = "2GW",
      min_working_temperature = 450 * i,
      minimum_glow_temperature = 250 * i,
      connections =
      {
        {
          position = {2, 2},
          direction = defines.direction.south
        },
        {
          position = {2, 2},
          direction = defines.direction.east
        },
        {
          position = {-2, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.west
        },
        {
          position = {2, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.east
        },
        {
          position = {-2, -2},
          direction = defines.direction.west
        },
        {
          position = {-2, -2},
          direction = defines.direction.north
        },
      },
    },
    energy_usage = math.floor(250 * i).."kW",
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
        --pipe_covers = pipecoverspictures(),
        base_area = 5*i,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-3, 1} }}
      }, 
	  {
        production_type = "output",
        --pipe_covers = pipecoverspictures(),
        base_area = 5*i,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-3, -1} }}
      }, 
      {
        production_type = "output",
        --pipe_covers = pipecoverspictures(),
        base_area = 5*i,
        base_level = 1,
        pipe_connections = {{ type="output", position = {3,1} }}
      }, 
	  {
        production_type = "output",
        --pipe_covers = pipecoverspictures(),
        base_area = 5*i,
        base_level = 1,
        pipe_connections = {{ type="output", position = {3,-1} }}
      }, 
      {
        production_type = "input",
        --pipe_covers = pipecoverspictures(),
        base_area = 5*i,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, -3} }}
      }, 
	  {
        production_type = "input",
        --pipe_covers = pipecoverspictures(),
        base_area = 5*i,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1, -3} }}
      }, 
      {
        production_type = "input",
        --pipe_covers = pipecoverspictures(),
        base_area = 5*i,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1,3} }}
      }, 
	  {
        production_type = "input",
        --pipe_covers = pipecoverspictures(),
        base_area = 5*i,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1,3} }}
      },
	},
    module_specification =
    {
      module_slots = 2*i
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    animation =
    {
      filename = dyworld_path_entity.."blast-furnace.png",
      priority = "medium",
      width = 212,
      height = 180,
      line_length = 5,
      frame_count = 16,
	  shift = {0.8, 0.18},
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
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },
  {
    type = "item",
    name = "blast-furnace-"..i,
	localised_name = {"looped-name.blast-furnace", i},
	localised_description = {"looped-name.blast-furnace-tp", 500 * i},
    icons = 
	{
	  {
		icon = dyworld_path_icon.."blast-furnace.png",
	    tint = Color_Tier[i],
	  },
	},
	icon_size = 32,
    flags = {},
    subgroup = dy.."machine-blasting",
    order = Order_Tiers[i],
    place_result = "blast-furnace-"..i,
    stack_size = 50
  },
  {
    type = "recipe",
    name = "blast-furnace-"..i,
    energy_required = (10*i) + 10,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 15*i},
    },
    result = "blast-furnace-"..i
  },
}
)
	if i >= 2 then 
		local Insert_Recipe = {type = "item", name = "blast-furnace-"..(i-1), amount = 1}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
	end
	if i >= 5 then
		local Insert_Recipe = {type = "item", name = "processing-unit", amount = 15*i}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "neutronium-plate", amount = 40*i}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
		DyWorld_Add_To_Tech("metallurgy-9", "blast-furnace-"..i) 
		DyWorld_Add_To_Tech("metallurgy-9", "caster-"..i) 
		DyWorld_Add_To_Tech("metallurgy-9", "forge-gear-"..i) 
		DyWorld_Add_To_Tech("metallurgy-9", "forge-stick-"..i) 
		DyWorld_Add_To_Tech("metallurgy-9", "forge-cable-"..i) 
	elseif i >= 4 then 
		local Insert_Recipe = {type = "item", name = "processing-unit", amount = 5*i}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "tungsten-plate", amount = 20*i}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
		DyWorld_Add_To_Tech("metallurgy-7", "blast-furnace-"..i)
		DyWorld_Add_To_Tech("metallurgy-7", "caster-"..i) 
		DyWorld_Add_To_Tech("metallurgy-7", "forge-gear-"..i) 
		DyWorld_Add_To_Tech("metallurgy-7", "forge-stick-"..i) 
		DyWorld_Add_To_Tech("metallurgy-7", "forge-cable-"..i) 
	elseif i >= 3 then 
		local Insert_Recipe = {type = "item", name = "advanced-circuit", amount = 25*i}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "invar-plate", amount = 20*i}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
		DyWorld_Add_To_Tech("metallurgy-5", "blast-furnace-"..i)
		DyWorld_Add_To_Tech("metallurgy-5", "caster-"..i) 
		DyWorld_Add_To_Tech("metallurgy-5", "forge-gear-"..i) 
		DyWorld_Add_To_Tech("metallurgy-5", "forge-stick-"..i) 
		DyWorld_Add_To_Tech("metallurgy-5", "forge-cable-"..i) 
	elseif i >= 2 then 
		local Insert_Recipe = {type = "item", name = "advanced-circuit", amount = 10*i}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "bronze-plate", amount = 20*i}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
		DyWorld_Add_To_Tech("metallurgy-3", "blast-furnace-"..i)
		DyWorld_Add_To_Tech("metallurgy-3", "caster-"..i) 
		DyWorld_Add_To_Tech("metallurgy-3", "forge-gear-"..i) 
		DyWorld_Add_To_Tech("metallurgy-3", "forge-stick-"..i) 
		DyWorld_Add_To_Tech("metallurgy-3", "forge-cable-"..i) 
	else
		local Insert_Recipe = {type = "item", name = "electronic-circuit", amount = 15*i}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "lead-plate", amount = 10*i}
		table.insert(data.raw.recipe["blast-furnace-"..i].ingredients, Insert_Recipe)
		DyWorld_Add_To_Tech("metallurgy-1", "blast-furnace-"..i)
		DyWorld_Add_To_Tech("metallurgy-1", "caster-"..i) 
		DyWorld_Add_To_Tech("metallurgy-1", "forge-gear-"..i) 
		DyWorld_Add_To_Tech("metallurgy-1", "forge-stick-"..i) 
		DyWorld_Add_To_Tech("metallurgy-1", "forge-cable-"..i) 
	end
end