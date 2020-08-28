require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for i=1,Metallurgy_Machines_Amount do
data:extend(
{
  {
    type = "furnace",
    name = "forge-stick-"..i,
	localised_name = {"looped-name.forge-stick", i},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/electric-furnace.png",
	    tint = Color_Tier[i],
	  },
	},
	icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "forge-stick-"..i},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    max_health = 250 * (i*i),
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    fast_replaceable_group = "furnace",
    crafting_categories = {dy.."forging-stick"},
    crafting_speed = 0.5 * (i + i),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = (0.05 * (i*i)),
    },
    energy_usage = math.floor(25 * (i*(i-(0.5/i)))).."kW",
    source_inventory_size = 1,
    result_inventory_size = 1,
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
      module_slots = 1 * i
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-base.png",
          priority = "high",
          width = 129,
          height = 100,
          frame_count = 1,
          shift = {0.421875, 0},
	      tint = Color_Tier[i],
          hr_version =
          {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace.png",
            priority = "high",
            width = 239,
            height = 219,
            frame_count = 1,
            shift = util.by_pixel(0.75, 5.75),
	        tint = Color_Tier[i],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
          priority = "high",
          width = 129,
          height = 100,
          frame_count = 1,
          shift = {0.421875, 0},
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-shadow.png",
            priority = "high",
            width = 227,
            height = 171,
            frame_count = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
      }
    },
    working_visualisations =
    {
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
          priority = "high",
          width = 25,
          height = 15,
          frame_count = 12,
          animation_speed = 0.5,
          shift = {0.015625, 0.890625},
          hr_version =
          {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-heater.png",
            priority = "high",
            width = 60,
            height = 56,
            frame_count = 12,
            animation_speed = 0.5,
            shift = util.by_pixel(1.75, 32.75),
            scale = 0.5
          }
        },
        light = {intensity = 0.4, size = 6, shift = {0.0, 1.0}, color = {r = 1.0, g = 1.0, b = 1.0}}
      },
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
          priority = "high",
          width = 19,
          height = 13,
          frame_count = 4,
          animation_speed = 0.5,
          shift = {-0.671875, -0.640625},
	      tint = Color_Tier[i],
          hr_version =
          {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-1.png",
            priority = "high",
            width = 37,
            height = 25,
            frame_count = 4,
            animation_speed = 0.5,
	        tint = Color_Tier[i],
            shift = util.by_pixel(-20.5, -18.5),
            scale = 0.5
          }
        }
      },
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
          priority = "high",
          width = 12,
          height = 9,
          frame_count = 4,
          animation_speed = 0.5,
          shift = {0.0625, -1.234375},
	      tint = Color_Tier[i],
          hr_version =
          {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-2.png",
            priority = "high",
            width = 23,
            height = 15,
            frame_count = 4,
            animation_speed = 0.5,
	        tint = Color_Tier[i],
            shift = util.by_pixel(3.5, -38),
            scale = 0.5
          }
        }
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.7
      },
      apparent_volume = 1.5
    },
  },
  {
    type = "item",
    name = "forge-stick-"..i,
	localised_name = {"looped-name.forge-stick", i},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/electric-furnace.png",
	    tint = Color_Tier[i],
	  },
	},
	icon_size = 64,
    flags = {},
    subgroup = dy.."machine-forger",
    order = Order_Tiers[i],
    place_result = "forge-stick-"..i,
    stack_size = 50
  },
  {
    type = "recipe",
    name = "forge-stick-"..i,
    energy_required = 5*i,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5*i},
      {type = "item", name = "copper-plate", amount = 4*i},
      {type = "item", name = "stone", amount = 2*i},
    },
    result = "forge-stick-"..i
  },
}
)
	local Insert_Recipe = {type = "item", name = "forge-stick-"..(i-1), amount = 1}
	if i >= 2 then 
		table.insert(data.raw.recipe["forge-stick-"..i].ingredients, Insert_Recipe)
	end
end

if data.raw.recipe["forge-stick-1"] then
	data.raw.recipe["forge-stick-1"].ingredients = {
		{type = "item", name = "simple-control-board", amount = 5},
		{type = "item", name = "iron-gear-wheel", amount = 3},
		{type = "item", name = "iron-plate", amount = 20},
	}
end

if data.raw.recipe["forge-stick-2"] then
	data.raw.recipe["forge-stick-2"].ingredients = {
		{type = "item", name = "forge-stick-1", amount = 1},
		{type = "item", name = "frame", amount = 1},
		{type = "item", name = "electronic-control-board", amount = 5},
		{type = "item", name = "steel-gear-wheel", amount = 3},
		{type = "item", name = "lead-plate", amount = 20},
	}
end

if data.raw.recipe["forge-stick-3"] then
	data.raw.recipe["forge-stick-3"].ingredients = {
		{type = "item", name = "forge-stick-2", amount = 1},
		{type = "item", name = "housing", amount = 1},
		{type = "item", name = "advanced-control-board", amount = 5},
		{type = "item", name = "cobalt-gear-wheel", amount = 3},
		{type = "item", name = "electrum-plate", amount = 20},
	}
end

if data.raw.recipe["forge-stick-4"] then
	data.raw.recipe["forge-stick-4"].ingredients = {
		{type = "item", name = "forge-stick-3", amount = 1},
		{type = "item", name = "logistic-unit", amount = 1},
		{type = "item", name = "tough-control-board", amount = 5},
		{type = "item", name = "arditium-gear-wheel", amount = 3},
		{type = "item", name = "stainless-steel-plate", amount = 20},
	}
end

if data.raw.recipe["forge-stick-5"] then
	data.raw.recipe["forge-stick-5"].ingredients = {
		{type = "item", name = "forge-stick-4", amount = 1},
		{type = "item", name = "controller", amount = 1},
		{type = "item", name = "processing-control-board", amount = 5},
		{type = "item", name = "titanium-gear-wheel", amount = 3},
		{type = "item", name = "tungsten-plate", amount = 20},
	}
end