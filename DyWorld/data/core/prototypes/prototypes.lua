require "data/prefix"

function DyWorld_Recipe(DATA, NMB)
  local result =
  {
    type = "recipe",
    name = dy..DATA.Name,
    energy_required = DATA.Recipe_Craft_Time,
	enabled = DATA.Recipe_Without_Tech,
    ingredients = {},
    result = dy..DATA.Name,
    result_count = DATA.Recipe_Result_Count,
  }
	if DATA.Recipe_Category then
		result.category = DATA.Recipe_Category
	end
	if NMB then
		result.name = dy..DATA.Name..tostring(NMB)
		result.result = dy..DATA.Name..tostring(NMB)
		result.energy_required = DATA.Recipe_Craft_Time * NMB
		if NMB == 1 then
			table.insert(result.ingredients,DATA.Recipe_First_Ingredient)
		else
			table.insert(result.ingredients,{dy..DATA.Name..tostring(NMB-1), 1})
		end
		if NMB >= 6 then
			result.category = "crafting-with-fluid"
		end
	else 
		if DATA.Recipe_Ingredients then
			for _,z in pairs(DATA.Recipe_Ingredients) do
				table.insert(result.ingredients,z)
			end
		end		
	end
  return result
end

function DyWorld_Item(DATA, NMB)
  local result =
  {
    type = "item",
    name = dy..DATA.Name,
    flags = {"goes-to-quickbar"},
    subgroup = dy..DATA.Subgroup,
    stack_size = DATA.Stack or 200,
  }
	if DATA.Item_Place == "quickbar" then
		result.flags = {"goes-to-quickbar"}
	else
		result.flags = {"goes-to-main-inventory"}
	end
	if NMB then
		result.name = dy..DATA.Name..tostring(NMB)
		result.localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))}
		result.order = DATA.Name..tostring(NMB)
		result.icons = {{
			icon = DATA.Icon,
			tint = Color_Tier[NMB]
		}}
	else 
		if DATA.Icons then
			result.icons = DATA.Icons
		elseif DATA.Icon then
			result.icon = DATA.Icon
		end
	end
	if DATA.Entity then
		if NMB then
			result.place_result = dy..DATA.Name..tostring(NMB)
		else
			result.place_result = dy..DATA.Name
		end
	end
	if DATA.Order then
		result.order = DATA.Order
	else
		result.order = DATA.Name
	end
  return result
end

function DyWorld_Item_Ore(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name.."-ore",
	icon = DATA.Icon_1,
    flags = {"goes-to-main-inventory"},
    subgroup = dy.."metal-ore",
    stack_size = DATA.Stack or 200,
	order = DATA.Name,
  }
  return result
end

function DyWorld_Item_Plate(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name.."-plate",
	icon = DATA.Icon_2,
    flags = {"goes-to-main-inventory"},
    subgroup = dy.."metal-plate",
    stack_size = DATA.Stack or 200,
	order = DATA.Name,
  }
  return result
end

function DyWorld_Recipe_Plate(DATA)
  local result =
  {
    type = "recipe",
    name = DATA.Name.."-plate",
    energy_required = 2,
	enabled = false,
	category = "smelting",
    ingredients = {{DATA.Name.."-ore", 1}},
    result = DATA.Name.."-plate",
    result_count = 1,
  }
  return result
end

function DyWorld_Autoplace(DATA)
  local result =
  {
    type = "autoplace-control",
    name = DATA.Name.."-ore",
    richness = true,
    order = DATA.Name.."-ore",
  }
  return result
end

function DyWorld_Noise_Layer(DATA)
  local result =
  {
    type = "noise-layer",
    name = DATA.Name.."-ore",
  }
  return result
end

function DyWorld_Resource(DATA)
  local result =
  {
    type = "resource",
    name = DATA.Name.."-ore",
	icon = DATA.Icon_1,
    flags = {"placeable-neutral"},
    order = DATA.Name.."-ore",
    minable =
    {
      hardness = DATA.Mining_Hardness,
      mining_particle = "stone-particle",
      mining_time = DATA.Mining_Time,
      result = DATA.Name.."-ore",
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      control = DATA.Name.."-ore",
      sharpness = 1,
      richness_multiplier = 1500,
      richness_multiplier_distance_bonus = 30,
      richness_base = 500,
      coverage = 0.01,
      peaks =
      {
        {
          noise_layer = DATA.Name.."-ore",
          noise_octaves_difference = -1.5,
          noise_persistence = 0.3,
        },
      },
      starting_area_size = 600 * 0.008,
      starting_area_amount = 500
    },
    stage_counts = {5000, 3000, 1500, 800, 400, 100, 50, 10},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/iron-ore/iron-ore.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        frame_count = 8,
        variation_count = 8,
		tint = DATA.Tint,
        hr_version = {
          filename = "__base__/graphics/entity/iron-ore/hr-iron-ore.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5,
		  tint = DATA.Tint,
        }
      }
    },
    map_color = DATA.Tint,
  }
  return result
end

function DyWorld_Fluid(DATA)
  local result =
  {
    type = "fluid",
    name = dy..DATA.Name,
    icon = DATA.Icon,
    default_temperature = DATA.Def_Temp,
    max_temperature = DATA.Max_Temp,
    base_color = DATA.Color_Base,
    flow_color = DATA.Color_Flow,
    order = DATA.Name,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false
  }
	if DATA.Barrel then
		result.auto_barrel = true
	end
	if DATA.Gas_Temp then
		result.gas_temperature = DATA.Gas_Temp
	end
	if DATA.Heat_Capacity then
		result.heat_capacity = DATA.Heat_Capacity
	else
		result.heat_capacity = "0.2KJ"
	end
  return result
end

function DyWorld_Technology(DATA, NMB)
  local result =
  {
    type = "technology",
    name = dy..DATA.Name,
    effects =
    {
    },
    prerequisites = {},
    unit =
    {
      count = (DATA.Tech_Count*NMB),
      ingredients =
      {
      },
      time = DATA.Tech_Time
    },
    upgrade = true,
    order = dy..DATA.Name,
  }
	if NMB then
		result.name = dy..DATA.Name..tostring(NMB)
		result.order = dy..DATA.Name..tostring(NMB)
		result.localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))}
		result.order = DATA.Name..tostring(NMB)
		result.icons = {{
			icon = DATA.Tech_Icon,
			tint = Color_Tier[NMB]
		}}
		result.effects = {{type = "unlock-recipe", recipe = dy..DATA.Name..tostring(NMB)}}
		if DATA.Tech_PreReq then
			if NMB == 1 then
				result.prerequisites = {DATA.Tech_PreReq}
			else
				result.prerequisites = {dy..DATA.Name..tostring(NMB-1)}
			end
		end
	else 
		result.icon = DATA.Tech_Icon
		result.effects = {{type = "unlock-recipe", recipe = dy..DATA.Name}}
		if DATA.Tech_PreReq then
			result.prerequisites = {DATA.Tech_PreReq}
		end
	end
	if DATA.Tech_Ingredients then
		for _,z in pairs(DATA.Tech_Ingredients) do
			table.insert(result.unit.ingredients,z)
		end
	end
  return result
end

function DyWorld_Add_To_Tech(TECH, RECIPE)
local result = {type = "unlock-recipe", recipe = RECIPE}
	table.insert(data.raw.technology[TECH].effects, result)
end

function DyWorld_Mining_Tool(DATA, NMB)
  local result =
  {
    type = "mining-tool",
	name = dy..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-axe.png",
		tint = Color_Tier[NMB]
	  }
	},
    flags = {"goes-to-main-inventory"},
    action =
    {
      type="direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
            type = "damage",
            damage = { amount = DATA.Dmg*NMB , type = "physical"}
        }
      }
    },
    durability = DATA.Durability*NMB,
    subgroup = dy.."tools",
    order = dy..DATA.Name..tostring(NMB),
    speed = DATA.Speed*NMB,
    stack_size = DATA.Stack or 200,
  }
  return result
end

function DyWorld_Projectile_1(DATA, NMB)
	local result =
  {
    type = "projectile",
    name = dy..DATA.Name,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = DATA.Dmg_Mod, type = DATA.DmgType}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      tint = DATA.Tint,
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
	}
  }
	if NMB then
		result.name = dy..DATA.Name..NMB
		result.action.action_delivery.target_effects.damage = {amount = (DATA.Dmg_Mod * NMB), type = DATA.DmgType}
	end
	if DATA.Piercing then
		result.name = dy..DATA.Name.."piercing-"..NMB
		result.piercing_damage = (DATA.Dmg_Mod * NMB)
	end
	return result
end

function DyWorld_Projectile_2(DATA, NMB)
	local result =
  {
    type = "projectile",
    name = dy..DATA.Name,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0.05,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
       target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
			damage = {amount = DATA.Dmg_Mod, type = DATA.DmgType}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 5},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = DATA.Tint,
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    },
  }
	if NMB then
		result.name = dy..DATA.Name..NMB
		result.action.action_delivery.target_effects[2].damage = {amount = (DATA.Dmg_Mod * NMB), type = DATA.DmgType}
	end
	if DATA.Piercing then
		result.name = dy..DATA.Name.."piercing-"..NMB
		result.piercing_damage = (DATA.Dmg_Mod * NMB)
	end
  return result
end

function DyWorld_Entity_Solar_Panels(DATA, NMB)
  local result =
  {
    type = "solar-panel",
    name = dy..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/solar-panel.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = (0.2*NMB), mining_time = (0.5*NMB), result = dy..DATA.Name..tostring(NMB)},
    max_health = DATA.Health*NMB,
    corpse = "big-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "solar-panel",
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      filename = "__base__/graphics/entity/solar-panel/solar-panel.png",
      priority = "high",
      width = 104,
      height = 96,
	  tint = Color_Tier[NMB],
    },
    production = (tostring(DATA.Energy*(NMB*1.5))).."kW"
  }
  return result
end

function DyWorld_Entity_Furnace_Burner(DATA, NMB)
  local result =
  {
    type = "furnace",
    name = dy..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/stone-furnace.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = (0.5*NMB), result = dy..DATA.Name..tostring(NMB)},
    max_health = (DATA.Health*NMB),
    corpse = "medium-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    working_sound =
    {
      sound = { filename = "__base__/sound/furnace.ogg", }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    energy_usage = tostring(DATA.Energy).."kW",
    crafting_speed = (DATA.Speed*NMB),
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = DATA.Effectivity,
      fuel_inventory_size = 1,
      emissions = (DATA.Pollution*NMB),
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 5,
          position = {0.0, -0.8},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    animation =
    {
    layers =
      {
        {
        filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
        priority = "extra-high",
        width = 81,
        height = 64,
        frame_count = 1,
        shift = {0.515625, 0.0625},
	    tint = Color_Tier[NMB],
        hr_version = {
          filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace.png",
          priority = "extra-high",
          width = 151,
          height = 146,
          frame_count = 1,
          shift = util.by_pixel(-0.25, 6),
          scale = 0.5,
		  tint = Color_Tier[NMB],
          }
        },
        {
        filename = "__base__/graphics/entity/stone-furnace/stone-furnace-shadow.png",
        priority = "extra-high",
        width = 81,
        height = 64,
        frame_count = 1,
        draw_as_shadow = true,
        shift = {0.515625, 0.0625},
        hr_version = {
          filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace-shadow.png",
          priority = "extra-high",
          width = 164,
          height = 74,
          frame_count = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(14.5, 13),
          scale = 0.5
          }
        }
      }
    },
    working_visualisations =
      {
        {
          north_position = {0.0, 0.0},
          east_position = {0.0, 0.0},
          south_position = {0.0, 0.0},
          west_position = {0.0, 0.0},
          animation =
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
            priority = "extra-high",
            line_length = 8,
            width = 20,
            height = 49,
            frame_count = 48,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(2, 5.5),
            hr_version = {
              filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace-fire.png",
              priority = "extra-high",
              line_length = 8,
              width = 41,
              height = 100,
              frame_count = 48,
              axially_symmetrical = false,
              direction_count = 1,
              shift = util.by_pixel(-0.75, 5.5),
              scale = 0.5
            }
          },
        light = {intensity = 1, size = 1, color = {r=1.0, g=1.0, b=1.0}}
        }
      },
    fast_replaceable_group = "furnace"
  }
  return result
end

function DyWorld_Entity_Furnace_Electric(DATA, NMB)
  local result =
  {
    type = "furnace",
    name = dy..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/electric-furnace.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = (0.5*NMB), result = dy..DATA.Name..tostring(NMB)},
    max_health = (DATA.Health*NMB),
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
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = math.floor(DATA.Modules*(NMB*1.25)),
      module_info_icon_shift = {0, 0.8}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    crafting_speed = (DATA.Speed*NMB),
    energy_usage = tostring(DATA.Energy).."kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = (DATA.Pollution*NMB)
    },
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
    animation =
    {
      filename = "__base__/graphics/entity/electric-furnace/electric-furnace-base.png",
      priority = "high",
      width = 129,
      height = 100,
      frame_count = 1,
      shift = {0.421875, 0},
	  tint = Color_Tier[NMB],
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
          shift = {0.015625, 0.890625}
        },
        light = {intensity = 0.4, size = 6, shift = {0.0, 1.0}}
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
          shift = {-0.671875, -0.640625}
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
          shift = {0.0625, -1.234375}
        }
      }
    },
    fast_replaceable_group = "furnace"
  }
  return result
end

function DyWorld_Entity_Assembling_Electric(DATA, NMB)
  local result =
  {
    type = "assembling-machine",
    name = dy..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/assembling-machine-3.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = (0.2*NMB), mining_time = (0.5*NMB), result = dy..DATA.Name..tostring(NMB)},
    max_health = (DATA.Health*NMB),
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    },
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority="high",
          width = 108,
          height = 114,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 2),
	      tint = Color_Tier[NMB],
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5,
	        tint = Color_Tier[NMB],
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
          priority="high",
          width = 95,
          height = 83,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(8.5, 5.5),
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.5
          }
        },
      },
    },
    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / (DATA.Pollution*NMB)
    },
    energy_usage = tostring((DATA.Energy*NMB)).."kW",
    crafting_speed = (DATA.Speed*NMB),
    ingredient_count = 25,
    module_specification =
    {
      module_slots = DATA.Module
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    }
  }
  return result
end

function DyWorld_Entity_Accumulators(DATA, NMB)
  local result =
  {
    type = "accumulator",
    name = dy..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/accumulator.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = (0.2*NMB), mining_time = (0.5*NMB), result = dy..DATA.Name..tostring(NMB)},
    max_health = (DATA.Health*NMB),
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = (tostring(math.floor((DATA.Energy*NMB)*1.75))).."MJ",
      usage_priority = "terciary",
      input_flow_limit = (tostring((DATA.Energy*60)*NMB)).."kW",
      output_flow_limit = (tostring((DATA.Energy*60)*NMB)).."kW"
    },
    picture =
    {
      filename = "__base__/graphics/entity/accumulator/accumulator.png",
      priority = "extra-high",
      width = 124,
      height = 103,
      shift = {0.6875, -0.203125},
	  tint = Color_Tier[NMB],
    },
    charge_animation =
    {
      filename = "__base__/graphics/entity/accumulator/accumulator-charge-animation.png",
      width = 138,
      height = 135,
      line_length = 8,
      frame_count = 24,
      shift = {0.46875, -0.640625},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
    discharge_animation =
    {
      filename = "__base__/graphics/entity/accumulator/accumulator-discharge-animation.png",
      width = 147,
      height = 128,
      line_length = 8,
      frame_count = 24,
      shift = {0.390625, -0.53125},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.984375, 1.10938},
        green = {0.890625, 1.10938}
      },
      wire =
      {
        red = {0.6875, 0.59375},
        green = {0.6875, 0.71875}
      }
    },
	fast_replaceable_group = "accumulator",
    circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
    circuit_wire_max_distance = 7.5,
    default_output_signal = {type = "virtual", name = "signal-A"}
  }
  return result
end

function DyWorld_Entity_Construction_Robot(DATA, NMB)
  local result =
  {
    type = "construction-robot",
    name = dy..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/construction-robot.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {hardness = (0.1*NMB), mining_time = (0.1*NMB), result = dy..DATA.Name..tostring(NMB)},
    max_health = (DATA.Health*NMB),
    resistances = { { type = "fire", percent = 85 } },
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = (DATA.Speed*NMB),
    transfer_distance = 0.5,
    max_energy = tostring((DATA.Max_Energy*NMB)).."MJ",
    energy_per_tick = tostring((DATA.Tick_Energy/NMB)).."kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = tostring(DATA.Move_Energy).."kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_light = {intensity = 0.8, size = 3, color = {r = 0.8, g = 0.8, b = 0.8}},
    idle =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
      priority = "high",
      line_length = 16,
      width = 32,
      height = 36,
      frame_count = 1,
      shift = {0, -0.15625},
      direction_count = 16,
	  tint = Color_Tier[NMB],
    },
    in_motion =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
      priority = "high",
      line_length = 16,
      width = 32,
      height = 36,
      frame_count = 1,
      shift = {0, -0.15625},
      direction_count = 16,
      y = 36,
	  tint = Color_Tier[NMB],
    },
    shadow_idle =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 50,
      height = 24,
      frame_count = 1,
      shift = {1.09375, 0.59375},
      direction_count = 16
    },
    shadow_in_motion =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 50,
      height = 24,
      frame_count = 1,
      shift = {1.09375, 0.59375},
      direction_count = 16
    },
    working =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot-working.png",
      priority = "high",
      line_length = 2,
      width = 28,
      height = 36,
      frame_count = 2,
      shift = {0, -0.15625},
      direction_count = 16,
      animation_speed = 0.3,
	  tint = Color_Tier[NMB],
    },
    shadow_working =
    {
      stripes = util.multiplystripes(2,
      {
        {
          filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
          width_in_frames = 16,
          height_in_frames = 1,
        }
      }),
      priority = "high",
      width = 50,
      height = 24,
      frame_count = 2,
      shift = {1.09375, 0.59375},
      direction_count = 16
    },
    smoke =
    {
      filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
      width = 39,
      height = 32,
      frame_count = 19,
      line_length = 19,
      shift = {0.078125, -0.15625},
      animation_speed = 0.3,
    },
    sparks =
    {
      {
        filename = "__base__/graphics/entity/sparks/sparks-01.png",
        width = 39,
        height = 34,
        frame_count = 19,
        line_length = 19,
        shift = {-0.109375, 0.3125},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
      {
        filename = "__base__/graphics/entity/sparks/sparks-02.png",
        width = 36,
        height = 32,
        frame_count = 19,
        line_length = 19,
        shift = {0.03125, 0.125},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
      {
        filename = "__base__/graphics/entity/sparks/sparks-03.png",
        width = 42,
        height = 29,
        frame_count = 19,
        line_length = 19,
        shift = {-0.0625, 0.203125},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
      {
        filename = "__base__/graphics/entity/sparks/sparks-04.png",
        width = 40,
        height = 35,
        frame_count = 19,
        line_length = 19,
        shift = {-0.0625, 0.234375},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
      {
        filename = "__base__/graphics/entity/sparks/sparks-05.png",
        width = 39,
        height = 29,
        frame_count = 19,
        line_length = 19,
        shift = {-0.109375, 0.171875},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
      {
        filename = "__base__/graphics/entity/sparks/sparks-06.png",
        width = 44,
        height = 36,
        frame_count = 19,
        line_length = 19,
        shift = {0.03125, 0.3125},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
    },
    working_sound = flying_robot_sounds(),
    cargo_centered = {0.0, 0.2},
    construction_vector = {0.30, 0.22},
  }
  return result
end

function DyWorld_Entity_Logistic_Robot(DATA, NMB)
  local result =
  {
    type = "logistic-robot",
    name = dy..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/logistic-robot.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {hardness = (0.1*NMB), mining_time = (0.1*NMB), result = dy..DATA.Name..tostring(NMB)},
    max_health = (DATA.Health*NMB),
    resistances = { { type = "fire", percent = 85 } },
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = (DATA.Speed*NMB),
    transfer_distance = 0.5,
    max_energy = tostring((DATA.Max_Energy*NMB)).."MJ",
    energy_per_tick = tostring((DATA.Tick_Energy/NMB)).."kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = tostring(DATA.Move_Energy).."kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_light = {intensity = 0.8, size = 3, color = {r = 0.8, g = 0.8, b = 0.8}},
    idle =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 41,
      height = 42,
      frame_count = 1,
      shift = {0.015625, -0.09375},
      direction_count = 16,
      y = 42,
	  tint = Color_Tier[NMB],
    },
    idle_with_cargo =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 41,
      height = 42,
      frame_count = 1,
      shift = {0.015625, -0.09375},
      direction_count = 16,
	  tint = Color_Tier[NMB],
    },
    in_motion =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 41,
      height = 42,
      frame_count = 1,
      shift = {0.015625, -0.09375},
      direction_count = 16,
      y = 126,
	  tint = Color_Tier[NMB],
    },
    in_motion_with_cargo =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 41,
      height = 42,
      frame_count = 1,
      shift = {0.015625, -0.09375},
      direction_count = 16,
      y = 84,
	  tint = Color_Tier[NMB],
    },
    shadow_idle =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 59,
      height = 23,
      frame_count = 1,
      shift = {0.96875, 0.609375},
      direction_count = 16,
      y = 23
    },
    shadow_idle_with_cargo =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 59,
      height = 23,
      frame_count = 1,
      shift = {0.96875, 0.609375},
      direction_count = 16
    },
    shadow_in_motion =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 59,
      height = 23,
      frame_count = 1,
      shift = {0.96875, 0.609375},
      direction_count = 16,
      y = 23
    },
    shadow_in_motion_with_cargo =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 59,
      height = 23,
      frame_count = 1,
      shift = {0.96875, 0.609375},
      direction_count = 16
    },
    working_sound = flying_robot_sounds(),
    cargo_centered = {0.0, 0.2},
  }
  return result
end

function DyWorld_Entity_Roboport(DATA, NMB)
  local result =
  {
    type = "roboport",
    name = dy..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/roboport.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = (0.2*NMB), mining_time = (0.5*NMB), result = dy..DATA.Name..tostring(NMB)},
    max_health = (DATA.Health*NMB),
    corpse = "big-remnants",
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    dying_explosion = "medium-explosion",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = tostring(5*(NMB+1)).."MW",
      buffer_capacity = tostring(100*(NMB+1)).."MJ"
    },
    recharge_minimum = tostring(40*(NMB+1)).."MJ",
    energy_usage = tostring(50*(NMB+1)).."kW",
    -- per one charge slot
    charging_energy = tostring(1000*(NMB+1)).."kW",
    logistics_radius = (DATA.Radius_Logistic*(NMB+1)), --25
    construction_radius = (DATA.Radius_Construction*(NMB+1)), --55
    charge_approach_distance = 5 + NMB,
    robot_slots_count = 7 + NMB,
    material_slots_count = 7 + NMB,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {-1.5, -0.5}, {1.5, -0.5}, {1.5, 1.5}, {-1.5, 1.5},
    },
    base =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base.png",
      width = 143,
      height = 135,
      shift = {0.5, 0.25},
	  tint = Color_Tier[NMB],
    },
    base_patch =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-patch.png",
      priority = "medium",
      width = 69,
      height = 50,
      frame_count = 1,
      shift = {0.03125, 0.203125},
	  tint = Color_Tier[NMB],
    },
    base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 42,
      height = 31,
      frame_count = 8,
      animation_speed = 0.5,
      shift = {-0.5315, -1.9375},
	  tint = Color_Tier[NMB],
    },
    door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 52,
      height = 20,
      frame_count = 16,
      shift = {0.015625, -0.890625}
    },
    door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 52,
      height = 22,
      frame_count = 16,
      shift = {0.015625, -0.234375}
    },
    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.6 },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.5,
      probability = 1 / (5 * 60) -- average pause between the sound is 5 seconds
    },
    recharging_light = {intensity = 0.4, size = 5, color = {r = 1.0, g = 1.0, b = 1.0}},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = -0.1,

    draw_logistic_radius_visualization = true,
    draw_construction_radius_visualization = true,

    open_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 1.2 }
      },
    },
    close_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 0.75 }
      },
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {1.17188, 1.98438},
        green = {1.04688, 2.04688}
      },
      wire =
      {
        red = {0.78125, 1.375},
        green = {0.78125, 1.53125}
      }
    },
    circuit_connector_sprites = get_circuit_connector_sprites({0.59375, 1.3125}, nil, 18),
    circuit_wire_max_distance = 9 + NMB,
    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
  }
  return result
end

function DyWorld_Entity_Electric_Drill(DATA, NMB)
  local result =
  {
    type = "mining-drill",
    name = dy..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/electric-mining-drill.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = (0.2*NMB), mining_time = (0.5*NMB), result = dy..DATA.Name..tostring(NMB)},
    max_health = (DATA.Health*NMB),
    resource_categories = {"basic-solid"},
    corpse = "big-remnants",
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
    input_fluid_box = 
    {
      production_type = "input-output",
      pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      base_area = 1,
      height = 2,
      base_level = -1,
      pipe_connections =
      {
        { position = {-2, 0} },
        { position = {2, 0} },
        { position = {0, 2} },
      }
    } ,    
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-mining-drill.ogg",
        volume = 0.75
      },
      apparent_volume = 1.5,
    },
	vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    animations =
    {
      north =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N.png",
        line_length = 8,
        width = 98,
        height = 113,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(0, -8.5),
        run_mode = "forward-then-backward",
	    tint = Color_Tier[NMB],
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N.png",
          line_length = 8,
          width = 196,
          height = 226,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(0, -8),
          run_mode = "forward-then-backward",
          scale = 0.5,
		  tint = Color_Tier[NMB],
        }
      },
      east =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E.png",
        line_length = 8,
        width = 105,
        height = 98,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(3.5, -1),
        run_mode = "forward-then-backward",
		tint = Color_Tier[NMB],
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E.png",
          line_length = 8,
          width = 211,
          height = 197,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(3.75, -1.25),
          run_mode = "forward-then-backward",      
          scale = 0.5,
		  tint = Color_Tier[NMB],
        }
      },
      south =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S.png",
        line_length = 8,
        width = 98,
        height = 109,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(0, -1.5),
        run_mode = "forward-then-backward",
		tint = Color_Tier[NMB],
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S.png",
          line_length = 8,
          width = 196,
          height = 219,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(0, -1.25),
          run_mode = "forward-then-backward",
          scale = 0.5,
		  tint = Color_Tier[NMB],
        }
      },
      west =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W.png",
        line_length = 8,
        width = 105,
        height = 98,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(-3.5, -1),
        run_mode = "forward-then-backward",
		tint = Color_Tier[NMB],
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W.png",
          line_length = 8,
          width = 211,
          height = 197,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(-3.75, -0.75),
          run_mode = "forward-then-backward",
          scale = 0.5,
		  tint = Color_Tier[NMB],
        }
      }
    },
    shadow_animations =
    {
      north =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-drill-shadow.png",
        flags = { "shadow" },
        line_length = 8,
        width = 101,
        height = 111,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(1.5, -7.5),
        run_mode = "forward-then-backward",
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-drill-shadow.png",
          flags = { "shadow" },
          line_length = 8,
          width = 201,
          height = 223,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(1.25, -7.25),
          run_mode = "forward-then-backward",
          scale = 0.5
        }
      },
      east =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-drill-shadow.png",
        flags = { "shadow" },
        line_length = 8,
        width = 110,
        height = 97,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(6, -0.5),
        run_mode = "forward-then-backward",
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-drill-shadow.png",
          flags = { "shadow" },
          line_length = 8,
          width = 221,
          height = 195,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(6.25, -0.25),
          run_mode = "forward-then-backward",
          scale = 0.5
        }
      },
      south =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-drill-shadow.png",
        flags = { "shadow" },
        line_length = 8,
        width = 100,
        height = 103,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(1, 2.5),
        run_mode = "forward-then-backward",
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-drill-shadow.png",
          flags = { "shadow" },
          line_length = 8,
          width = 200,
          height = 206,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(1, 2.5),
          run_mode = "forward-then-backward",
          scale = 0.5
        }
      },
      west =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-drill-shadow.png",
        flags = { "shadow" },
        line_length = 8,
        width = 114,
        height = 97,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(1, -0.5),
        run_mode = "forward-then-backward",
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-drill-shadow.png",
          flags = { "shadow" },
          line_length = 8,
          width = 229,
          height = 195,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(1.25, -0.25),
          run_mode = "forward-then-backward",
          scale = 0.5
        }
      }
    },
    input_fluid_patch_sprites =
    {
      north =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-patch.png",
        line_length = 1,
        width = 100,
        height = 111,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, -6.5),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-patch.png",
          line_length = 1,
          width = 200,
          height = 222,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-0.5, -6.5),
          scale = 0.5
        }
      },
      east =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-patch.png",
        line_length = 1,
        width = 100,
        height = 110,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, -6),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-patch.png",
          line_length = 1,
          width = 200,
          height = 219,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(0, -5.75),
          scale = 0.5
        }
      },
      south =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-patch.png",
        line_length = 1,
        width = 100,
        height = 113,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, -7.5),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-patch.png",
          line_length = 1,
          width = 200,
          height = 226,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-0.5, -7.5),
          scale = 0.5
        }
      },
      west =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-patch.png",
        line_length = 1,
        width = 100,
        height = 108,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, -5),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-patch.png",
          line_length = 1,
          width = 200,
          height = 220,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-0.5, -6),
          scale = 0.5
        }
      }
    },
    input_fluid_patch_shadow_sprites =
    {
      north =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-patch-shadow.png",
        flags = { "shadow" },
        line_length = 1,
        width = 110,
        height = 98,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(5, 0),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-patch-shadow.png",
          flags = { "shadow" },
          line_length = 1,
          width = 220,
          height = 197,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(5, -0.25),
          scale = 0.5
        }
      },
      east =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-patch-shadow.png",
        flags = { "shadow" },
        line_length = 1,
        width = 112,
        height = 98,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(6, 0),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-patch-shadow.png",
          flags = { "shadow" },
          line_length = 1,
          width = 224,
          height = 198,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(6, 0),
          scale = 0.5
        }
      },
      south =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-patch-shadow.png",
        flags = { "shadow" },
        line_length = 1,
        width = 110,
        height = 98,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(5, 0),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-patch-shadow.png",
          flags = { "shadow" },
          line_length = 1,
          width = 220,
          height = 197,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(5, -0.25),
          scale = 0.5
        }
      },
      west =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-patch-shadow.png",
        flags = { "shadow" },
        line_length = 1,
        width = 110,
        height = 98,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(5, 0),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-patch-shadow.png",
          flags = { "shadow" },
          line_length = 1,
          width = 220,
          height = 197,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(5, -0.25),
          scale = 0.5
        }
      }
    },
    input_fluid_patch_shadow_animations =
    {
      north =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-drill-received-shadow.png",
        tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
        line_length = 8,
        width = 100,
        height = 102,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(-1, -3),
        run_mode = "forward-then-backward",
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-drill-received-shadow.png",
          tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
          line_length = 8,
          width = 204,
          height = 206,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(-0.5, -2),
          run_mode = "forward-then-backward",
          scale = 0.5
        }
      },
      east =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-drill-received-shadow.png",
        tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
        line_length = 8,
        width = 102,
        height = 98,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(0, -2),
        run_mode = "forward-then-backward",
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-drill-received-shadow.png",
          tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
          line_length = 8,
          width = 204,
          height = 209,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(-0.5, -1.25),
          run_mode = "forward-then-backward",
          scale = 0.5
        }
      },
      south =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-drill-received-shadow.png",
        tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
        line_length = 8,
        width = 100,
        height = 98,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(-1, -1),
        run_mode = "forward-then-backward",
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-drill-received-shadow.png",
          tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
          line_length = 8,
          width = 204,
          height = 204,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(-0.5, -2.5),
          run_mode = "forward-then-backward",
          scale = 0.5
        }
      },
      west =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-drill-received-shadow.png",
        tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
        line_length = 8,
        width = 96,
        height = 99,
        frame_count = 64,
        animation_speed = 0.5,
        direction_count = 1,
        shift = util.by_pixel(0, -1.5),
        run_mode = "forward-then-backward",
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-drill-received-shadow.png",
          tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
          line_length = 8,
          width = 198,
          height = 206,
          frame_count = 64,
          animation_speed = 0.5,
          direction_count = 1,
          shift = util.by_pixel(1, -2),
          run_mode = "forward-then-backward",
          scale = 0.5
        }
      }
    },
    input_fluid_patch_window_sprites =
    {
      north =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-window-background.png",
        line_length = 1,
        width = 72,
        height = 54,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(-1, 1),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-window-background.png",
          line_length = 1,
          width = 142,
          height = 107,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-1, 0.75),
          scale = 0.5
        }
      },
      east =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-window-background.png",
        line_length = 1,
        width = 51,
        height = 74,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(-11.5, -11),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-window-background.png",
          line_length = 1,
          width = 104,
          height = 147,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-11, -11.25),
          scale = 0.5
        }
      },
      south =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-window-background.png",
        line_length = 1,
        width = 71,
        height = 44,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(-1.5, -29),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-window-background.png",
          line_length = 1,
          width = 141,
          height = 86,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-1.75, -29),
          scale = 0.5
        }
      },
      west =
      {
        priority = "extra-high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-window-background.png",
        line_length = 1,
        width = 41,
        height = 69,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(11.5, -11.5),
        hr_version = {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-window-background.png",
          line_length = 1,
          width = 80,
          height = 137,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(11.5, -11.25),
          scale = 0.5
        }
      }
    },
    
    input_fluid_patch_window_flow_sprites =
    {
      {
        north =
        {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-fluid-flow.png",
          line_length = 1,
          width = 68,
          height = 50,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-2, -1),
          hr_version = {
            priority = "extra-high",
            filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-fluid-flow.png",
            line_length = 1,
            width = 136,
            height = 99,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-2.5, -0.75),
            scale = 0.5
          }
        },
        east =
        {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-fluid-flow.png",
          line_length = 1,
          width = 41,
          height = 70,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-11.5, -11),
          hr_version = {
            priority = "extra-high",
            filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-fluid-flow.png",
            line_length = 1,
            width = 82,
            height = 139,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-11.5, -11.25),
            scale = 0.5
          }
        },
        south =
        {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-fluid-flow.png",
          line_length = 1,
          width = 68,
          height = 40,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-2, -29),
          hr_version = {
            priority = "extra-high",
            filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-fluid-flow.png",
            line_length = 1,
            width = 136,
            height = 80,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-2.5, -29.5),
            scale = 0.5
          }
        },
        west =
        {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-fluid-flow.png",
          line_length = 1,
          width = 42,
          height = 70,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(11, -11),
          hr_version = {
            priority = "extra-high",
            filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-fluid-flow.png",
            line_length = 1,
            width = 83,
            height = 140,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(10.75, -11),
            scale = 0.5
          }
        }
      },
    },
    input_fluid_patch_window_base_sprites =
    {
      {
        north =
        {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-fluid-background.png",
          line_length = 1,
          width = 70,
          height = 48,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-2, 0),
          hr_version = {
            priority = "extra-high",
            filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-fluid-background.png",
            line_length = 1,
            width = 138,
            height = 94,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-2, 0),
            scale = 0.5
          }
        },
        east =
        {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-fluid-background.png",
          line_length = 1,
          width = 42,
          height = 70,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-12, -11),
          hr_version = {
            priority = "extra-high",
            filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-fluid-background.png",
            line_length = 1,
            width = 84,
            height = 138,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-12, -11),
            scale = 0.5
          }
        },
        south =
        {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-fluid-background.png",
          line_length = 1,
          width = 70,
          height = 40,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-2, -29),
          hr_version = {
            priority = "extra-high",
            filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-fluid-background.png",
            line_length = 1,
            width = 138,
            height = 80,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-2, -29),
            scale = 0.5
          }
        },
        west =
        {
          priority = "extra-high",
          filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-fluid-background.png",
          line_length = 1,
          width = 42,
          height = 69,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(12, -10.5),
          hr_version = {
            priority = "extra-high",
            filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-fluid-background.png",
            line_length = 1,
            width = 83,
            height = 137,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(11.75, -10.75),
            scale = 0.5
          }
        }
      },
    },
    
    mining_speed = (0.5*NMB),
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 0.15 / (1.5*NMB),
      usage_priority = "secondary-input"
    },
    energy_usage = tostring((DATA.Energy*NMB)).."kW",
    mining_power = (3 + NMB),
    resource_searching_radius = DATA.Range,
    vector_to_place_result = {0, -1.85},
    module_specification =
    {
      module_slots = (2 + NMB)
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    fast_replaceable_group = "mining-drill",
    circuit_wire_connection_points =
    {
      get_circuit_connector_wire_shifting_for_connector({-0.09375, -1.65625}, {-0.09375, -1.65625}, 4),
      get_circuit_connector_wire_shifting_for_connector({1.28125, -0.40625},  {1.28125, -0.40625},  2),
      get_circuit_connector_wire_shifting_for_connector({0.09375, 1},         {0.09375, 1},         0),
      get_circuit_connector_wire_shifting_for_connector({-1.3125, -0.3125},   {-1.3125, -0.3125},   6)
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({-0.09375, -1.65625}, {-0.09375, -1.65625}, 4),
      get_circuit_connector_sprites({1.28125, -0.40625},  {1.28125, -0.40625},  2),
      get_circuit_connector_sprites({0.09375, 1},         {0.09375, 1},         0),
      get_circuit_connector_sprites({-1.3125, -0.3125},   {-1.3125, -0.3125},   6)
    },
    circuit_wire_max_distance = (9 + NMB),
  }
  return result
end

-- START OF MATERIAL SYSTEM!

function DyWorld_Transport_Belt(DATA)
data:extend(
{
  {
    type = "transport-belt",
    name = dy..DATA.Name.."-transport-belt",
	localised_name = {"looped-name.belt", {"looped-name."..DATA.Name}},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/transport-belt.png",
		tint = Material_Colors[DATA.Table],
	  },
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = dy..DATA.Name.."-transport-belt"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/transport-belt.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 3
    },
    animation_speed_coefficient = 32,
    animations =
    {
      filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 16,
      direction_count = 12,
	  tint = Material_Colors[DATA.Table],
      hr_version =
      {
        filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
        priority = "extra-high",
        width = 80,
        height = 80,
        scale = 0.5,
        frame_count = 16,
        direction_count = 12,
		tint = Material_Colors[DATA.Table],
      }
    },
    belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors[DATA.Table]),
    belt_vertical = DyWorld_basic_belt_vertical(Material_Colors[DATA.Table]),
    ending_top = DyWorld_basic_belt_ending_top(Material_Colors[DATA.Table]),
    ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors[DATA.Table]),
    ending_side = DyWorld_basic_belt_ending_side(Material_Colors[DATA.Table]),
    starting_top = DyWorld_basic_belt_starting_top(Material_Colors[DATA.Table]),
    starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors[DATA.Table]),
    starting_side = DyWorld_basic_belt_starting_side(Material_Colors[DATA.Table]),
    ending_patch = DyWorld_ending_patch_prototype(Material_Colors[DATA.Table]),
    fast_replaceable_group = "transport-belt",
    speed = (DyWorld_Material_Formulas(1, DATA.Table)/426.67),
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector_sprites = transport_belt_circuit_connector_sprites,
    circuit_wire_connection_point = transport_belt_circuit_wire_connection_point,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {
    type = "underground-belt",
    name = dy..DATA.Name.."-underground-belt",
	localised_name = {"looped-name.underground-belt", {"looped-name."..DATA.Name}},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/underground-belt.png",
		tint = Material_Colors[DATA.Table],
	  },
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = dy..DATA.Name.."-underground-belt"},max_health = DyWorld_Material_Formulas(3, DATA.Table),
    max_distance = DyWorld_Material_Formulas(2, DATA.Table),
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 32,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/transport-belt.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 3
    },
    belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors[DATA.Table]),
    belt_vertical = DyWorld_basic_belt_vertical(Material_Colors[DATA.Table]),
    ending_top = DyWorld_basic_belt_ending_top(Material_Colors[DATA.Table]),
    ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors[DATA.Table]),
    ending_side = DyWorld_basic_belt_ending_side(Material_Colors[DATA.Table]),
    starting_top = DyWorld_basic_belt_starting_top(Material_Colors[DATA.Table]),
    starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors[DATA.Table]),
    starting_side = DyWorld_basic_belt_starting_side(Material_Colors[DATA.Table]),
    ending_patch = DyWorld_ending_patch_prototype(Material_Colors[DATA.Table]),
    fast_replaceable_group = "underground-belt",
    speed = (DyWorld_Material_Formulas(1, DATA.Table)/426.67),
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
          y = 43,
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5,
			tint = Material_Colors[DATA.Table],
          }
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            scale = 0.5,
			tint = Material_Colors[DATA.Table],
          }

        }

      }
    },
  },
  {
    type = "splitter",
    name = dy..DATA.Name.."-splitter",
	localised_name = {"looped-name.belt", {"looped-name."..DATA.Name}},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/splitter.png",
		tint = Material_Colors[DATA.Table],
	  },
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = dy..DATA.Name.."-splitter"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "medium-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 0.7,
    structure_animation_movement_cooldown = 10,
    belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors[DATA.Table]),
    belt_vertical = DyWorld_basic_belt_vertical(Material_Colors[DATA.Table]),
    ending_top = DyWorld_basic_belt_ending_top(Material_Colors[DATA.Table]),
    ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors[DATA.Table]),
    ending_side = DyWorld_basic_belt_ending_side(Material_Colors[DATA.Table]),
    starting_top = DyWorld_basic_belt_starting_top(Material_Colors[DATA.Table]),
    starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors[DATA.Table]),
    starting_side = DyWorld_basic_belt_starting_side(Material_Colors[DATA.Table]),
    ending_patch = DyWorld_ending_patch_prototype(Material_Colors[DATA.Table]),
    fast_replaceable_group = "splitter",
    speed = (DyWorld_Material_Formulas(1, DATA.Table)/426.67),
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/splitter/splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 83,
        height = 36,
        shift = {0.265625, 0},
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 70,
          shift = {0.25, 0.046875},
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 80,
        shift = {0.109375, -0.03125},
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 93,
          height = 157,
          shift = {0.148438, -0.179688},
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/splitter/splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 85,
        height = 35,
        shift = {0.140625, -0.015625},
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 168,
          height = 67,
          shift = {0.140625, 0.0234375},
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 78,
        shift = {0.296875, -0.03125},
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 94,
          height = 154,
          shift = {0.203125, -0.109375},
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      },
    },
  },
  {
    type = "item",
    name = dy..DATA.Name.."-transport-belt",
	localised_name = {"looped-name.belt", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/transport-belt.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."transport-belt",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-transport-belt",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-underground-belt",
	localised_name = {"looped-name.underground-belt", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/underground-belt.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."transport-underground",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-underground-belt",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-splitter",
	localised_name = {"looped-name.splitter", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/splitter.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."transport-splitter",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-splitter",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-transport-belt",
    energy_required = 0.5,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-transport-belt",
    result_count = 2,
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-underground-belt",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-transport-belt", DyWorld_Material_Formulas(2, DATA.Table)}},
    result = dy..DATA.Name.."-underground-belt",
    result_count = 2,
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-splitter",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-transport-belt", 2},{"electronic-circuit", 2}},
    result = dy..DATA.Name.."-splitter",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 2}
		local result_2 = {DATA.Name, 3}
		local result_3 = {DATA.Name, 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-transport-belt"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-underground-belt"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-splitter"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 2}
		local result_2 = {DATA.Name.."-plate", 3}
		local result_3 = {DATA.Name.."-plate", 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-transport-belt"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-underground-belt"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-splitter"].ingredients, result_1)
	end
end

function DyWorld_Transport_Pipe(DATA)
data:extend(
{
  {
    type = "pipe",
    name = dy..DATA.Name.."-pipe",
	localised_name = {"looped-name.pipe", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.pipe-desc", (DyWorld_Material_Formulas(4, DATA.Table))},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/pipe.png", 
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-pipe"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }
    },
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table) / 100),
      pipe_connections =
      {
        { position = {0, -1} },
        { position = {1, 0} },
        { position = {0, 1} },
        { position = {-1, 0} }
      },
    },
	vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures = DyWorld_pipepictures(Material_Colors[DATA.Table]),
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/pipe.ogg",
          volume = 0.85
        },
      },
      match_volume_to_activity = true,
      max_sounds_per_type = 3
    },

    horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
  },
  {
    type = "pipe-to-ground",
    name = dy..DATA.Name.."-pipe-to-ground",
	localised_name = {"looped-name.pipe-to-ground", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.pipe-to-ground-desc", (DyWorld_Material_Formulas(4, DATA.Table)), (DyWorld_Material_Formulas(2, DATA.Table))},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/pipe-to-ground.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-pipe-to-ground"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 40
      }

    },
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table) / 100),
      pipe_covers = DyWorld_pipecoverspictures(Material_Colors[DATA.Table]),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, 1},
          max_underground_distance = DyWorld_Material_Formulas(2, DATA.Table)
        }
      },
    },
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      up =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = Material_Colors[DATA.Table],
        }
      },
      down =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = Material_Colors[DATA.Table],
        }
      },
      left =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = Material_Colors[DATA.Table],
        }
      },
      right =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = Material_Colors[DATA.Table],
        }
      },
    }
  },
  {
    type = "item",
    name = dy..DATA.Name.."-pipe",
	localised_name = {"looped-name.pipe", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.pipe-desc", (DyWorld_Material_Formulas(4, DATA.Table))},
	icons = {{icon = "__base__/graphics/icons/pipe.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."pipe-normal",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-pipe",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-pipe-to-ground",
	localised_name = {"looped-name.pipe-to-ground", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.pipe-to-ground-desc", (DyWorld_Material_Formulas(4, DATA.Table)), (DyWorld_Material_Formulas(2, DATA.Table))},
	icons = {{icon = "__base__/graphics/icons/pipe-to-ground.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."pipe-underground",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-pipe-to-ground",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-pipe",
    energy_required = 0.5,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-pipe",
    result_count = 1,
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-pipe-to-ground",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-pipe", DyWorld_Material_Formulas(2, DATA.Table)}},
    result = dy..DATA.Name.."-pipe-to-ground",
    result_count = 2,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 2}
		local result_2 = {DATA.Name, 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe-to-ground"].ingredients, result_2)
	else
		local result_1 = {DATA.Name.."-plate", 2}
		local result_2 = {DATA.Name.."-plate", 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe-to-ground"].ingredients, result_2)
	end
end

function DyWorld_Turrets(DATA)
data:extend(
{
  {
    type = "ammo-turret",
    name = dy..DATA.Name.."-gun-turret",
	localised_name = {"looped-name.gun-turret", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/gun-turret.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = dy..DATA.Name.."-gun-turret"},
    max_health = (25 * DyWorld_Material_Formulas(3, DATA.Table)),
    corpse = "medium-remnants",
    collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
    selection_box = {{-1, -1 }, {1, 1}},
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    folding_speed = 0.08,
    dying_explosion = "medium-explosion",
    inventory_size = 3,
    automated_ammo_count = 10,
    attacking_speed = 0.5,
    folded_animation = 
    {
      layers =
      {
        DyWorld_gun_turret_extension({frame_count=1, line_length = 1}, Material_Colors[DATA.Table]),
        DyWorld_gun_turret_extension_mask{frame_count=1, line_length = 1},
        DyWorld_gun_turret_extension_shadow{frame_count=1, line_length = 1}
      }
    },
    preparing_animation = 
    {
      layers =
      {
        DyWorld_gun_turret_extension({}, Material_Colors[DATA.Table]),
        DyWorld_gun_turret_extension_mask{},
        DyWorld_gun_turret_extension_shadow{}
      }
    },
    prepared_animation = DyWorld_gun_turret_attack({frame_count=1}, Material_Colors[DATA.Table]),
    attacking_animation = DyWorld_gun_turret_attack({}, Material_Colors[DATA.Table]),
    folding_animation = 
    { 
      layers = 
      { 
        DyWorld_gun_turret_extension({run_mode = "backward"}, Material_Colors[DATA.Table]),
        DyWorld_gun_turret_extension_mask{run_mode = "backward"},
        DyWorld_gun_turret_extension_shadow{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
          priority = "high",
          width = 90,
          height = 75,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = {0, -0.046875},
		  tint = Material_Colors[DATA.Table],
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
          flags = { "mask" },
          line_length = 1,
          width = 52,
          height = 47,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = {0, -0.234375},
          apply_runtime_tint = true
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = (60 / DyWorld_Material_Formulas(6, DATA.Table)),
      projectile_creation_distance = 1.39375,
      projectile_center = {0, -0.0875}, -- same as gun_turret_attack shift
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {-0.0625, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = DyWorld_Material_Formulas(5, DATA.Table),
      min_range = math.ceil(DyWorld_Material_Formulas(5, DATA.Table) * 0.15),
      turn_range = DyWorld_Material_Formulas(7, DATA.Table)/360,
      sound = make_heavy_gunshot_sounds(),
    },
    prepare_range = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 )),
    shoot_in_prepare_state = true,
    call_for_help_radius = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 ))
  },
  {
    type = "item",
    name = dy..DATA.Name.."-gun-turret",
	localised_name = {"looped-name.gun-turret", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/gun-turret.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."turret-gun",
    stack_size = 50,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-gun-turret",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-gun-turret",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{"electronic-circuit", 3}},
    result = dy..DATA.Name.."-gun-turret",
    result_count = 1,
  },
  {
    type = "ammo-turret",
    name = dy..DATA.Name.."-shotgun-turret",
	localised_name = {"looped-name.shotgun-turret", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/gun-turret.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = dy..DATA.Name.."-shotgun-turret"},
    max_health = (25 * DyWorld_Material_Formulas(3, DATA.Table)),
    corpse = "medium-remnants",
    collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
    selection_box = {{-1, -1 }, {1, 1}},
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    folding_speed = 0.08,
    dying_explosion = "medium-explosion",
    inventory_size = 3,
    automated_ammo_count = 10,
    attacking_speed = 0.5,
    folded_animation = 
    {
      layers =
      {
        DyWorld_gun_turret_extension({frame_count=1, line_length = 1}, Material_Colors[DATA.Table]),
        DyWorld_gun_turret_extension_mask{frame_count=1, line_length = 1},
        DyWorld_gun_turret_extension_shadow{frame_count=1, line_length = 1}
      }
    },
    preparing_animation = 
    {
      layers =
      {
        DyWorld_gun_turret_extension({}, Material_Colors[DATA.Table]),
        DyWorld_gun_turret_extension_mask{},
        DyWorld_gun_turret_extension_shadow{}
      }
    },
    prepared_animation = DyWorld_gun_turret_attack({frame_count=1}, Material_Colors[DATA.Table]),
    attacking_animation = DyWorld_gun_turret_attack({}, Material_Colors[DATA.Table]),
    folding_animation = 
    { 
      layers = 
      { 
        DyWorld_gun_turret_extension({run_mode = "backward"}, Material_Colors[DATA.Table]),
        DyWorld_gun_turret_extension_mask{run_mode = "backward"},
        DyWorld_gun_turret_extension_shadow{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
          priority = "high",
          width = 90,
          height = 75,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = {0, -0.046875},
		  tint = Material_Colors[DATA.Table],
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
          flags = { "mask" },
          line_length = 1,
          width = 52,
          height = 47,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = {0, -0.234375},
          apply_runtime_tint = true
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "shotgun-shell",
      cooldown = (60 / DyWorld_Material_Formulas(6, DATA.Table)),
      projectile_creation_distance = 1.39375,
      projectile_center = {0, -0.0875}, -- same as gun_turret_attack shift
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {-0.0625, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = DyWorld_Material_Formulas(5, DATA.Table),
      min_range = math.ceil(DyWorld_Material_Formulas(5, DATA.Table) * 0.15),
      turn_range = DyWorld_Material_Formulas(7, DATA.Table)/360,
      sound = make_heavy_gunshot_sounds(),
    },
    prepare_range = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 )),
    shoot_in_prepare_state = true,
    call_for_help_radius = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 ))
  },
  {
    type = "item",
    name = dy..DATA.Name.."-shotgun-turret",
	localised_name = {"looped-name.shotgun-turret", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/gun-turret.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."turret-shotgun",
    stack_size = 50,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-shotgun-turret",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-shotgun-turret",
    energy_required = 3.5,
	enabled = false,
    ingredients = {{"electronic-circuit", 4}, {dy..DATA.Name.."-gun-turret", 1}},
    result = dy..DATA.Name.."-shotgun-turret",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-gun-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-turret"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-gun-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-turret"].ingredients, result_1)
	end
end

function DyWorld_Ammo(DATA)
data:extend(
{
  {
    type = "projectile",
    name = dy..DATA.Name.."-basic-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = DyWorld_Material_Formulas(8, DATA.Table), type = "physical"}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      tint = Material_Colors[DATA.Table],
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
	}
  },
  {
    type = "ammo",
    name = dy..DATA.Name.."-basic-ammo",
	localised_name = {"looped-name.ammo-basic", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      target_type = "direction",
      action =
      {
        {
          type = "direct",
          action_delivery = 
          {
            type = "instant",
            source_effects = 
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 1,
          action_delivery =
          {
            type = "projectile",
            projectile = dy..DATA.Name.."-basic-projectile",
            starting_speed = 1,
            direction_deviation = 0.05,
            range_deviation = 0.15,
            max_range = DyWorld_Material_Formulas(5, DATA.Table),
          }
        }
      }
    },
    magazine_size = DyWorld_Material_Formulas(7, DATA.Table),
    subgroup = dy.."ammo-basic",
    order = DATA.Name,
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-basic-ammo",
    energy_required = 1,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-basic-ammo",
    result_count = 1,
  },
  {
    type = "projectile",
    name = dy..DATA.Name.."-shotgun-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = DyWorld_Material_Formulas(8, DATA.Table), type = "physical"}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      tint = Material_Colors[DATA.Table],
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
	}
  },
  {
    type = "ammo",
    name = dy..DATA.Name.."-shotgun-ammo",
	localised_name = {"looped-name.ammo-shotgun", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/shotgun-shell.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "shotgun-shell",
      target_type = "direction",
      action =
      {
        {
          type = "direct",
          action_delivery = 
          {
            type = "instant",
            source_effects = 
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 8 + math.floor(Materials[DATA.Table].Density),
          action_delivery =
          {
            type = "projectile",
            projectile = dy..DATA.Name.."-shotgun-projectile",
            starting_speed = 1,
            direction_deviation = 0.35,
            range_deviation = 0.15,
            max_range = DyWorld_Material_Formulas(5, DATA.Table),
          }
        }
      }
    },
    magazine_size = DyWorld_Material_Formulas(7, DATA.Table),
    subgroup = dy.."ammo-shotgun",
    order = DATA.Name,
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-shotgun-ammo",
    energy_required = 1,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-shotgun-ammo",
    result_count = 1,
  },
  {
    type = "projectile",
    name = dy..DATA.Name.."-basic-piercing-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
	piercing_damage = DyWorld_Material_Formulas(8, DATA.Table),
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = DyWorld_Material_Formulas(8, DATA.Table), type = "physical"}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      tint = Material_Colors[DATA.Table],
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
	}
  },
  {
    type = "ammo",
    name = dy..DATA.Name.."-basic-piercing-ammo",
	localised_name = {"looped-name.ammo-basic-piercing", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/piercing-rounds-magazine.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      target_type = "direction",
      action =
      {
        {
          type = "direct",
          action_delivery = 
          {
            type = "instant",
            source_effects = 
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 1,
          action_delivery =
          {
            type = "projectile",
            projectile = dy..DATA.Name.."-basic-piercing-projectile",
            starting_speed = 1,
            direction_deviation = 0.05,
            range_deviation = 0.15,
            max_range = DyWorld_Material_Formulas(5, DATA.Table),
          }
        }
      }
    },
    magazine_size = DyWorld_Material_Formulas(7, DATA.Table),
    subgroup = dy.."ammo-basic-piercing",
    order = DATA.Name,
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-basic-piercing-ammo",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-basic-ammo", 2}},
    result = dy..DATA.Name.."-basic-piercing-ammo",
    result_count = 1,
  },
  {
    type = "projectile",
    name = dy..DATA.Name.."-shotgun-piercing-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
	piercing_damage = DyWorld_Material_Formulas(8, DATA.Table),
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = DyWorld_Material_Formulas(8, DATA.Table), type = "physical"}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      tint = Material_Colors[DATA.Table],
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
	}
  },
  {
    type = "ammo",
    name = dy..DATA.Name.."-shotgun-piercing-ammo",
	localised_name = {"looped-name.ammo-shotgun-piercing", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/piercing-shotgun-shell.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      target_type = "direction",
      action =
      {
        {
          type = "direct",
          action_delivery = 
          {
            type = "instant",
            source_effects = 
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 12 + math.floor(Materials[DATA.Table].Density),
          action_delivery =
          {
            type = "projectile",
            projectile = dy..DATA.Name.."-shotgun-piercing-projectile",
            starting_speed = 1,
            direction_deviation = 0.3,
            range_deviation = 0.15,
            max_range = DyWorld_Material_Formulas(5, DATA.Table),
          }
        }
      }
    },
    magazine_size = DyWorld_Material_Formulas(7, DATA.Table),
    subgroup = dy.."ammo-shotgun-piercing",
    order = DATA.Name,
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-shotgun-piercing-ammo",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-shotgun-ammo", 2}},
    result = dy..DATA.Name.."-shotgun-piercing-ammo",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 2}
		local result_2 = {DATA.Name, 5}
		local result_3 = {DATA.Name, 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-ammo"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-ammo"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-piercing-ammo"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-piercing-ammo"].ingredients, result_3)
	else
		local result_1 = {DATA.Name.."-plate", 2}
		local result_2 = {DATA.Name.."-plate", 5}
		local result_3 = {DATA.Name.."-plate", 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-ammo"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-ammo"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-piercing-ammo"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-piercing-ammo"].ingredients, result_3)
	end
end

function DyWorld_Pumps(DATA)
data:extend(
{
  {
    type = "offshore-pump",
    name = dy..DATA.Name.."-offshore-pump",
	localised_name = {"looped-name.offshore-pump", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/offshore-pump.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    minable = {mining_time = 1, result = dy..DATA.Name.."-offshore-pump"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    fluid = "water",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.6, -0.45}, {0.6, 0.3}},
    selection_box = {{-1, -1.49}, {1, 0.49}},
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table) / 100),
      base_level = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, 1} },
      },
    },
    pumping_speed = Materials[DATA.Table].Strength_Ultimate,
    tile_width = 1,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      north =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {0.90625, 0.0625},
        width = 160,
        height = 102,
		tint = Material_Colors[DATA.Table]
      },
      east =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {0.90625, 0.0625},
        x = 160,
        width = 160,
        height = 102,
		tint = Material_Colors[DATA.Table]
      },
      south =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {0.90625, 0.65625},
        x = 320,
        width = 160,
        height = 102,
		tint = Material_Colors[DATA.Table]
      },
      west =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {1.0, 0.0625},
        x = 480,
        width = 160,
        height = 102,
		tint = Material_Colors[DATA.Table]
      }
    },
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {2.71875, 0.375},
          green = {2.5, 0.375},
        },
        wire =
        {
          red = {0.84375, -0.09375},
          green = {0.6875, -0.09375},
        }
      },
      {
        shadow =
        {
          red = {0.765625, 0.546875},
          green = {0.765625, 0.421875},
        },
        wire =
        {
          red = {-0.28125, -0.09375},
          green = {-0.28125, -0.21875},
        }
      },
      {
        shadow =
        {
          red = {-0.09375, 0.5625},
          green = {0.0625, 0.5625},
        },
        wire =
        {
          red = {-0.90625, -0.53125},
          green = {-0.75, -0.53125},
        }
      },
      {
        shadow =
        {
          red = {1.78125, -0.46875},
          green = {1.78125, -0.3125},
        },
        wire =
        {
          red = {0.34375, -1.40625},
          green = {0.34375, -1.25},
        }
      }
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({0.90625, -0.15625}, nil, 0),
      get_circuit_connector_sprites({0, 0.03125}, nil, 6),
      get_circuit_connector_sprites({-0.9375, -0.25}, nil, 4),
      get_circuit_connector_sprites({0.125, -1.3125}, nil, 2),
    },
    circuit_wire_max_distance = math.floor(Materials[DATA.Table].Density)

  },
  {
    type = "pump",
    name = dy..DATA.Name.."-pump",
	localised_name = {"looped-name.pump", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/pump.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = dy..DATA.Name.."-pump"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    fast_replaceable_group = "pipe",
    corpse = "small-remnants",
    collision_box = {{-0.29, -0.79}, {0.29, 0.79}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }
    },
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table) / 100),
      height = 2,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, -1.5}, type="output" },
        { position = {0, 1.5}, type="input" },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.01 / 2.5
    },
    energy_usage = "30kW",
    pumping_speed = Materials[DATA.Table].Strength_Ultimate,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    animations =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north.png",
        width = 53,
        height = 79,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(8.000, 7.500),
		tint = Material_Colors[DATA.Table],
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-north.png",
          width = 103,
          height = 164,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(8, 3.5),
		  tint = Material_Colors[DATA.Table], 
        },
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east.png",
        width = 66,
        height = 60,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(0, 4),
		tint = Material_Colors[DATA.Table],
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-east.png",
          width = 130,
          height = 109,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(-0.5, 1.75),
		  tint = Material_Colors[DATA.Table], 
        },
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south.png",
        width = 62,
        height = 87,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(13.5, 0.5),
		tint = Material_Colors[DATA.Table],
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-south.png",
          width = 114,
          height = 160,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(12.5, -8),
		  tint = Material_Colors[DATA.Table], 
        },
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west.png",
        width = 69,
        height = 51,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(0.5, -0.5),
		tint = Material_Colors[DATA.Table],
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-west.png",
          width = 131,
          height = 111,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(-0.25, 1.25),
		  tint = Material_Colors[DATA.Table], 
        },
      },
    },
    fluid_wagon_connector_frame_count = 35,
    fluid_wagon_connector_graphics = require("data.core.prototypes.pump-connector"),
    fluid_animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-liquid.png",
        apply_runtime_tint = true,
        width = 20,
        height = 13,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-0.500, -14.500),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-north-liquid.png",
          apply_runtime_tint = true,
          width = 38,
          height = 22,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(-0.250, -16.750)
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-liquid.png",
        width = 18,
        height = 24,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(6.000, -8.000),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-east-liquid.png",
          width = 35,
          height = 46,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(6.250, -8.500)
        },
      },
      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-liquid.png",
        width = 26,
        height = 55,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(3.500, 6.500),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-south-liquid.png",
          width = 38,
          height = 45,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(0.500, -9.250)
        },
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-liquid.png",
        width = 18,
        height = 24,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-6.000, -9.000),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-west-liquid.png",
          width = 35,
          height = 47,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(-6.500, -9.500)
        },
      }
    },
    glass_pictures =
    {
      north = {
        filename = "__base__/graphics/entity/pump/pump-north-glass.png",
        width = 32,
        height = 64,
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-north-glass.png",
          width = 64,
          height = 128,
          scale = 0.5,
        },
      },
      east = {
        filename = "__base__/graphics/entity/pump/pump-east-glass.png",
        width = 32,
        height = 32,
        shift = util.by_pixel(0.000, -16.000),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-east-glass.png",
          width = 128,
          height = 192,
          scale = 0.5,
        },
      },
      south = {
        filename = "__base__/graphics/entity/pump/pump-south-glass.png",
        width = 32,
        height = 64,
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-south-glass.png",
          width = 64,
          height = 128,
          scale = 0.5,
        },
      },
      west = {
        filename = "__base__/graphics/entity/pump/pump-west-glass.png",
        width = 32,
        height = 96,
        shift = util.by_pixel(0.000, 15.000),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-west-glass.png",
          width = 192,
          height = 192,
          scale = 0.5,
          shift = util.by_pixel(-16.000, 0.000)
        },
      }
    },
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {0.171875, 0.140625},
          green = {0.171875, 0.265625},
        },
        wire =
        {
          red = {-0.53125, -0.15625},
          green = {-0.53125, 0},
        }
      },
      {
        shadow =
        {
          red = {0.890625, 0.703125},
          green = {0.75, 0.75},
        },
        wire =
        {
          red = {0.34375, 0.28125},
          green = {0.34375, 0.4375},
        }
      },
      {
        shadow =
        {
          red = {0.15625, 0.0625},
          green = {0.09375, 0.125},
        },
        wire =
        {
          red = {-0.53125, -0.09375},
          green = {-0.53125, 0.03125},
        }
      },
      {
        shadow =
        {
          red = {0.796875, 0.703125},
          green = {0.625, 0.75},
        },
        wire =
        {
          red = {0.40625, 0.28125},
          green = {0.40625, 0.4375},
        }
      }
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({-0.40625, -0.3125}, nil, 24),
      get_circuit_connector_sprites({0.125, 0.21875}, {0.34375, 0.40625}, 18),
      get_circuit_connector_sprites({-0.40625, -0.25}, nil, 24),
      get_circuit_connector_sprites({0.203125, 0.203125}, {0.25, 0.40625}, 18),
    },
    circuit_wire_max_distance = math.floor(Materials[DATA.Table].Density)
  },
  {
    type = "item",
    name = dy..DATA.Name.."-pump",
	localised_name = {"looped-name.pump", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/pump.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."pump-pipe",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-pump",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-pump",
    energy_required = 1.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-pipe", 1},{"electronic-circuit", 5},{dy.."gearbox", 1}},
    result = dy..DATA.Name.."-pump",
    result_count = 1,
  },
  {
    type = "item",
    name = dy..DATA.Name.."-offshore-pump",
	localised_name = {"looped-name.offshore-pump", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/offshore-pump.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."pump-offshore",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-offshore-pump",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-offshore-pump",
    energy_required = 1.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-pipe", 1},{"electronic-circuit", 2}},
    result = dy..DATA.Name.."-offshore-pump",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pump"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-offshore-pump"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 8}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pump"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-offshore-pump"].ingredients, result_1)
	end
end

function DyWorld_Inserters(DATA)
data:extend(
{
  {
    type = "inserter",
    name = dy..DATA.Name.."-basic-inserter",
	localised_name = {"looped-name.inserter-1", {"looped-name."..DATA.Name}},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-basic-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/inserter.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = 5000,
    energy_per_rotation = 5000,
    extension_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 7.5),
    rotation_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 15),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-basic-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 33,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
		tint = Material_Colors[DATA.Table],
        hr_version = {
          filename = "__base__/graphics/entity/inserter/hr-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = dy..DATA.Name.."-long-inserter",
	localised_name = {"looped-name.inserter-2", {"looped-name."..DATA.Name}},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-long-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/long-handed-inserter.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -2},
    insert_position = {0, 2.2},
    energy_per_movement = 5000,
    energy_per_rotation = 5000,
    extension_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 7.5),
    rotation_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 15),
    hand_size = 1.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-basic-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 33,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
		tint = Material_Colors[DATA.Table],
        hr_version = {
          filename = "__base__/graphics/entity/inserter/hr-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = dy..DATA.Name.."-filter-inserter",
	localised_name = {"looped-name.inserter-3", {"looped-name."..DATA.Name}},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-filter-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/filter-inserter.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = 8000,
    energy_per_rotation = 8000,
    extension_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 8),
    rotation_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 15),
    filter_count = 5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.5kW"
    },
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-basic-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 33,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
		tint = Material_Colors[DATA.Table],
        hr_version = {
          filename = "__base__/graphics/entity/inserter/hr-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = dy..DATA.Name.."-stack-inserter",
	localised_name = {"looped-name.inserter-4", {"looped-name."..DATA.Name}},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-stack-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/stack-inserter.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    stack = true,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = 20000,
    energy_per_rotation = 20000,
    extension_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 4),
    rotation_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 7.5),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-basic-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 33,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
		tint = Material_Colors[DATA.Table],
        hr_version = {
          filename = "__base__/graphics/entity/inserter/hr-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = dy..DATA.Name.."-stack-filter-inserter",
	localised_name = {"looped-name.inserter-5", {"looped-name."..DATA.Name}},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-stack-filter-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/stack-filter-inserter.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    stack = true,
    filter_count = 2,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = 20000,
    energy_per_rotation = 20000,
    extension_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 4),
    rotation_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 7.5),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-basic-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 33,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
		tint = Material_Colors[DATA.Table],
        hr_version = {
          filename = "__base__/graphics/entity/inserter/hr-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = dy..DATA.Name.."-super-inserter",
	localised_name = {"looped-name.inserter-6", {"looped-name."..DATA.Name}},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-super-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/stack-filter-inserter.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    stack = true,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = 35000,
    energy_per_rotation = 35000,
    extension_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 1.25),
    rotation_speed = (DyWorld_Material_Formulas(9, DATA.Table) / 2.5),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1.5kW"
    },
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-basic-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 33,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		tint = Material_Colors[DATA.Table],
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
		tint = Material_Colors[DATA.Table],
        hr_version = {
          filename = "__base__/graphics/entity/inserter/hr-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "item",
    name = dy..DATA.Name.."-basic-inserter",
	localised_name = {"looped-name.inserter-1", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/inserter.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."inserter-basic",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-basic-inserter",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-basic-inserter",
    energy_required = 0.5,
	enabled = false,
    ingredients = {{"electronic-circuit", 2}},
    result = dy..DATA.Name.."-basic-inserter",
    result_count = 1,
  },
  {
    type = "item",
    name = dy..DATA.Name.."-long-inserter",
	localised_name = {"looped-name.inserter-2", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/long-handed-inserter.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."inserter-long",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-long-inserter",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-long-inserter",
    energy_required = 0.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-basic-inserter", 1},{dy.."gearbox", 1}},
    result = dy..DATA.Name.."-long-inserter",
    result_count = 1,
  },
  {
    type = "item",
    name = dy..DATA.Name.."-filter-inserter",
	localised_name = {"looped-name.inserter-3", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/filter-inserter.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."inserter-filter",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-filter-inserter",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-filter-inserter",
    energy_required = 0.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-basic-inserter", 1},{dy.."gearbox", 1}},
    result = dy..DATA.Name.."-filter-inserter",
    result_count = 1,
  },
  {
    type = "item",
    name = dy..DATA.Name.."-stack-inserter",
	localised_name = {"looped-name.inserter-4", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/stack-inserter.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."inserter-stack",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-stack-inserter",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-stack-inserter",
    energy_required = 0.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-basic-inserter", 1},{dy.."gearbox", 1},{"advanced-circuit", 2}},
    result = dy..DATA.Name.."-stack-inserter",
    result_count = 1,
  },
  {
    type = "item",
    name = dy..DATA.Name.."-stack-filter-inserter",
	localised_name = {"looped-name.inserter-5", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/stack-filter-inserter.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."inserter-stack-filter",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-stack-filter-inserter",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-stack-filter-inserter",
    energy_required = 0.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-stack-inserter", 1},{"processing-unit", 2}},
    result = dy..DATA.Name.."-stack-filter-inserter",
    result_count = 1,
  },
  {
    type = "item",
    name = dy..DATA.Name.."-super-inserter",
	localised_name = {"looped-name.inserter-6", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/stack-filter-inserter.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."inserter-super",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-super-inserter",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-super-inserter",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-stack-inserter", 1},{dy.."processing-logic", 2}},
    result = dy..DATA.Name.."-super-inserter",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 2}
		local result_2 = {DATA.Name, 5}
		local result_3 = {DATA.Name, 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-inserter"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-long-inserter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-filter-inserter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-stack-inserter"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-stack-filter-inserter"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-super-inserter"].ingredients, result_3)
	else
		local result_1 = {DATA.Name.."-plate", 2}
		local result_2 = {DATA.Name.."-plate", 5}
		local result_3 = {DATA.Name.."-plate", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-inserter"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-long-inserter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-filter-inserter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-stack-inserter"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-stack-filter-inserter"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-super-inserter"].ingredients, result_3)
	end
end

function DyWorld_Storage_Tanks(DATA)
data:extend(
{
  {
    type = "storage-tank",
    name = dy..DATA.Name.."-storage-tank",
	localised_name = {"looped-name.storage-tank", {"looped-name."..DATA.Name}},
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-storage-tank"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/storage-tank.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "medium-remnants",
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fluid_box =
    {
      base_area = DyWorld_Material_Formulas(4, DATA.Table),
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-1, -2} },
        { position = {2, 1} },
        { position = {1, 2} },
        { position = {-2, -1} },
      },
    },
    two_direction_only = true,
    window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
    pictures =
    {
      picture =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
          priority = "extra-high",
          frames = 2,
          width = 140,
          height = 115,
          shift = {0.6875, 0.109375},
		  tint = Material_Colors[DATA.Table],
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15
      },
      window_background =
      {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 17,
        height = 24
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      },
      gas_flow =
      {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 24,
        height = 15,
        frame_count = 60,
        axially_symmetrical = false,
        direction_count = 1,
        animation_speed = 0.25,
        hr_version =
        {
          filename = "__base__/graphics/entity/pipe/hr-steam.png",
          priority = "extra-high",
          line_length = 10,
          width = 48,
          height = 30,
          frame_count = 60,
          axially_symmetrical = false,
          animation_speed = 0.25,
          direction_count = 1
        }
      }
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
          filename = "__base__/sound/storage-tank.ogg",
          volume = 0.8
      },
      apparent_volume = 1.5,
      max_sounds_per_type = 3
    },
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {2.35938, 0.890625},
          green = {2.29688, 0.953125},
        },
        wire =
        {
          red = {-0.40625, -0.375},
          green = {-0.53125, -0.46875},
        }
      },
      {
        shadow =
        {
          red = {2.35938, 0.890625},
          green = {2.29688, 0.953125},
        },
        wire =
        {
          red = {0.46875, -0.53125},
          green = {0.375, -0.4375},
        }
      },
      {
        shadow =
        {
          red = {2.35938, 0.890625},
          green = {2.29688, 0.953125},
        },
        wire =
        {
          red = {-0.40625, -0.375},
          green = {-0.53125, -0.46875},
        }
      },
      {
        shadow =
        {
          red = {2.35938, 0.890625},
          green = {2.29688, 0.953125},
        },
        wire =
        {
          red = {0.46875, -0.53125},
          green = {0.375, -0.4375},
        }
      },
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({-0.1875, -0.375}, nil, 7),
      get_circuit_connector_sprites({0.375, -0.53125}, nil, 1),
      get_circuit_connector_sprites({-0.1875, -0.375}, nil, 7),
      get_circuit_connector_sprites({0.375, -0.53125}, nil, 1),
    },
    circuit_wire_max_distance = 9
  },
  {
    type = "item",
    name = dy..DATA.Name.."-storage-tank",
	localised_name = {"looped-name.storage-tank", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/storage-tank.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."tank-storage",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-storage-tank",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-storage-tank",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-pipe", 2}},
    result = dy..DATA.Name.."-storage-tank",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 50}
		table.insert(data.raw.recipe[dy..DATA.Name.."-storage-tank"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 40}
		table.insert(data.raw.recipe[dy..DATA.Name.."-storage-tank"].ingredients, result_1)
	end
end

function DyWorld_Power_Poles(DATA)
data:extend(
{
  {
    type = "electric-pole",
    name = dy..DATA.Name.."-power-pole",
	localised_name = {"looped-name.power-pole", {"looped-name."..DATA.Name}},
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-power-pole"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/medium-electric-pole.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -2.8}, {0.5, 0.5}},
    maximum_wire_distance = (math.ceil(Materials[DATA.Table].Density) / 1.5),
    supply_area_distance = (Materials[DATA.Table].Hardness / 1.5),
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole.png",
      priority = "high",
      width = 136,
      height = 122,
      direction_count = 4,
      shift = {1.4, -1.0},
	  tint = Material_Colors[DATA.Table]
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.55, 0.4},
          green = {2.0, 0.4},
          red = {3.05, 0.4}
        },
        wire =
        {
          copper = {-0.03, -2.5},
          green = {-0.35,-2.5},
          red = {0.25,-2.5}
        }
      },
      {
        shadow =
        {
          copper = {2.9, 0.1},
          green = {2.6, -0.15},
          red = {3.25, 0.35}
        },
        wire =
        {
          copper = {0.05, -2.75},
          green = {-0.15, -2.9},
          red = {0.25, -2.55}
        }
      },
      {
        shadow =
        {
          copper = {1.5, -0.2},
          green = {1.5, -0.55},
          red = {1.5, 0.1}
        },
        wire =
        {
          copper = {-0.43, -2.4},
          green = {-0.43, -2.63},
          red = {-0.43, -2.2}
        }
      },
      {
        shadow =
        {
          copper = {2.88, 0.2},
          green = {3.2, -0.1},
          red = {2.45, 0.4}
        },
        wire =
        {
          copper = {0, -2.7},
          green = {0.22, -2.85},
          red = {-0.24, -2.55}
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
  },
  {
    type = "electric-pole",
    name = dy..DATA.Name.."-power-relay",
	localised_name = {"looped-name.power-relay", {"looped-name."..DATA.Name}},
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-power-relay"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/big-electric-pole.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "medium-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -3}, {1, 0.5}},
    maximum_wire_distance = (math.ceil(Materials[DATA.Table].Density * 10) / 2),
    supply_area_distance = (Materials[DATA.Table].Hardness / 1.5),
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole.png",
      priority = "high",
      width = 168,
      height = 165,
      direction_count = 4,
      shift = {1.6, -1.1},
	  tint = Material_Colors[DATA.Table]
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.7, 0},
          green = {1.8, 0},
          red = {3.6, 0}
        },
        wire =
        {
          copper = {0, -3.1},
          green = {-0.6,-3.1},
          red = {0.6,-3.1}
        }
      },
      {
        shadow =
        {
          copper = {3.1, 0.2},
          green = {2.3, -0.3},
          red = {3.8, 0.6}
        },
        wire =
        {
          copper = {-0.08, -3.15},
          green = {-0.55, -3.5},
          red = {0.3, -2.87}
        }
      },
      {
        shadow =
        {
          copper = {2.9, 0.06},
          green = {3.0, -0.6},
          red = {3.0, 0.8}
        },
        wire =
        {
          copper = {-0.1, -3.1},
          green = {-0.1, -3.55},
          red = {-0.1, -2.8}
        }
      },
      {
        shadow =
        {
          copper = {3.1, 0.2},
          green = {3.8, -0.3},
          red = {2.35, 0.6}
        },
        wire =
        {
          copper = {0, -3.25},
          green = {0.45, -3.55},
          red = {-0.54, -3.0}
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
  },
  {
    type = "item",
    name = dy..DATA.Name.."-power-pole",
	localised_name = {"looped-name.power-pole", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/medium-electric-pole.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."power-pole",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-power-pole",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-power-pole",
    energy_required = 1,
	enabled = false,
    ingredients = {{"copper-cable", 4}},
    result = dy..DATA.Name.."-power-pole",
    result_count = 2,
  },
  {
    type = "item",
    name = dy..DATA.Name.."-power-relay",
	localised_name = {"looped-name.power-relay", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/big-electric-pole.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."power-relay",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-power-relay",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-power-relay",
    energy_required = 1.5,
	enabled = false,
    ingredients = {{"copper-cable", 7}},
    result = dy..DATA.Name.."-power-relay",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 10}
		local result_2 = {DATA.Name, 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-pole"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-relay"].ingredients, result_2)
	else
		local result_1 = {DATA.Name.."-plate", 8}
		local result_2 = {DATA.Name.."-plate", 12}
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-pole"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-relay"].ingredients, result_2)
	end
end

function DyWorld_Laser_Turrets(DATA)
data:extend(
{
  {
    type = "electric-turret",
    name = dy..DATA.Name.."-laser-turret",
	localised_name = {"looped-name.laser-turret", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/laser-turret.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = {mining_time = 0.5, result = dy..DATA.Name.."-laser-turret"},
    max_health = (DyWorld_Material_Formulas(3, DATA.Table) * 25),
    corpse = "medium-remnants",
    collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{ -1, -1}, {1, 1}},
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    dying_explosion = "medium-explosion",
    folding_speed = 0.05,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "801kJ",
      input_flow_limit = "9600kW",
      drain = "24kW",
      usage_priority = "primary-input"
    },
    folded_animation =
    {
      layers =
      {
        DyWorld_laser_turret_extension({frame_count=1, line_length = 1}, Material_Colors[DATA.Table]),
        DyWorld_laser_turret_extension_shadow{frame_count=1, line_length=1},
        DyWorld_laser_turret_extension_mask({frame_count=1, line_length=1}, Material_Colors[DATA.Table]),
      }
    },
    preparing_animation =
    {
      layers =
      {
        DyWorld_laser_turret_extension({}, Material_Colors[DATA.Table]),
        DyWorld_laser_turret_extension_shadow{},
        DyWorld_laser_turret_extension_mask({},  Material_Colors[DATA.Table]),
      }
    },
    prepared_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun.png",
          line_length = 8,
          width = 68,
          height = 68,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
		  tint = Material_Colors[DATA.Table],
          shift = {-0.03125, -1}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-mask.png",
          flags = { "mask" },
          line_length = 8,
          width = 54,
          height = 44,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 64,
		  tint = Material_Colors[DATA.Table],
          shift = {-0.03125, -1.3125},
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-shadow.png",
          line_length = 8,
          width = 88,
          height = 52,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          draw_as_shadow = true,
          shift = {1.5, 0}
        }
      }
    },
    folding_animation = 
    {
      layers =
      {
        DyWorld_laser_turret_extension({run_mode = "backward"}, Material_Colors[DATA.Table]),
        DyWorld_laser_turret_extension_shadow{run_mode = "backward"},
        DyWorld_laser_turret_extension_mask({run_mode = "backward"},  Material_Colors[DATA.Table]),
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
          priority = "high",
          width = 98,
          height = 82,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
		  tint = Material_Colors[DATA.Table],
          shift = {0.015625, 0.03125}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-mask.png",
          flags = { "mask" },
          line_length = 1,
          width = 54,
          height = 46,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 1,
          frame_count = 1,
		  tint = Material_Colors[DATA.Table],
          shift = {-0.046875, -0.109375},
        },
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    turret_base_has_direction = true,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "electric",
      cooldown = (60 / DyWorld_Material_Formulas(6, DATA.Table)),
      projectile_center = {-0.09375, -0.2},
      projectile_creation_distance = 1.4,
      range = DyWorld_Material_Formulas(5, DATA.Table),
      min_range = math.ceil(DyWorld_Material_Formulas(5, DATA.Table) * 0.15),
      turn_range = DyWorld_Material_Formulas(7, DATA.Table)/360,
      damage_modifier = 1,
      ammo_type =
      {
        type = "projectile",
        category = "laser-turret",
        energy_consumption = "200kJ",
        action =
        {
          {
            type = "direct",
            action_delivery =
            {
              {
                type = "projectile",
                projectile = dy..DATA.Name.."-laser",
                starting_speed = 0.35,
                range_deviation = 0.1,
				max_range = DyWorld_Material_Formulas(5, DATA.Table),
              }
            }
          }
        }
      },
      sound = make_laser_sounds()
    },
    prepare_range = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 )),
    shoot_in_prepare_state = true,
    call_for_help_radius = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 ))
  },
  {
    type = "projectile",
    name = dy..DATA.Name.."-laser",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0.05,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
       target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
			damage = {amount = DyWorld_Material_Formulas(8, DATA.Table), type = "laser"}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 5},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = Material_Colors[DATA.Table],
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    },
  },
  {
    type = "electric-turret",
    name = dy..DATA.Name.."-shotgun-laser-turret",
	localised_name = {"looped-name.shotgun-laser-turret", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/laser-turret.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = {mining_time = 0.5, result = dy..DATA.Name.."-shotgun-laser-turret"},
    max_health = (DyWorld_Material_Formulas(3, DATA.Table) * 25),
    corpse = "medium-remnants",
    collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{ -1, -1}, {1, 1}},
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    dying_explosion = "medium-explosion",
    folding_speed = 0.05,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "801kJ",
      input_flow_limit = "9600kW",
      drain = "24kW",
      usage_priority = "primary-input"
    },
    folded_animation =
    {
      layers =
      {
        DyWorld_laser_turret_extension({frame_count=1, line_length = 1}, Material_Colors[DATA.Table]),
        DyWorld_laser_turret_extension_shadow{frame_count=1, line_length=1},
        DyWorld_laser_turret_extension_mask({frame_count=1, line_length=1}, Material_Colors[DATA.Table]),
      }
    },
    preparing_animation =
    {
      layers =
      {
        DyWorld_laser_turret_extension({}, Material_Colors[DATA.Table]),
        DyWorld_laser_turret_extension_shadow{},
        DyWorld_laser_turret_extension_mask({},  Material_Colors[DATA.Table]),
      }
    },
    prepared_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun.png",
          line_length = 8,
          width = 68,
          height = 68,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
		  tint = Material_Colors[DATA.Table],
          shift = {-0.03125, -1}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-mask.png",
          flags = { "mask" },
          line_length = 8,
          width = 54,
          height = 44,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 64,
		  tint = Material_Colors[DATA.Table],
          shift = {-0.03125, -1.3125},
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-shadow.png",
          line_length = 8,
          width = 88,
          height = 52,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          draw_as_shadow = true,
          shift = {1.5, 0}
        }
      }
    },
    folding_animation = 
    {
      layers =
      {
        DyWorld_laser_turret_extension({run_mode = "backward"}, Material_Colors[DATA.Table]),
        DyWorld_laser_turret_extension_shadow{run_mode = "backward"},
        DyWorld_laser_turret_extension_mask({run_mode = "backward"},  Material_Colors[DATA.Table]),
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
          priority = "high",
          width = 98,
          height = 82,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
		  tint = Material_Colors[DATA.Table],
          shift = {0.015625, 0.03125}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-mask.png",
          flags = { "mask" },
          line_length = 1,
          width = 54,
          height = 46,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 1,
          frame_count = 1,
		  tint = Material_Colors[DATA.Table],
          shift = {-0.046875, -0.109375},
        },
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    turret_base_has_direction = true,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "electric",
      cooldown = (60 / DyWorld_Material_Formulas(6, DATA.Table)),
      projectile_center = {-0.09375, -0.2},
      projectile_creation_distance = 1.4,
      range = DyWorld_Material_Formulas(5, DATA.Table),
      min_range = math.ceil(DyWorld_Material_Formulas(5, DATA.Table) * 0.15),
      turn_range = DyWorld_Material_Formulas(7, DATA.Table)/360,
      damage_modifier = 1,
      ammo_type =
      {
        type = "projectile",
        category = "laser-turret",
        energy_consumption = "200kJ",
        action =
        {
          {
            type = "direct",
            repeat_count = 10 + math.floor(Materials[DATA.Table].Density),
            action_delivery =
            {
              {
                type = "projectile",
                projectile = dy..DATA.Name.."-shotgun-laser",
                starting_speed = 0.35,
				direction_deviation = 0.3,
				range_deviation = 0.15,
				max_range = DyWorld_Material_Formulas(5, DATA.Table),
              }
            }
          }
        }
      },
      sound = make_laser_sounds()
    },
    prepare_range = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 )),
    shoot_in_prepare_state = true,
    call_for_help_radius = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 ))
  },
  {
    type = "projectile",
    name = dy..DATA.Name.."-shotgun-laser",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0.05,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
       target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
			damage = {amount = DyWorld_Material_Formulas(8, DATA.Table), type = "laser"}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 5},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = Material_Colors[DATA.Table],
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    },
  },
  {
    type = "item",
    name = dy..DATA.Name.."-laser-turret",
	localised_name = {"looped-name.laser-turret", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/laser-turret.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."turret-laser",
    stack_size = 100,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-laser-turret",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-laser-turret",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{"electronic-circuit", 5}, {"battery", 2}},
    result = dy..DATA.Name.."-laser-turret",
    result_count = 1,
  },
  {
    type = "item",
    name = dy..DATA.Name.."-shotgun-laser-turret",
	localised_name = {"looped-name.shotgun-laser-turret", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/laser-turret.png", tint = Material_Colors[DATA.Table]}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."turret-shotgun-laser",
    stack_size = 100,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-shotgun-laser-turret",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-shotgun-laser-turret",
    energy_required = 3.5,
	enabled = false,
    ingredients = {{"electronic-circuit", 3}, {dy..DATA.Name.."-laser-turret", 1}, {"battery", 2}},
    result = dy..DATA.Name.."-shotgun-laser-turret",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-laser-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-laser-turret"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-laser-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-laser-turret"].ingredients, result_1)
	end
	DyWorld_Add_To_Tech("laser-turrets", dy..DATA.Name.."-laser-turret")
	DyWorld_Add_To_Tech("laser-turrets", dy..DATA.Name.."-shotgun-laser-turret")
end

function DyWorld_TEMPLATE(DATA)
data:extend(
{
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-ammo"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-ammo"].ingredients, result_1)
	end
end