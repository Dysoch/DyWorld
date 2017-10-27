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
      starting_area_size = 600 * 0.005,
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

function DyWorld_Transport_Belt(DATA)
data:extend(
{
  {
    type = "transport-belt",
    name = dy..DATA.Name.."-transport-belt",
    icons =
	{
	  {
		icon = "__base__/graphics/icons/transport-belt.png",
		tint = DATA.Tint,
	  },
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = dy..DATA.Name.."-transport-belt"},
    max_health = DATA.Health,
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
	  tint = DATA.Tint,
      hr_version =
      {
        filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
        priority = "extra-high",
        width = 80,
        height = 80,
        scale = 0.5,
        frame_count = 16,
        direction_count = 12,
		tint = DATA.Tint,
      }
    },
    belt_horizontal = DyWorld_basic_belt_horizontal(DATA.Tint),
    belt_vertical = DyWorld_basic_belt_vertical(DATA.Tint),
    ending_top = DyWorld_basic_belt_ending_top(DATA.Tint),
    ending_bottom = DyWorld_basic_belt_ending_bottom(DATA.Tint),
    ending_side = DyWorld_basic_belt_ending_side(DATA.Tint),
    starting_top = DyWorld_basic_belt_starting_top(DATA.Tint),
    starting_bottom = DyWorld_basic_belt_starting_bottom(DATA.Tint),
    starting_side = DyWorld_basic_belt_starting_side(DATA.Tint),
    ending_patch = DyWorld_ending_patch_prototype(DATA.Tint),
    fast_replaceable_group = "transport-belt",
    speed = (DATA.Item_Per_Sec/426.67),
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector_sprites = transport_belt_circuit_connector_sprites,
    circuit_wire_connection_point = transport_belt_circuit_wire_connection_point,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {
    type = "underground-belt",
    name = dy..DATA.Name.."-underground-belt",
    icons =
	{
	  {
		icon = "__base__/graphics/icons/underground-belt.png",
		tint = DATA.Tint,
	  },
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = dy..DATA.Name.."-underground-belt"},
    max_health = DATA.Health,
    max_distance = DATA.Range,
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
    belt_horizontal = DyWorld_basic_belt_horizontal(DATA.Tint),
    belt_vertical = DyWorld_basic_belt_vertical(DATA.Tint),
    ending_top = DyWorld_basic_belt_ending_top(DATA.Tint),
    ending_bottom = DyWorld_basic_belt_ending_bottom(DATA.Tint),
    ending_side = DyWorld_basic_belt_ending_side(DATA.Tint),
    starting_top = DyWorld_basic_belt_starting_top(DATA.Tint),
    starting_bottom = DyWorld_basic_belt_starting_bottom(DATA.Tint),
    starting_side = DyWorld_basic_belt_starting_side(DATA.Tint),
    ending_patch = DyWorld_ending_patch_prototype(DATA.Tint),
    fast_replaceable_group = "underground-belt",
    speed = (DATA.Item_Per_Sec/426.67),
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
		  tint = DATA.Tint,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5,
			tint = DATA.Tint,
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
		  tint = DATA.Tint,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            scale = 0.5,
			tint = DATA.Tint,
          }

        }

      }
    },
  },
  {
    type = "splitter",
    name = dy..DATA.Name.."-splitter",
    icons =
	{
	  {
		icon = "__base__/graphics/icons/splitter.png",
		tint = DATA.Tint,
	  },
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = dy..DATA.Name.."-splitter"},
    max_health = DATA.Health,
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
    belt_horizontal = DyWorld_basic_belt_horizontal(DATA.Tint),
    belt_vertical = DyWorld_basic_belt_vertical(DATA.Tint),
    ending_top = DyWorld_basic_belt_ending_top(DATA.Tint),
    ending_bottom = DyWorld_basic_belt_ending_bottom(DATA.Tint),
    ending_side = DyWorld_basic_belt_ending_side(DATA.Tint),
    starting_top = DyWorld_basic_belt_starting_top(DATA.Tint),
    starting_bottom = DyWorld_basic_belt_starting_bottom(DATA.Tint),
    starting_side = DyWorld_basic_belt_starting_side(DATA.Tint),
    ending_patch = DyWorld_ending_patch_prototype(DATA.Tint),
    fast_replaceable_group = "splitter",
    speed = (DATA.Item_Per_Sec/426.67),
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
		tint = DATA.Tint,
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
		  tint = DATA.Tint,
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
		tint = DATA.Tint,
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
		  tint = DATA.Tint,
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
		tint = DATA.Tint,
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
		  tint = DATA.Tint,
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
		tint = DATA.Tint,
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
		  tint = DATA.Tint,
        }
      },
    },
  },
  {
    type = "item",
    name = dy..DATA.Name.."-transport-belt",
	icons = {{icon = "__base__/graphics/icons/transport-belt.png", tint = DATA.Tint}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."transport-belt",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-transport-belt",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-underground-belt",
	icons = {{icon = "__base__/graphics/icons/underground-belt.png", tint = DATA.Tint}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."transport-underground",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-underground-belt",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-splitter",
	icons = {{icon = "__base__/graphics/icons/splitter.png", tint = DATA.Tint}},
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
    ingredients = {{dy..DATA.Name.."-transport-belt", DATA.Range}},
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
		data.raw.item[dy..DATA.Name.."-transport-belt"].localised_name = {"looped-name.belt", {"item-name."..DATA.Name}}
		data.raw.item[dy..DATA.Name.."-underground-belt"].localised_name = {"looped-name.underground-belt", {"item-name."..DATA.Name}}
		data.raw.item[dy..DATA.Name.."-splitter"].localised_name = {"looped-name.splitter", {"item-name."..DATA.Name}}
		data.raw["transport-belt"][dy..DATA.Name.."-transport-belt"].localised_name = {"looped-name.belt", {"item-name."..DATA.Name}}
		data.raw["underground-belt"][dy..DATA.Name.."-underground-belt"].localised_name = {"looped-name.underground-belt", {"item-name."..DATA.Name}}
		data.raw["splitter"][dy..DATA.Name.."-splitter"].localised_name = {"looped-name.splitter", {"item-name."..DATA.Name}}
		table.insert(data.raw.recipe[dy..DATA.Name.."-transport-belt"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-underground-belt"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-splitter"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 2}
		local result_2 = {DATA.Name.."-plate", 3}
		local result_3 = {DATA.Name.."-plate", 4}
		data.raw.item[dy..DATA.Name.."-transport-belt"].localised_name = {"looped-name.belt", {"item-name."..DATA.Name.."-plate"}}
		data.raw.item[dy..DATA.Name.."-underground-belt"].localised_name = {"looped-name.underground-belt", {"item-name."..DATA.Name.."-plate"}}
		data.raw.item[dy..DATA.Name.."-splitter"].localised_name = {"looped-name.splitter", {"item-name."..DATA.Name.."-plate"}}
		data.raw["transport-belt"][dy..DATA.Name.."-transport-belt"].localised_name = {"looped-name.belt", {"item-name."..DATA.Name.."-plate"}}
		data.raw["underground-belt"][dy..DATA.Name.."-underground-belt"].localised_name = {"looped-name.underground-belt", {"item-name."..DATA.Name.."-plate"}}
		data.raw["splitter"][dy..DATA.Name.."-splitter"].localised_name = {"looped-name.splitter", {"item-name."..DATA.Name.."-plate"}}
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
	localised_description = {"looped-name.pipe-desc", (DATA.Capacity)},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/pipe.png", 
		tint = DATA.Tint
	  }
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-pipe"},
    max_health = DATA.Health,
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
      base_area = (DATA.Capacity / 100),
      pipe_connections =
      {
        { position = {0, -1} },
        { position = {1, 0} },
        { position = {0, 1} },
        { position = {-1, 0} }
      },
    },
	vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures = DyWorld_pipepictures(DATA.Tint),
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
	localised_description = {"looped-name.pipe-to-ground-desc", (DATA.Capacity), (DATA.Range)},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/pipe-to-ground.png",
		tint = DATA.Tint
	  }
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-pipe-to-ground"},
    max_health = DATA.Health,
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
      base_area = (DATA.Capacity / 100),
      pipe_covers = DyWorld_pipecoverspictures(DATA.Tint),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, 1},
          max_underground_distance = DATA.Range
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
		tint = DATA.Tint,
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = DATA.Tint,
        }
      },
      down =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
		tint = DATA.Tint,
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = DATA.Tint,
        }
      },
      left =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
		tint = DATA.Tint,
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = DATA.Tint,
        }
      },
      right =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
		tint = DATA.Tint,
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = DATA.Tint,
        }
      },
    }
  },
  {
    type = "item",
    name = dy..DATA.Name.."-pipe",
	localised_description = {"looped-name.pipe-desc", (DATA.Capacity)},
	icons = {{icon = "__base__/graphics/icons/pipe.png", tint = DATA.Tint}},
    flags = {"goes-to-quickbar"},
    subgroup = dy.."pipe-normal",
    stack_size = 200,
	order = DATA.Name,
	place_result = dy..DATA.Name.."-pipe",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-pipe-to-ground",
	localised_description = {"looped-name.pipe-to-ground-desc", (DATA.Capacity), (DATA.Range)},
	icons = {{icon = "__base__/graphics/icons/pipe-to-ground.png", tint = DATA.Tint}},
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
    ingredients = {{dy..DATA.Name.."-pipe", DATA.Range}},
    result = dy..DATA.Name.."-pipe-to-ground",
    result_count = 2,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 2}
		local result_2 = {DATA.Name, 4}
		data.raw.item[dy..DATA.Name.."-pipe"].localised_name = {"looped-name.pipe", {"item-name."..DATA.Name}}
		data.raw.item[dy..DATA.Name.."-pipe-to-ground"].localised_name = {"looped-name.pipe-to-ground", {"item-name."..DATA.Name}}
		data.raw["pipe"][dy..DATA.Name.."-pipe"].localised_name = {"looped-name.pipe", {"item-name."..DATA.Name}}
		data.raw["pipe-to-ground"][dy..DATA.Name.."-pipe-to-ground"].localised_name = {"looped-name.pipe-to-ground", {"item-name."..DATA.Name}}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe-to-ground"].ingredients, result_2)
	else
		local result_1 = {DATA.Name.."-plate", 2}
		local result_2 = {DATA.Name.."-plate", 4}
		data.raw.item[dy..DATA.Name.."-pipe"].localised_name = {"looped-name.pipe", {"item-name."..DATA.Name.."-plate"}}
		data.raw.item[dy..DATA.Name.."-pipe-to-ground"].localised_name = {"looped-name.pipe-to-ground", {"item-name."..DATA.Name.."-plate"}}
		data.raw["pipe"][dy..DATA.Name.."-pipe"].localised_name = {"looped-name.pipe", {"item-name."..DATA.Name.."-plate"}}
		data.raw["pipe-to-ground"][dy..DATA.Name.."-pipe-to-ground"].localised_name = {"looped-name.pipe-to-ground", {"item-name."..DATA.Name.."-plate"}}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe-to-ground"].ingredients, result_2)
	end
end