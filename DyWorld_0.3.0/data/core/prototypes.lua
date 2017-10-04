require "data/prefix"

function DyWorld_Recipe(DATA, NMB)
  local result =
  {
    type = "recipe",
    name = dyworld_prefix..DATA.Name,
    energy_required = DATA.Recipe_Craft_Time,
	enabled = DATA.Recipe_Without_Tech,
    ingredients = {},
    result = dyworld_prefix..DATA.Name,
    result_count = DATA.Recipe_Results_Count,
  }
	if NMB then
		result.name = dyworld_prefix..DATA.Name..tostring(NMB)
		result.result = dyworld_prefix..DATA.Name..tostring(NMB)
		result.energy_required = DATA.Recipe_Craft_Time * NMB
		if DATA.Recipe_Ingredients then
			for _,z in pairs(DATA.Recipe_Ingredients) do
				table.insert(result.ingredients,z)
			end
			if NMB == 1 then
				table.insert(result.ingredients,DATA.Recipe_First_Ingredient)
			else
				table.insert(result.ingredients,{dyworld_prefix..DATA.Name..tostring(NMB-1), 1})
			end
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
    name = dyworld_prefix..DATA.Name,
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix..DATA.Subgroup,
    order = DATA.Name,
    stack_size = DATA.Stack or 200,
  }
	if DATA.Item_Place == "quickbar" then
		result.flags = {"goes-to-quickbar"}
	else
		result.flags = {"goes-to-main-inventory"}
	end
	if NMB then
		result.name = dyworld_prefix..DATA.Name..tostring(NMB)
		result.localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))}
		result.order = DATA.Name..tostring(NMB)
		result.icons = {{
			icon = DATA.Icon,
			tint = Color_Tier[NMB]
		}}
	else 
		result.icon = DATA.Icon
	end
	if DATA.Entity then
		if NMB then
			result.place_result = dyworld_prefix..DATA.Name..tostring(NMB)
		else
			result.place_result = dyworld_prefix..DATA.Name
		end
	end
  return result
end

function DyWorld_Fluid(DATA)
  local result =
  {
    type = "fluid",
    name = dyworld_prefix..DATA.Name,
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
    name = dyworld_prefix..DATA.Name,
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
    order = dyworld_prefix..DATA.Name,
  }
	if NMB then
		result.name = dyworld_prefix..DATA.Name..tostring(NMB)
		result.order = dyworld_prefix..DATA.Name..tostring(NMB)
		result.localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))}
		result.order = DATA.Name..tostring(NMB)
		result.icons = {{
			icon = DATA.Tech_Icon,
			tint = Color_Tier[NMB]
		}}
		result.effects = {{type = "unlock-recipe", recipe = dyworld_prefix..DATA.Name..tostring(NMB)}}
		if DATA.Tech_PreReq then
			if NMB == 1 then
				result.prerequisites = {DATA.Tech_PreReq}
			else
				result.prerequisites = {dyworld_prefix..DATA.Name..tostring(NMB-1)}
			end
		end
	else 
		result.icon = DATA.Tech_Icon
		result.effects = {{type = "unlock-recipe", recipe = dyworld_prefix..DATA.Name}}
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

function DyWorld_Projectile_1(DATA, NMB)
	local result =
  {
    type = "projectile",
    name = dyworld_prefix..DATA.Name,
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
		result.name = dyworld_prefix..DATA.Name..NMB
		result.action.action_delivery.target_effects.damage = {amount = (DATA.Dmg_Mod * NMB), type = DATA.DmgType}
	end
	if DATA.Piercing then
		result.name = dyworld_prefix..DATA.Name.."piercing-"..NMB
		result.piercing_damage = (DATA.Dmg_Mod * NMB)
	end
	return result
end

function DyWorld_Projectile_2(DATA, NMB)
	local result =
  {
    type = "projectile",
    name = dyworld_prefix..DATA.Name,
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
		result.name = dyworld_prefix..DATA.Name..NMB
		result.action.action_delivery.target_effects[2].damage = {amount = (DATA.Dmg_Mod * NMB), type = DATA.DmgType}
	end
	if DATA.Piercing then
		result.name = dyworld_prefix..DATA.Name.."piercing-"..NMB
		result.piercing_damage = (DATA.Dmg_Mod * NMB)
	end
  return result
end

function DyWorld_Entity_Solar_Panels(DATA, NMB)
  local result =
  {
    type = "solar-panel",
    name = dyworld_prefix..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/solar-panel.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = (0.2*NMB), mining_time = (0.5*NMB), result = dyworld_prefix..DATA.Name..tostring(NMB)},
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
    name = dyworld_prefix..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/stone-furnace.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = (0.5*NMB), result = dyworld_prefix..DATA.Name..tostring(NMB)},
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
    name = dyworld_prefix..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/electric-furnace.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = (0.5*NMB), result = dyworld_prefix..DATA.Name..tostring(NMB)},
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
    name = dyworld_prefix..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/assembling-machine-3.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = (0.2*NMB), mining_time = (0.5*NMB), result = dyworld_prefix..DATA.Name..tostring(NMB)},
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
    name = dyworld_prefix..DATA.Name..tostring(NMB),
	localised_name = {"looped-name."..DATA.Name, (tostring(NMB+1))},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/accumulator.png",
		tint = Color_Tier[NMB],
	  },
	},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = (0.2*NMB), mining_time = (0.5*NMB), result = dyworld_prefix..DATA.Name..tostring(NMB)},
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