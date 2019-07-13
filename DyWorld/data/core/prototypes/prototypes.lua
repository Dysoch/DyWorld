require "data/prefix"

DyWorld_TD.Module_List = {}

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
	icon_size = 32,
    flags = {},
    subgroup = dy..DATA.Subgroup,
    stack_size = DATA.Stack or 200,
  }
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

function DyWorld_Equipment_Grid(DATA)
data:extend(
{
  {
    type = "equipment-grid",
    name = dy..DATA.Name.."-equipment-grid",
    width = Round(Materials[DATA.Table].Density, 0),
    height = Round(Materials[DATA.Table].Hardness, 0),
    equipment_categories = {"armor"}
  },
  {
    type = "equipment-grid",
    name = dy..DATA.Name.."-vehicle-grid",
    width = Round(Materials[DATA.Table].Density, 0),
    height = Round(Materials[DATA.Table].Hardness, 0),
    equipment_categories = {"vehicle"}
  },
})
end

function DyWorld_Item_Ore(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name.."-ore",
	icons = 
	{
	  {
		icon = dyworld_path_icon.."ore/"..DATA.Name..".png",
		tint = Color_Tier["Dirty"]
	  }
	},
	icon_size = 32,
    flags = {},
    subgroup = dy.."metal-1-ore",
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
	icon = dyworld_path_icon.."plate/"..DATA.Name..".png",
	icon_size = 32,
    flags = {},
    subgroup = dy.."metal-2-plate",
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
    energy_required = 2.5,
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
    category = "resource",
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
	icons = 
	{
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors[DATA.Table]
	  }
	},
	icon_size = 32,
    flags = {"placeable-neutral"},
    order = DATA.Name.."-ore",
    minable =
    {
      hardness = Round(DATA.Mining_Hardness, 2),
      mining_particle = "stone-particle",
      mining_time = Round(DATA.Mining_Time, 2),
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
      richness_base = 2500,
      coverage = 0.01,
      peaks =
      {
        {
          noise_layer = DATA.Name.."-ore",
          noise_octaves_difference = -1.5,
          noise_persistence = 0.3,
        },
      },
      starting_area_size = 750 * 0.008,
      starting_area_amount = 2500
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
	if result.minable.hardness <= 1 then
		result.minable.hardness = result.minable.hardness + 1
	end
	if result.minable.mining_time <= 2 then
		result.minable.mining_time = result.minable.mining_time + 2
	end
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
    pressure_to_speed_ratio = DATA.Pressure or 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false
  }
	if DATA.Barrel then
		result.auto_barrel = true
	end
	if DATA.Gas_Temp then
		result.gas_temperature = DATA.Gas_Temp
	end
	if DATA.Pressure then
		result.pressure_to_speed_ratio = DATA.Pressure
	end
	if DATA.Flow then
		result.flow_to_energy_ratio = DATA.Flow
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

function DyWorld_Add_To_Productivity_Module(RECIPE)
	if data.raw.recipe[RECIPE] then
		table.insert(DyWorld_TD.Module_List, RECIPE)
	else
		log("Recipe " .. RECIPE .. " does not exist.")
	end
end

function DyWorld_Module_Limitation_Productivity()
    return {
        "sulfuric-acid",
        "basic-oil-processing",
        "advanced-oil-processing",
        "coal-liquefaction",
        "heavy-oil-cracking",
        "light-oil-cracking",
        "solid-fuel-from-light-oil",
        "solid-fuel-from-heavy-oil",
        "solid-fuel-from-petroleum-gas",
        "lubricant",
        "stone-brick",
        "sulfur",
        "plastic-bar",
        "uranium-processing",
        "copper-cable",
        "iron-stick",
        "iron-gear-wheel",
        "electronic-circuit",
        "advanced-circuit",
        "processing-unit",
        "engine-unit",
        "electric-engine-unit",
        "uranium-fuel-cell",
        "explosives",
        "battery",
        "flying-robot-frame",
        "low-density-structure",
        "rocket-fuel",
        "rocket-control-unit",
        "rocket-part",
		dy.."water-seperation-1",
		dy.."water-seperation-2",
		dy.."sludge-seperation",
		dy.."acid-seperation",
		dy.."fertilizer-seperation",
		dy.."basic-clean-oil-processing",
		dy.."advanced-clean-oil-processing",
		dy.."rocket-fuel",
		dy.."advanced-lubricant",
		dy.."super-lubricant",
		dy.."ground-mining",
    }
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
	  { icon = dyworld_path_icon.."belt-icon-base.png" },
      { icon = dyworld_path_icon.."belt-icon-mask.png", tint = Material_Colors[DATA.Table] },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-transport-belt"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    resistances = Material_Resistances[DATA.Table],
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
    belt_animation_set = DyWorld_basic_belt_animation_set(Material_Colors[DATA.Table]),
    fast_replaceable_group = "transport-belt",
    speed = DyWorld_Material_Formulas(1, DATA.Table, DATA.Tier, 1),
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
	  { icon = dyworld_path_icon.."under-icon-base.png" },
      { icon = dyworld_path_icon.."under-icon-mask.png", tint = Material_Colors[DATA.Table] },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-underground-belt"},
	max_health = DyWorld_Material_Formulas(3, DATA.Table),
    max_distance = DyWorld_Material_Formulas(2, DATA.Table, DATA.Tier),
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    underground_remove_belts_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    corpse = "small-remnants",
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 32,
    belt_animation_set = DyWorld_basic_belt_animation_set(Material_Colors[DATA.Table]),
    fast_replaceable_group = "transport-belt",
    speed = DyWorld_Material_Formulas(1, DATA.Table, DATA.Tier, 1.15),
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96,
          tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height =192,
            y = 192,
            tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            tint = Material_Colors[DATA.Table],
            scale = 0.5
          }

        }

      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96*3,
          tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192*3,
            tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96*2,
          tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y= 192*2,
            tint = Material_Colors[DATA.Table],
            scale = 0.5
          },

        }

      },
      back_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure-back-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            tint = Material_Colors[DATA.Table],
            scale = 0.5
          }

        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure-front-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            tint = Material_Colors[DATA.Table],
            scale = 0.5
          }

        }
      }
    },
  },
  {
    type = "splitter",
    name = dy..DATA.Name.."-splitter",
	localised_name = {"looped-name.splitter", {"looped-name."..DATA.Name}},
    icons =
	{
	  {
		icon = "__base__/graphics/icons/splitter.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-splitter"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "medium-remnants",
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 0.7,
    structure_animation_movement_cooldown = 10,
    belt_animation_set = DyWorld_basic_belt_animation_set(Material_Colors[DATA.Table]),
    fast_replaceable_group = "transport-belt",
    speed = DyWorld_Material_Formulas(1, DATA.Table, DATA.Tier, 1),
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/splitter/splitter-north.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 82,
        height = 36,
        shift = util.by_pixel(6, 0),
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 160,
          height = 70,
          shift = util.by_pixel(7, 0),
		  tint = Material_Colors[DATA.Table],
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 80,
        shift = util.by_pixel(4, -6),
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 160,
          shift = util.by_pixel(4, -6),
		  tint = Material_Colors[DATA.Table],
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/splitter/splitter-south.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 82,
        height = 32,
        shift = util.by_pixel(4, 0),
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 64,
          shift = util.by_pixel(4, 0),
		  tint = Material_Colors[DATA.Table],
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 76,
        shift = util.by_pixel(6, -4),
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 150,
          shift = util.by_pixel(6, -4),
		  tint = Material_Colors[DATA.Table],
          scale = 0.5
        }
      }
    },
  },
  {
    type = "loader",
    name = dy..DATA.Name.."-loader",
	localised_name = {"looped-name.loader", {"looped-name."..DATA.Name}},
    icons =
	{
	  { icon = dyworld_path_icon.."loader-icon-base.png" },
      { icon = dyworld_path_icon.."loader-icon-mask.png", tint = Material_Colors[DATA.Table] },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-loader"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    filter_count = 5,
    corpse = "small-remnants",
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 32,
    belt_animation_set = DyWorld_basic_belt_animation_set(Material_Colors[DATA.Table]),
    fast_replaceable_group = "transport-belt",
    speed = DyWorld_Material_Formulas(1, DATA.Table, DATA.Tier, 1),
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
		  tint = Material_Colors[DATA.Table]
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64,
		  tint = Material_Colors[DATA.Table]
        }
      }
    },
  },
  {
    type = "item",
    name = dy..DATA.Name.."-transport-belt",
	localised_name = {"looped-name.belt", {"looped-name."..DATA.Name}},
    icons =
	{
	  { icon = dyworld_path_icon.."belt-icon-base.png" },
      { icon = dyworld_path_icon.."belt-icon-mask.png", tint = Material_Colors[DATA.Table] },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-transport",
    stack_size = 200,
	order = dy..DATA.Name.."-transport-belt",
	place_result = dy..DATA.Name.."-transport-belt",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-underground-belt",
	localised_name = {"looped-name.underground-belt", {"looped-name."..DATA.Name}},
    icons =
	{
	  { icon = dyworld_path_icon.."under-icon-base.png" },
      { icon = dyworld_path_icon.."under-icon-mask.png", tint = Material_Colors[DATA.Table] },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-transport",
    stack_size = 200,
	order = dy..DATA.Name.."-underground-belt",
	place_result = dy..DATA.Name.."-underground-belt",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-splitter",
	localised_name = {"looped-name.splitter", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/splitter.png"}, Materials[DATA.Table].Icon},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-transport",
    stack_size = 200,
	order = dy..DATA.Name.."-splitter",
	place_result = dy..DATA.Name.."-splitter",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-loader",
	localised_name = {"looped-name.loader", {"looped-name."..DATA.Name}},
    icons =
	{
	  { icon = dyworld_path_icon.."loader-icon-base.png" },
      { icon = dyworld_path_icon.."loader-icon-mask.png", tint = Material_Colors[DATA.Table] },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-transport",
    stack_size = 200,
	order = dy..DATA.Name.."-loader",
	place_result = dy..DATA.Name.."-loader",
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
    ingredients = {{dy..DATA.Name.."-transport-belt", DyWorld_Material_Formulas(2, DATA.Table, DATA.Tier)}},
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
  {
    type = "recipe",
    name = dy..DATA.Name.."-loader",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-transport-belt", 2},{"electronic-circuit", 2}},
    result = dy..DATA.Name.."-loader",
    result_count = 1,
  },
})
	if DATA.Type == "Basic" or DATA.Type == "Simple_Alloy" or DATA.Type == "Alloy" or DATA.Type == "Complex_Alloy" or DATA.Type == "Super_Alloy" then
		local result_1 = {DATA.Name.."-gear-wheel", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-transport-belt"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-underground-belt"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-splitter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-loader"].ingredients, result_1)
	end
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 2}
		local result_2 = {DATA.Name, 3}
		local result_3 = {DATA.Name, 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-transport-belt"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-underground-belt"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-splitter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-loader"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 2}
		local result_2 = {dy..DATA.Name, 3}
		local result_3 = {dy..DATA.Name, 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-transport-belt"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-underground-belt"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-splitter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-loader"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 2}
		local result_2 = {DATA.Name.."-plate", 1}
		local result_3 = {DATA.Name.."-plate", 2}
		table.insert(data.raw.recipe[dy..DATA.Name.."-transport-belt"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-underground-belt"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-splitter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-loader"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-transport-belt"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-underground-belt"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-splitter"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-loader"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("logistics", dy..DATA.Name.."-transport-belt")
		DyWorld_Add_To_Tech("logistics", dy..DATA.Name.."-underground-belt")
		DyWorld_Add_To_Tech("logistics", dy..DATA.Name.."-splitter")
		DyWorld_Add_To_Tech("logistics", dy..DATA.Name.."-loader")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-transport-belt")
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-underground-belt")
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-splitter")
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-loader")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-transport-belt")
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-underground-belt")
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-splitter")
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-loader")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("logistics-4", dy..DATA.Name.."-transport-belt")
		DyWorld_Add_To_Tech("logistics-4", dy..DATA.Name.."-underground-belt")
		DyWorld_Add_To_Tech("logistics-4", dy..DATA.Name.."-splitter")
		DyWorld_Add_To_Tech("logistics-4", dy..DATA.Name.."-loader")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("logistics-5", dy..DATA.Name.."-transport-belt")
		DyWorld_Add_To_Tech("logistics-5", dy..DATA.Name.."-underground-belt")
		DyWorld_Add_To_Tech("logistics-5", dy..DATA.Name.."-splitter")
		DyWorld_Add_To_Tech("logistics-5", dy..DATA.Name.."-loader")
	end
	if (DyWorld_Material_Formulas(1, DATA.Table, DATA.Tier, 1) * 426.67) >= 100 then
		data.raw.recipe[dy..DATA.Name.."-transport-belt"].category = "crafting-with-fluid"
		data.raw.recipe[dy..DATA.Name.."-underground-belt"].category = "crafting-with-fluid"
		data.raw.recipe[dy..DATA.Name.."-splitter"].category = "crafting-with-fluid"
		data.raw.recipe[dy..DATA.Name.."-loader"].category = "crafting-with-fluid"
		local result_1 = {type = "fluid", name = dy.."super-lubricant", amount = 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-transport-belt"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-underground-belt"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-splitter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-loader"].ingredients, result_1)
	elseif (DyWorld_Material_Formulas(1, DATA.Table, DATA.Tier, 1) * 426.67) >= 50 then
		data.raw.recipe[dy..DATA.Name.."-transport-belt"].category = "crafting-with-fluid"
		data.raw.recipe[dy..DATA.Name.."-underground-belt"].category = "crafting-with-fluid"
		data.raw.recipe[dy..DATA.Name.."-splitter"].category = "crafting-with-fluid"
		data.raw.recipe[dy..DATA.Name.."-loader"].category = "crafting-with-fluid"
		local result_1 = {type = "fluid", name = dy.."advanced-lubricant", amount = 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-transport-belt"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-underground-belt"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-splitter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-loader"].ingredients, result_1)
	elseif (DyWorld_Material_Formulas(1, DATA.Table, DATA.Tier, 1) * 426.67) >= 25 then
		data.raw.recipe[dy..DATA.Name.."-transport-belt"].category = "crafting-with-fluid"
		data.raw.recipe[dy..DATA.Name.."-underground-belt"].category = "crafting-with-fluid"
		data.raw.recipe[dy..DATA.Name.."-splitter"].category = "crafting-with-fluid"
		data.raw.recipe[dy..DATA.Name.."-loader"].category = "crafting-with-fluid"
		local result_1 = {type = "fluid", name = "lubricant", amount = 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-transport-belt"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-underground-belt"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-splitter"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-loader"].ingredients, result_1)
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-transport-belt"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-transport-belt"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-underground-belt"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-underground-belt"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-splitter"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-splitter"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-loader"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-loader"].fuel_category = "chemical"
	end
end

function DyWorld_Transport_Pipe(DATA)
data:extend(
{
  {
    type = "pipe",
    name = dy..DATA.Name.."-pipe",
	localised_name = {"looped-name.pipe", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.pipe-desc", (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier))},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/pipe.png", 
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-pipe"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    resistances = Material_Resistances[DATA.Table],
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier) / 100),
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
	localised_description = {"looped-name.pipe-to-ground-desc", (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier)), (DyWorld_Material_Formulas(2, DATA.Table, DATA.Tier))},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/pipe-to-ground.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-pipe-to-ground"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier) / 100),
      pipe_covers = DyWorld_pipecoverspictures(Material_Colors[DATA.Table]),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, 1},
          max_underground_distance = DyWorld_Material_Formulas(2, DATA.Table, DATA.Tier),
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
    type = "storage-tank",
    name = dy..DATA.Name.."-one-way-pipe",
	localised_name = {"looped-name.one-way-pipe", {"looped-name."..DATA.Name}},
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-one-way-pipe"},
    icons = 
	{
	  {
		icon = dyworld_path_icon.."one-way-pipe.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    corpse = "small-remnants",
    collision_box = data.raw["pipe"]["pipe"].collision_box,
    selection_box = data.raw["pipe"]["pipe"].selection_box,
	fast_replaceable_group = data.raw["pipe"]["pipe"].fast_replaceable_group,
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier) / 100),
	  base_level = 0.1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
		{ position = {0, 1}, type = "output" },
		{ position = {0, -1}, type = "input" }
      },
    },
    two_direction_only = false,
    window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
    pictures =
    {
      picture =
	  {
		sheet =
		{
		  filename = dyworld_path_entity.."one-way-pipe.png",
          priority = "extra-high",
          frames = 4,
          width = 58,
          height = 55,
          shift = {0.28125, -0.078125},
		  tint = Material_Colors[DATA.Table],
        },
      },
      fluid_background =
      {
		filename = "__core__/graphics/empty.png",
		priority = "extra-high",
		width = 1,
		height = 1,
		frame_count = 1
	  },
      window_background =
      {
		filename = "__core__/graphics/empty.png",
		priority = "extra-high",
		width = 1,
		height = 1,
		frame_count = 1
	  },
      flow_sprite =
      {
		filename = "__core__/graphics/empty.png",
		priority = "extra-high",
		width = 1,
		height = 1,
		frame_count = 1
	  },
      gas_flow =
      {
		filename = "__core__/graphics/empty.png",
		priority = "extra-high",
		width = 1,
		height = 1,
		frame_count = 1
	  },
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = nil,
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
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = 9
  },
  {
    type = "item",
    name = dy..DATA.Name.."-one-way-pipe",
	localised_name = {"looped-name.one-way-pipe", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = dyworld_path_icon.."one-way-pipe.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-fluid",
    stack_size = 200,
	order = dy..DATA.Name.."-one-way-pipe",
	place_result = dy..DATA.Name.."-one-way-pipe",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-pipe",
	localised_name = {"looped-name.pipe", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.pipe-desc", (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier))},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/pipe.png", 
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-fluid",
    stack_size = 200,
	order = dy..DATA.Name.."-pipe",
	place_result = dy..DATA.Name.."-pipe",
  },
  {
    type = "item",
    name = dy..DATA.Name.."-pipe-to-ground",
	localised_name = {"looped-name.pipe-to-ground", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.pipe-to-ground-desc", (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier)), (DyWorld_Material_Formulas(2, DATA.Table, DATA.Tier))},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/pipe-to-ground.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-fluid",
    stack_size = 200,
	order = dy..DATA.Name.."-pipe-to-ground",
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
    ingredients = {{dy..DATA.Name.."-pipe", DyWorld_Material_Formulas(2, DATA.Table, DATA.Tier)}},
    result = dy..DATA.Name.."-pipe-to-ground",
    result_count = 2,
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-one-way-pipe",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-pipe", 2}},
    result = dy..DATA.Name.."-one-way-pipe",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 2}
		local result_2 = {DATA.Name, 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe-to-ground"].ingredients, result_2)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 2}
		local result_2 = {dy..DATA.Name, 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe-to-ground"].ingredients, result_2)
	else
		local result_1 = {DATA.Name.."-plate", 2}
		local result_2 = {DATA.Name.."-plate", 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-pipe-to-ground"].ingredients, result_2)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-pipe"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-one-way-pipe"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-pipe-to-ground"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("fluid-handling", dy..DATA.Name.."-pipe")
		DyWorld_Add_To_Tech("fluid-handling", dy..DATA.Name.."-one-way-pipe")
		DyWorld_Add_To_Tech("fluid-handling", dy..DATA.Name.."-pipe-to-ground")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("fluid-handling-2", dy..DATA.Name.."-pipe")
		DyWorld_Add_To_Tech("fluid-handling-2", dy..DATA.Name.."-one-way-pipe")
		DyWorld_Add_To_Tech("fluid-handling-2", dy..DATA.Name.."-pipe-to-ground")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("fluid-handling-3", dy..DATA.Name.."-pipe")
		DyWorld_Add_To_Tech("fluid-handling-3", dy..DATA.Name.."-one-way-pipe")
		DyWorld_Add_To_Tech("fluid-handling-3", dy..DATA.Name.."-pipe-to-ground")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("fluid-handling-4", dy..DATA.Name.."-pipe")
		DyWorld_Add_To_Tech("fluid-handling-4", dy..DATA.Name.."-one-way-pipe")
		DyWorld_Add_To_Tech("fluid-handling-4", dy..DATA.Name.."-pipe-to-ground")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("fluid-handling-5", dy..DATA.Name.."-pipe")
		DyWorld_Add_To_Tech("fluid-handling-5", dy..DATA.Name.."-one-way-pipe")
		DyWorld_Add_To_Tech("fluid-handling-5", dy..DATA.Name.."-pipe-to-ground")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-pipe"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-pipe"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-pipe-to-ground"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-pipe-to-ground"].fuel_category = "chemical"
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
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-gun-turret"},
    max_health = (25 * DyWorld_Material_Formulas(3, DATA.Table)),
    resistances = Material_Resistances[DATA.Table],
	fast_replaceable_group = "turret",
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
          width = 76,
          height = 60,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(1, -1),
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base.png",
            priority = "high",
            width = 150,
            height = 118,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
		    tint = Material_Colors[DATA.Table],
            shift = util.by_pixel(0.5, -1),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
          flags = { "mask", "low-object" },
          line_length = 1,
          width = 62,
          height = 52,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, -4),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base-mask.png",
            flags = { "mask", "low-object" },
            line_length = 1,
            width = 122,
            height = 102,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(0, -4.5),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }

      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    turret_base_has_direction = true,
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
      min_range = 0, --math.ceil(DyWorld_Material_Formulas(5, DATA.Table) * 0.15),
      turn_range = DyWorld_Material_Formulas(7, DATA.Table)/360,
      sound = make_heavy_gunshot_sounds(),
    },
    prepare_range = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + Round(DyWorld_Material_Formulas(5, DATA.Table) * 0.1, 2)),
    shoot_in_prepare_state = true,
    call_for_help_radius = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 ))
  },
  {
    type = "item",
    name = dy..DATA.Name.."-gun-turret",
	localised_name = {"looped-name.gun-turret", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/gun-turret.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare-turret",
    stack_size = 50,
	order = dy..DATA.Name.."-gun-turret",
	place_result = dy..DATA.Name.."-gun-turret",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-gun-turret",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{"electronic-circuit", Round(((Materials[DATA.Table].Density * 5) + DATA.Tier ), 0)}, {dy.."frame", DATA.Tier}},
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
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-shotgun-turret"},
    max_health = (25 * DyWorld_Material_Formulas(3, DATA.Table)),
    resistances = Material_Resistances[DATA.Table],
    corpse = "medium-remnants",
	fast_replaceable_group = "turret",
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
          width = 76,
          height = 60,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(1, -1),
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base.png",
            priority = "high",
            width = 150,
            height = 118,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
		    tint = Material_Colors[DATA.Table],
            shift = util.by_pixel(0.5, -1),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
          flags = { "mask", "low-object" },
          line_length = 1,
          width = 62,
          height = 52,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, -4),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base-mask.png",
            flags = { "mask", "low-object" },
            line_length = 1,
            width = 122,
            height = 102,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(0, -4.5),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }

      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    turret_base_has_direction = true,
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
    prepare_range = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + Round(DyWorld_Material_Formulas(5, DATA.Table) * 0.1, 2)),
    shoot_in_prepare_state = true,
    call_for_help_radius = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 ))
  },
  {
    type = "item",
    name = dy..DATA.Name.."-shotgun-turret",
	localised_name = {"looped-name.shotgun-turret", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/gun-turret.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare-turret",
    stack_size = 50,
	order = dy..DATA.Name.."-shotgun-turret",
	place_result = dy..DATA.Name.."-shotgun-turret",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-shotgun-turret",
    energy_required = 3.5,
	enabled = false,
    ingredients = {{"electronic-circuit", Round(((Materials[DATA.Table].Density * 5) + DATA.Tier ), 0)}, {dy..DATA.Name.."-gun-turret", 1}},
    result = dy..DATA.Name.."-shotgun-turret",
    result_count = 1,
  },
  {
    type = "ammo-turret",
    name = dy..DATA.Name.."-cannon-turret",
	localised_name = {"looped-name.cannon-turret", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/gun-turret.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-cannon-turret"},
    max_health = (35 * DyWorld_Material_Formulas(3, DATA.Table)),
    resistances = Material_Resistances[DATA.Table],
    corpse = "medium-remnants",
	fast_replaceable_group = "turret",
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
          width = 76,
          height = 60,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(1, -1),
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base.png",
            priority = "high",
            width = 150,
            height = 118,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
		    tint = Material_Colors[DATA.Table],
            shift = util.by_pixel(0.5, -1),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
          flags = { "mask", "low-object" },
          line_length = 1,
          width = 62,
          height = 52,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, -4),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base-mask.png",
            flags = { "mask", "low-object" },
            line_length = 1,
            width = 122,
            height = 102,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(0, -4.5),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }

      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    turret_base_has_direction = true,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "cannon-shell",
      cooldown = ((60 / DyWorld_Material_Formulas(6, DATA.Table)) * 5),
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
      range = math.ceil(DyWorld_Material_Formulas(5, DATA.Table) * 1.5),
      min_range = math.ceil(DyWorld_Material_Formulas(5, DATA.Table) * 0.3),
      turn_range = DyWorld_Material_Formulas(7, DATA.Table)/360,
      sound = make_heavy_gunshot_sounds(),
    },
    prepare_range = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + Round(DyWorld_Material_Formulas(5, DATA.Table) * 0.1, 2)),
    shoot_in_prepare_state = true,
    call_for_help_radius = math.floor(DyWorld_Material_Formulas(5, DATA.Table) + (DyWorld_Material_Formulas(5, DATA.Table) / 2 ))
  },
  {
    type = "item",
    name = dy..DATA.Name.."-cannon-turret",
	localised_name = {"looped-name.cannon-turret", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/gun-turret.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare-turret",
    stack_size = 50,
	order = dy..DATA.Name.."-cannon-turret",
	place_result = dy..DATA.Name.."-cannon-turret",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-cannon-turret",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{"advanced-circuit", Round(((Materials[DATA.Table].Density * 5) + DATA.Tier ), 0)}, {dy.."frame", DATA.Tier}},
    result = dy..DATA.Name.."-cannon-turret",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 15}
		local result_2 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-gun-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cannon-turret"].ingredients, result_2)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 15}
		local result_2 = {dy..DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-gun-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cannon-turret"].ingredients, result_2)
	else
		local result_1 = {DATA.Name.."-plate", 15}
		local result_2 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-gun-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cannon-turret"].ingredients, result_2)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-gun-turret"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-shotgun-turret"].enabled = true
		DyWorld_Add_To_Tech("turrets", dy..DATA.Name.."-cannon-turret")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("turrets", dy..DATA.Name.."-gun-turret")
		DyWorld_Add_To_Tech("turrets", dy..DATA.Name.."-shotgun-turret")
		DyWorld_Add_To_Tech("turrets-2", dy..DATA.Name.."-cannon-turret")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("turrets-2", dy..DATA.Name.."-gun-turret")
		DyWorld_Add_To_Tech("turrets-2", dy..DATA.Name.."-shotgun-turret")
		DyWorld_Add_To_Tech("turrets-3", dy..DATA.Name.."-cannon-turret")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("turrets-3", dy..DATA.Name.."-gun-turret")
		DyWorld_Add_To_Tech("turrets-3", dy..DATA.Name.."-shotgun-turret")
		DyWorld_Add_To_Tech("turrets-4", dy..DATA.Name.."-cannon-turret")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("turrets-4", dy..DATA.Name.."-gun-turret")
		DyWorld_Add_To_Tech("turrets-4", dy..DATA.Name.."-shotgun-turret")
		DyWorld_Add_To_Tech("turrets-5", dy..DATA.Name.."-cannon-turret")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("turrets-5", dy..DATA.Name.."-gun-turret")
		DyWorld_Add_To_Tech("turrets-5", dy..DATA.Name.."-shotgun-turret")
		DyWorld_Add_To_Tech("turrets-6", dy..DATA.Name.."-cannon-turret")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-gun-turret"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-gun-turret"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-shotgun-turret"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-shotgun-turret"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-cannon-turret"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-cannon-turret"].fuel_category = "chemical"
	end
end

function DyWorld_Grenade_Turret(DATA)
data:extend(
{
  {
    type = "ammo-turret",
    name = dy..DATA.Name.."-grenade-turret",
	localised_name = {"looped-name.grenade-turret", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/gun-turret.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-grenade-turret"},
    max_health = (25 * DyWorld_Material_Formulas(3, DATA.Table)),
    resistances = Material_Resistances[DATA.Table],
	fast_replaceable_group = "turret",
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
          width = 76,
          height = 60,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(1, -1),
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base.png",
            priority = "high",
            width = 150,
            height = 118,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
		    tint = Material_Colors[DATA.Table],
            shift = util.by_pixel(0.5, -1),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
          flags = { "mask", "low-object" },
          line_length = 1,
          width = 62,
          height = 52,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, -4),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base-mask.png",
            flags = { "mask", "low-object" },
            line_length = 1,
            width = 122,
            height = 102,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(0, -4.5),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }

      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    turret_base_has_direction = true,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = dy.."grenade-ammo",
      cooldown = ((60 / DyWorld_Material_Formulas(6, DATA.Table)) * 5),
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
    type = "ammo",
    name = dy..DATA.Name.."-grenade-ammo",
	localised_name = {"looped-name.ammo-grenade", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {},
    ammo_type =
    {
      category = dy.."grenade-ammo",
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
            projectile = dy..DATA.Name.."-grenade-projectile",
            starting_speed = 1,
            direction_deviation = 0.05,
            range_deviation = 0.15,
            max_range = DyWorld_Material_Formulas(5, DATA.Table),
          }
        }
      }
    },
    magazine_size = math.floor(DyWorld_Material_Formulas(7, DATA.Table)/10),
    subgroup = dy..DATA.Name.."-MS-group-warfare-ammo",
    order = dy..DATA.Name.."-grenade-ammo",
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-grenade-ammo",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-grenade", math.floor(DyWorld_Material_Formulas(7, DATA.Table)/10)}},
    result = dy..DATA.Name.."-grenade-ammo",
    result_count = 1,
  },
  {
    type = "item",
    name = dy..DATA.Name.."-grenade-turret",
	localised_name = {"looped-name.grenade-turret", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/gun-turret.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare-turret",
    stack_size = 50,
	order = dy..DATA.Name.."-grenade-turret",
	place_result = dy..DATA.Name.."-grenade-turret",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-grenade-turret",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{"electronic-circuit", 15},{dy..DATA.Name.."-gun-turret", 1}},
    result = dy..DATA.Name.."-grenade-turret",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-grenade-turret"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-grenade-turret"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-grenade-turret"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-grenade-turret"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-grenade-ammo"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("turrets", dy..DATA.Name.."-grenade-turret")
		DyWorld_Add_To_Tech("turrets", dy..DATA.Name.."-grenade-ammo")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("turrets-2", dy..DATA.Name.."-grenade-turret")
		DyWorld_Add_To_Tech("turrets-2", dy..DATA.Name.."-grenade-ammo")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("turrets-3", dy..DATA.Name.."-grenade-turret")
		DyWorld_Add_To_Tech("turrets-3", dy..DATA.Name.."-grenade-ammo")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("turrets-4", dy..DATA.Name.."-grenade-turret")
		DyWorld_Add_To_Tech("turrets-4", dy..DATA.Name.."-grenade-ammo")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("turrets-5", dy..DATA.Name.."-grenade-turret")
		DyWorld_Add_To_Tech("turrets-5", dy..DATA.Name.."-grenade-ammo")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-grenade-turret"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-grenade-turret"].fuel_category = "chemical"
		data.raw.ammo[dy..DATA.Name.."-grenade-ammo"].fuel_value = "2MJ"
		data.raw.ammo[dy..DATA.Name.."-grenade-ammo"].fuel_category = "chemical"
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
	--collision_mask = {"layer-14"},
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
          {
			type = "damage",
			damage = {amount = Round(DyWorld_Material_Formulas(8, DATA.Table) * 0.1, 2), type = "impact"}
          },
          {
			type = "damage",
			damage = {amount = Round(DyWorld_Material_Formulas(8, DATA.Table) * 0.9, 2), type = DATA.DMG_Type}
          },
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
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {},
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
    subgroup = dy..DATA.Name.."-MS-group-warfare-ammo",
    order = dy..DATA.Name.."-basic-ammo",
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-basic-ammo",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy.."gunpowder", (8 + (DATA.Tier * 2))}},
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
          {
			type = "damage",
			damage = {amount = Round(DyWorld_Material_Formulas(8, DATA.Table) * 0.1, 2), type = "impact"}
          },
          {
			type = "damage",
			damage = {amount = Round(DyWorld_Material_Formulas(8, DATA.Table) * 0.9, 2), type = DATA.DMG_Type}
          },
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
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {},
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
    subgroup = dy..DATA.Name.."-MS-group-warfare-ammo",
    order = dy..DATA.Name.."-shotgun-ammo",
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-shotgun-ammo",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy.."gunpowder", (13 + (DATA.Tier * 2))}},
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
	piercing_damage = (DyWorld_Material_Formulas(8, DATA.Table)*2),
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
		{
          {
			type = "damage",
			damage = {amount = Round((DyWorld_Material_Formulas(8, DATA.Table)*2) * 0.1, 2), type = "impact"}
          },
          {
			type = "damage",
			damage = {amount = Round((DyWorld_Material_Formulas(8, DATA.Table)*2) * 0.9, 2), type = DATA.DMG_Type}
          },
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
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {},
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
    subgroup = dy..DATA.Name.."-MS-group-warfare-ammo",
    order = dy..DATA.Name.."-basic-piercing-ammo",
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-basic-piercing-ammo",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-basic-ammo", 2}, {dy.."gunpowder", (18 + (DATA.Tier * 2))}},
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
	piercing_damage = (DyWorld_Material_Formulas(8, DATA.Table)*2),
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
		{
          {
			type = "damage",
			damage = {amount = Round((DyWorld_Material_Formulas(8, DATA.Table)*2) * 0.1, 2), type = "impact"}
          },
          {
			type = "damage",
			damage = {amount = Round((DyWorld_Material_Formulas(8, DATA.Table)*2) * 0.9, 2), type = DATA.DMG_Type}
          },
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
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {},
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
    subgroup = dy..DATA.Name.."-MS-group-warfare-ammo",
    order = dy..DATA.Name.."-shotgun-piercing-ammo",
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-shotgun-piercing-ammo",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-shotgun-ammo", 2}, {dy.."gunpowder", (23 + (DATA.Tier * 2))}},
    result = dy..DATA.Name.."-shotgun-piercing-ammo",
    result_count = 1,
  },
  {
    type = "projectile",
    name = dy..DATA.Name.."-cannon-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    direction_only = true,
    piercing_damage = (DyWorld_Material_Formulas(8, DATA.Table) * 20),
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = (DyWorld_Material_Formulas(8, DATA.Table) * 20) , type = DATA.DMG_Type}
          },
          {
            type = "damage",
            damage = {amount = (DyWorld_Material_Formulas(8, DATA.Table) * 10) , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
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
    },
  },
  {
    type = "ammo",
    name = dy..DATA.Name.."-cannon-shell",
	localised_name = {"looped-name.ammo-cannon", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/cannon-shell.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {},
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = dy..DATA.Name.."-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = DyWorld_Material_Formulas(5, DATA.Table),
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    subgroup = dy..DATA.Name.."-MS-group-warfare-ammo",
    order = dy..DATA.Name.."-cannon-shell",
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-cannon-shell",
    energy_required = 1,
	enabled = false,
    ingredients = {{"explosives", 2}, {dy.."gunpowder", (45 + (DATA.Tier * 5))}},
    result = dy..DATA.Name.."-cannon-shell",
    result_count = 1,
  },
  {
    type = "projectile",
    name = dy..DATA.Name.."-cannon-explosive-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    direction_only = true,
    piercing_damage = (DyWorld_Material_Formulas(8, DATA.Table) * 25),
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = (DyWorld_Material_Formulas(8, DATA.Table) * 25) , type = DATA.DMG_Type}
          },
          {
            type = "damage",
            damage = {amount = (DyWorld_Material_Formulas(8, DATA.Table) * 25) , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = (DyWorld_Material_Formulas(5, DATA.Table) / 2),
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = (DyWorld_Material_Formulas(8, DATA.Table) * 25), type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            }
          }
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
    },
  },
  {
    type = "ammo",
    name = dy..DATA.Name.."-cannon-explosive-shell",
	localised_name = {"looped-name.ammo-cannon-explosive", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/cannon-shell.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {},
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = dy..DATA.Name.."-cannon-explosive-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = DyWorld_Material_Formulas(5, DATA.Table),
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    subgroup = dy..DATA.Name.."-MS-group-warfare-ammo",
    order = dy..DATA.Name.."-cannon-explosive-shell",
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-cannon-explosive-shell",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-cannon-shell", 2}, {dy.."gunpowder", (75 + (DATA.Tier * 5))}},
    result = dy..DATA.Name.."-cannon-explosive-shell",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 2}
		local result_2 = {DATA.Name, 5}
		local result_3 = {DATA.Name, 4}
		local result_4 = {DATA.Name, 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-ammo"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-ammo"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-piercing-ammo"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-piercing-ammo"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cannon-shell"].ingredients, result_4)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cannon-explosive-shell"].ingredients, result_4)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 2}
		local result_2 = {dy..DATA.Name, 5}
		local result_3 = {dy..DATA.Name, 4}
		local result_4 = {dy..DATA.Name, 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-ammo"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-ammo"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-piercing-ammo"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-piercing-ammo"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cannon-shell"].ingredients, result_4)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cannon-explosive-shell"].ingredients, result_4)
	else
		local result_1 = {DATA.Name.."-plate", 2}
		local result_2 = {DATA.Name.."-plate", 5}
		local result_3 = {DATA.Name.."-plate", 4}
		local result_4 = {DATA.Name.."-plate", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-ammo"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-ammo"].ingredients, result_2)
		table.insert(data.raw.recipe[dy..DATA.Name.."-basic-piercing-ammo"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-piercing-ammo"].ingredients, result_3)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cannon-shell"].ingredients, result_4)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cannon-explosive-shell"].ingredients, result_4)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-basic-ammo"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-shotgun-ammo"].enabled = true
		DyWorld_Add_To_Tech("military", dy..DATA.Name.."-basic-piercing-ammo")
		DyWorld_Add_To_Tech("military", dy..DATA.Name.."-shotgun-piercing-ammo")
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-cannon-shell")
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-cannon-explosive-shell")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("military", dy..DATA.Name.."-basic-ammo")
		DyWorld_Add_To_Tech("military", dy..DATA.Name.."-shotgun-ammo")
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-basic-piercing-ammo")
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-shotgun-piercing-ammo")
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-cannon-shell")
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-cannon-explosive-shell")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-basic-ammo")
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-shotgun-ammo")
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-basic-piercing-ammo")
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-shotgun-piercing-ammo")
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-cannon-shell")
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-cannon-explosive-shell")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-basic-ammo")
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-shotgun-ammo")
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-basic-piercing-ammo")
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-shotgun-piercing-ammo")
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-cannon-shell")
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-cannon-explosive-shell")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-basic-ammo")
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-shotgun-ammo")
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-basic-piercing-ammo")
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-shotgun-piercing-ammo")
		DyWorld_Add_To_Tech("military-6", dy..DATA.Name.."-cannon-shell")
		DyWorld_Add_To_Tech("military-6", dy..DATA.Name.."-cannon-explosive-shell")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-basic-ammo")
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-shotgun-ammo")
		DyWorld_Add_To_Tech("military-6", dy..DATA.Name.."-basic-piercing-ammo")
		DyWorld_Add_To_Tech("military-6", dy..DATA.Name.."-shotgun-piercing-ammo")
		DyWorld_Add_To_Tech("military-7", dy..DATA.Name.."-cannon-shell")
		DyWorld_Add_To_Tech("military-7", dy..DATA.Name.."-cannon-explosive-shell")
	end
	if DATA.Name == "wood" then
		data.raw.ammo[dy..DATA.Name.."-basic-ammo"].fuel_value = "2MJ"
		data.raw.ammo[dy..DATA.Name.."-basic-ammo"].fuel_category = "chemical"
		data.raw.ammo[dy..DATA.Name.."-shotgun-ammo"].fuel_value = "2MJ"
		data.raw.ammo[dy..DATA.Name.."-shotgun-ammo"].fuel_category = "chemical"
		data.raw.ammo[dy..DATA.Name.."-basic-piercing-ammo"].fuel_value = "2MJ"
		data.raw.ammo[dy..DATA.Name.."-basic-piercing-ammo"].fuel_category = "chemical"
		data.raw.ammo[dy..DATA.Name.."-shotgun-piercing-ammo"].fuel_value = "2MJ"
		data.raw.ammo[dy..DATA.Name.."-shotgun-piercing-ammo"].fuel_category = "chemical"
		data.raw.ammo[dy..DATA.Name.."-cannon-shell"].fuel_value = "2MJ"
		data.raw.ammo[dy..DATA.Name.."-cannon-shell"].fuel_category = "chemical"
		data.raw.ammo[dy..DATA.Name.."-cannon-explosive-shell"].fuel_value = "2MJ"
		data.raw.ammo[dy..DATA.Name.."-cannon-explosive-shell"].fuel_category = "chemical"
	end
end

function DyWorld_Grenades(DATA)
data:extend(
{
  {
    type = "projectile",
    name = dy..DATA.Name.."-grenade-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "medium-explosion"
            },
            {
              type = "create-entity",
              entity_name = "small-scorchmark",
              check_buildability = true
            }
          }
        }
      },
      {
        type = "area",
        radius = (Materials[DATA.Table].Hardness),
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
            type = "damage",
            damage = {amount = (DyWorld_Material_Formulas(8, DATA.Table) * 1.5), type = "explosion"}
            },
            {
            type = "create-entity",
            entity_name = "explosion"
            }
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/grenade/grenade.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high",
	  tint = Material_Colors[DATA.Table],
    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    }
  },
  {
    type = "capsule",
    name = dy..DATA.Name.."-grenade",
	localised_name = {"looped-name.grenade", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/grenade.png",
	  },
	  Materials[DATA.Table].Icon,
	},    
    flags = {},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "grenade",
        cooldown = 20,
        projectile_creation_distance = 0.6,
        range = DyWorld_Material_Formulas(5, DATA.Table),
        ammo_type =
        {
          category = "grenade",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = dy..DATA.Name.."-grenade-projectile",
              starting_speed = 0.3,
              max_range = (DyWorld_Material_Formulas(5, DATA.Table) + 10),
              direction_deviation = 0.05,
              range_deviation = 0.15,
            }
          }
        }
      }
    },
    subgroup = dy..DATA.Name.."-MS-group-warfare",
    order = dy..DATA.Name.."-grenade",
    stack_size = 200
  },
  {
    type = "projectile",
    name = dy..DATA.Name.."-cluster-grenade-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion"
            },
            {
              type = "create-entity",
              entity_name = "small-scorchmark",
              check_buildability = true
            }
          }
        }
      },
      {
        type = "cluster",
        cluster_count = 7,
        distance = 4,
        distance_deviation = 3,
        action_delivery =
        {
          type = "projectile",
          projectile = dy..DATA.Name.."-grenade-projectile",
          direction_deviation = 0.6,
          starting_speed = 0.25,
          starting_speed_deviation = 0.3,
          max_range = (DyWorld_Material_Formulas(5, DATA.Table) + 10),
          range_deviation = 0.15,
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/grenade/grenade.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high",
	  tint = Material_Colors[DATA.Table],
    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    }
  },
  {
    type = "capsule",
    name = dy..DATA.Name.."-cluster-grenade",
	localised_name = {"looped-name.cluster-grenade", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/cluster-grenade.png",
	  },
	  Materials[DATA.Table].Icon,
	},    
    flags = {},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "grenade",
        cooldown = 20,
        projectile_creation_distance = 0.6,
        range = DyWorld_Material_Formulas(5, DATA.Table),
        ammo_type =
        {
          category = "grenade",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = dy..DATA.Name.."-cluster-grenade-projectile",
              starting_speed = 0.3,
              max_range = (DyWorld_Material_Formulas(5, DATA.Table) + 10),
              direction_deviation = 0.05,
              range_deviation = 0.15,
            }
          }
        }
      }
    },
    subgroup = dy..DATA.Name.."-MS-group-warfare",
    order = dy..DATA.Name.."-cluster-grenade",
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-grenade",
    energy_required = 1,
	enabled = false,
    ingredients = {{"coal", 10}, {dy.."gunpowder", (8 + (DATA.Tier * 2))}},
    result = dy..DATA.Name.."-grenade",
    result_count = 1,
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-cluster-grenade",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy..DATA.Name.."-grenade", 7},{"explosives", 5}, {dy.."gunpowder", (5 + (DATA.Tier * 5))}},
    result = dy..DATA.Name.."-cluster-grenade",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-grenade"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cluster-grenade"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-grenade"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cluster-grenade"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-grenade"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-cluster-grenade"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-grenade"].enabled = true
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-cluster-grenade")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("military", dy..DATA.Name.."-grenade")
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-cluster-grenade")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-grenade")
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-cluster-grenade")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-grenade")
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-cluster-grenade")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-grenade")
		DyWorld_Add_To_Tech("military-6", dy..DATA.Name.."-cluster-grenade")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-grenade")
		DyWorld_Add_To_Tech("military-7", dy..DATA.Name.."-cluster-grenade")
	end
	if DATA.Name == "wood" then
		data.raw.capsule[dy..DATA.Name.."-grenade"].fuel_value = "2MJ"
		data.raw.capsule[dy..DATA.Name.."-grenade"].fuel_category = "chemical"
		data.raw.capsule[dy..DATA.Name.."-cluster-grenade"].fuel_value = "2MJ"
		data.raw.capsule[dy..DATA.Name.."-cluster-grenade"].fuel_category = "chemical"
	end
end

function DyWorld_Rockets(DATA)
data:extend(
{
  {
    type = "projectile",
    name = dy..DATA.Name.."-rocket-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
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
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = {amount = Round(((DyWorld_Material_Formulas(8, DATA.Table) * 2.5) * 0.05), 2), type = "impact"}
          },
          {
            type = "damage",
            damage = {amount = Round(((DyWorld_Material_Formulas(8, DATA.Table) * 2.5) * 0.20), 2), type = DATA.DMG_Type}
          },
          {
            type = "damage",
            damage = {amount = Round(((DyWorld_Material_Formulas(8, DATA.Table) * 2.5) * 0.75), 2), type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = DATA.Tier + 0.5,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = Round(((DyWorld_Material_Formulas(8, DATA.Table) * 0.5) * 0.05), 2), type = "impact"}
                  },
                  {
                    type = "damage",
                    damage = {amount = Round(((DyWorld_Material_Formulas(8, DATA.Table) * 0.5) * 0.2), 2), type = DATA.DMG_Type}
                  },
                  {
                    type = "damage",
                    damage = {amount = Round(((DyWorld_Material_Formulas(8, DATA.Table) * 0.5) * 0.75), 2), type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            },
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 8,
      line_length = 8,
      width = 9,
      height = 35,
      shift = {0, 0},
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      width = 7,
      height = 24,
      priority = "high",
      shift = {0, 0}
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, -1},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  },
  {
    type = "ammo",
    name = dy..DATA.Name.."-rocket",
	localised_name = {"looped-name.rocket", {"looped-name."..DATA.Name}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/rocket.png",
	  },
	  Materials[DATA.Table].Icon,
	},  
    icon_size = 32,  
    flags = {},
    ammo_type =
    {
      category = "rocket",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = dy..DATA.Name.."-rocket-projectile",
          starting_speed = 0.1,
          max_range = (DyWorld_Material_Formulas(5, DATA.Table) + 10),
		  direction_deviation = 0.05,
          range_deviation = 0.15,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = dy..DATA.Name.."-MS-group-warfare-ammo",
    order = dy..DATA.Name.."-rocket",
    magazine_size = Round((DyWorld_Material_Formulas(7, DATA.Table) / 2), 0),
    stack_size = 200
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-rocket",
    energy_required = 1,
	enabled = false,
    ingredients = {{"electronic-circuit", 1},{"explosives", 1}, {dy.."gunpowder", (90 + (DATA.Tier * 10))}},
    result = dy..DATA.Name.."-rocket",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-rocket"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-rocket"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-rocket"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-rocket")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-rocket")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-rocket")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-rocket")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("military-6", dy..DATA.Name.."-rocket")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("military-7", dy..DATA.Name.."-rocket")
	end
	if DATA.Name == "wood" then
		data.raw.ammo[dy..DATA.Name.."-rocket"].fuel_value = "2MJ"
		data.raw.ammo[dy..DATA.Name.."-rocket"].fuel_category = "chemical"
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
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    collision_mask = { "ground-tile", "object-layer" },
    fluid_box_tile_collision_test = { "ground-tile" },
    adjacent_tile_collision_test = { "water-tile" },
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-offshore-pump"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    fluid = "water",
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.6, -1.05}, {0.6, 0.3}},
    selection_box = {{-1, -1.49}, {1, 0.49}},
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier) / 100),
      base_level = 1,
      base_level = 1,
      pipe_covers = pipecoverspictures(),
      production_type = "output",
      pipe_connections =
      {
        {
          position = {0, 1},
          type = "output"
        },
      },
    },
    pumping_speed = (DyWorld_Material_Formulas(21, DATA.Table, DATA.Tier)),
    tile_width = 1,
    tile_height = 1,
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
    placeable_position_visualization =
    {
      filename = "__core__/graphics/cursor-boxes-32x32.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5,
      x = 3*64
    },
    circuit_wire_connection_points = circuit_connector_definitions["offshore-pump"].points,
    circuit_connector_sprites = circuit_connector_definitions["offshore-pump"].sprites,
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
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-pump"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    fast_replaceable_group = "pipe",
    corpse = "small-remnants",
    collision_box = {{-0.29, -0.79}, {0.29, 0.79}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    resistances = Material_Resistances[DATA.Table],
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier) / 100),
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
    energy_usage = DyWorld_Material_Formulas(20, DATA.Table, DATA.Tier, 1),
    pumping_speed = (DyWorld_Material_Formulas(21, DATA.Table, DATA.Tier) * DATA.Tier),
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
    circuit_wire_connection_points = circuit_connector_definitions["pump"].points,
    circuit_connector_sprites = circuit_connector_definitions["pump"].sprites,
    circuit_wire_max_distance = math.floor(Materials[DATA.Table].Density)
  },
  {
    type = "item",
    name = dy..DATA.Name.."-pump",
	localised_name = {"looped-name.pump", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/pump.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-fluid",
    stack_size = 200,
	order = dy..DATA.Name.."-pump",
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
	icons = {{icon = "__base__/graphics/icons/offshore-pump.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-fluid",
    stack_size = 200,
	order = dy..DATA.Name.."-offshore-pump",
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
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pump"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-offshore-pump"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 8}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pump"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-offshore-pump"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-pump"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-offshore-pump"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("fluid-handling", dy..DATA.Name.."-pump")
		DyWorld_Add_To_Tech("fluid-handling", dy..DATA.Name.."-offshore-pump")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("fluid-handling-2", dy..DATA.Name.."-pump")
		DyWorld_Add_To_Tech("fluid-handling-2", dy..DATA.Name.."-offshore-pump")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("fluid-handling-3", dy..DATA.Name.."-pump")
		DyWorld_Add_To_Tech("fluid-handling-3", dy..DATA.Name.."-offshore-pump")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("fluid-handling-4", dy..DATA.Name.."-pump")
		DyWorld_Add_To_Tech("fluid-handling-4", dy..DATA.Name.."-offshore-pump")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("fluid-handling-5", dy..DATA.Name.."-pump")
		DyWorld_Add_To_Tech("fluid-handling-5", dy..DATA.Name.."-offshore-pump")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-pump"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-pump"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-offshore-pump"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-offshore-pump"].fuel_category = "chemical"
	end
end

function DyWorld_Inserters(DATA)
data:extend(
{
  {
    type = "inserter",
    name = dy..DATA.Name.."-basic-inserter",
	localised_name = {"looped-name.inserter-1", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 10)*50)},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-basic-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/inserter.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "5000J",
    energy_per_rotation = "5000J",
    extension_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 7.5),
    rotation_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 10),
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
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = dy..DATA.Name.."-long-inserter",
	localised_name = {"looped-name.inserter-2", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 10)*50)},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-long-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/long-handed-inserter.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -2},
    insert_position = {0, 2.2},
    energy_per_movement = "5kJ",
    energy_per_rotation = "5kJ",
    extension_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 7.5),
    rotation_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 10),
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
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = dy..DATA.Name.."-filter-inserter",
	localised_name = {"looped-name.inserter-3", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 10)*50)},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-filter-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/filter-inserter.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "8kJ",
    energy_per_rotation = "8kJ",
    extension_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 7.5),
    rotation_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 10),
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
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = dy..DATA.Name.."-stack-inserter",
	localised_name = {"looped-name.inserter-4", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 6)*50)},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-stack-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/stack-inserter.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    stack = true,
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "20kJ",
    energy_per_rotation = "20kJ",
    extension_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 4.5),
    rotation_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 6),
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
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = dy..DATA.Name.."-stack-filter-inserter",
	localised_name = {"looped-name.inserter-5", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 6)*50)},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-stack-filter-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/stack-filter-inserter.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    stack = true,
    filter_count = 2,
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "20kJ",
    energy_per_rotation = "20kJ",
    extension_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 4.5),
    rotation_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 6),
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
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = dy..DATA.Name.."-super-inserter",
	localised_name = {"looped-name.inserter-6", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 2)*50)},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-super-inserter"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/stack-filter-inserter.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    allow_custom_vectors = false,
    stack = true,
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "35kJ",
    energy_per_rotation = "35kJ",
    extension_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 1.5),
    rotation_speed = DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 2),
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
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "item",
    name = dy..DATA.Name.."-basic-inserter",
	localised_name = {"looped-name.inserter-1", {"looped-name."..DATA.Name}},
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 10)*50)},
	icons = {{icon = "__base__/graphics/icons/inserter.png"}, Materials[DATA.Table].Icon },
    flags = {},
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
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 10)*50)},
	icons = {{icon = "__base__/graphics/icons/long-handed-inserter.png"}, Materials[DATA.Table].Icon },
    flags = {},
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
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 10)*50)},
	icons = {{icon = "__base__/graphics/icons/filter-inserter.png"}, Materials[DATA.Table].Icon },
    flags = {},
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
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 6)*50)},
	icons = {{icon = "__base__/graphics/icons/stack-inserter.png"}, Materials[DATA.Table].Icon },
    flags = {},
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
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 6)*50)},
	icons = {{icon = "__base__/graphics/icons/stack-filter-inserter.png"}, Materials[DATA.Table].Icon },
    flags = {},
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
	localised_description = {"looped-name.inserter-desc", (DyWorld_Material_Formulas(9, DATA.Table, DATA.Tier, 2)*50)},
	icons = {{icon = "__base__/graphics/icons/stack-filter-inserter.png"}, Materials[DATA.Table].Icon },
    flags = {},
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
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 2}
		local result_2 = {dy..DATA.Name, 5}
		local result_3 = {dy..DATA.Name, 10}
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
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-basic-inserter"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-long-inserter"].enabled = true
		data.raw.recipe[dy..DATA.Name.."-filter-inserter"].enabled = true
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-stack-inserter")
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-stack-filter-inserter")
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-super-inserter")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("logistics", dy..DATA.Name.."-basic-inserter")
		DyWorld_Add_To_Tech("logistics", dy..DATA.Name.."-long-inserter")
		DyWorld_Add_To_Tech("logistics", dy..DATA.Name.."-filter-inserter")
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-stack-inserter")
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-stack-filter-inserter")
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-super-inserter")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-basic-inserter")
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-long-inserter")
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-filter-inserter")
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-stack-inserter")
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-stack-filter-inserter")
		DyWorld_Add_To_Tech("logistics-4", dy..DATA.Name.."-super-inserter")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-basic-inserter")
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-long-inserter")
		DyWorld_Add_To_Tech("logistics-3", dy..DATA.Name.."-filter-inserter")
		DyWorld_Add_To_Tech("logistics-4", dy..DATA.Name.."-stack-inserter")
		DyWorld_Add_To_Tech("logistics-4", dy..DATA.Name.."-stack-filter-inserter")
		DyWorld_Add_To_Tech("logistics-5", dy..DATA.Name.."-super-inserter")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("logistics-4", dy..DATA.Name.."-basic-inserter")
		DyWorld_Add_To_Tech("logistics-4", dy..DATA.Name.."-long-inserter")
		DyWorld_Add_To_Tech("logistics-4", dy..DATA.Name.."-filter-inserter")
		DyWorld_Add_To_Tech("logistics-5", dy..DATA.Name.."-stack-inserter")
		DyWorld_Add_To_Tech("logistics-5", dy..DATA.Name.."-stack-filter-inserter")
		DyWorld_Add_To_Tech("logistics-6", dy..DATA.Name.."-super-inserter")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("logistics-5", dy..DATA.Name.."-basic-inserter")
		DyWorld_Add_To_Tech("logistics-5", dy..DATA.Name.."-long-inserter")
		DyWorld_Add_To_Tech("logistics-5", dy..DATA.Name.."-filter-inserter")
		DyWorld_Add_To_Tech("logistics-6", dy..DATA.Name.."-stack-inserter")
		DyWorld_Add_To_Tech("logistics-6", dy..DATA.Name.."-stack-filter-inserter")
		DyWorld_Add_To_Tech("logistics-7", dy..DATA.Name.."-super-inserter")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-basic-inserter"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-basic-inserter"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-long-inserter"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-long-inserter"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-filter-inserter"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-filter-inserter"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-stack-inserter"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-stack-inserter"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-stack-filter-inserter"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-stack-filter-inserter"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-super-inserter"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-super-inserter"].fuel_category = "chemical"
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
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-storage-tank"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/storage-tank.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    corpse = "medium-remnants",
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "storage-tank",
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(18, DATA.Table) * settings.startup["DyWorld_Stack_Size_Mult"].value),
	  base_level = 0.8,
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
        sheets =
        {
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
            priority = "extra-high",
            frames = 2,
            width = 110,
            height = 108,
            shift = util.by_pixel(0, 4),
		    tint = Material_Colors[DATA.Table],
            hr_version = {
              filename = "__base__/graphics/entity/storage-tank/hr-storage-tank.png",
              priority = "extra-high",
              frames = 2,
              width = 219,
		      tint = Material_Colors[DATA.Table],
              height = 215,
              shift = util.by_pixel(-0.25, 3.75),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank-shadow.png",
            priority = "extra-high",
            frames = 2,
            width = 146,
            height = 77,
            shift = util.by_pixel(30, 22.5),
            draw_as_shadow = true,
            hr_version = {
              filename = "__base__/graphics/entity/storage-tank/hr-storage-tank-shadow.png",
              priority = "extra-high",
              frames = 2,
              width = 291,
              height = 153,
              shift = util.by_pixel(29.75, 22.25),
              scale = 0.5,
              draw_as_shadow = true
            }
          }
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
        height = 24,
        hr_version = {
          filename = "__base__/graphics/entity/storage-tank/hr-window-background.png",
          priority = "extra-high",
          width = 34,
          height = 48,
          scale = 0.5
        }
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
    circuit_wire_connection_points = circuit_connector_definitions["storage-tank"].points,
    circuit_connector_sprites = circuit_connector_definitions["storage-tank"].sprites,
    circuit_wire_max_distance = 9
  },
  {
    type = "item",
    name = dy..DATA.Name.."-storage-tank",
	localised_name = {"looped-name.storage-tank", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/storage-tank.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-fluid",
    stack_size = 200,
	order = dy..DATA.Name.."-storage-tank",
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
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 50}
		table.insert(data.raw.recipe[dy..DATA.Name.."-storage-tank"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 40}
		table.insert(data.raw.recipe[dy..DATA.Name.."-storage-tank"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-storage-tank"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("fluid-handling", dy..DATA.Name.."-storage-tank")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("fluid-handling-2", dy..DATA.Name.."-storage-tank")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("fluid-handling-3", dy..DATA.Name.."-storage-tank")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("fluid-handling-4", dy..DATA.Name.."-storage-tank")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("fluid-handling-5", dy..DATA.Name.."-storage-tank")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-storage-tank"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-storage-tank"].fuel_category = "chemical"
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
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-power-pole"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/medium-electric-pole.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -2.8}, {0.5, 0.5}},
    maximum_wire_distance = DyWorld_Material_Formulas(12, DATA.Table, DATA.Tier),
    supply_area_distance = DyWorld_Material_Formulas(11, DATA.Table, DATA.Tier),
	fast_replaceable_group = "pole",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole.png",
          priority = "extra-high",
          width = 40,
          height = 124,
          direction_count = 4,
          shift = util.by_pixel(4, -44),
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/medium-electric-pole/hr-medium-electric-pole.png",
            priority = "extra-high",
            width = 84,
            height = 252,
            direction_count = 4,
            shift = util.by_pixel(3.5, -44),
		    tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole-shadow.png",
          priority = "extra-high",
          width = 140,
          height = 32,
          direction_count = 4,
          shift = util.by_pixel(56, -1),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/medium-electric-pole/hr-medium-electric-pole-shadow.png",
            priority = "extra-high",
            width = 280,
            height = 64,
            direction_count = 4,
            shift = util.by_pixel(56.5, -1),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(246, -2),
          green = util.by_pixel_hr(201, -2)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(43, -179),
          green = util.by_pixel_hr(-15, -185)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(230, 10),
          green = util.by_pixel_hr(196, -23)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(27, -167),
          green = util.by_pixel_hr(-9, -200)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(208, 12),
          green = util.by_pixel_hr(217, -30)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(5, -166),
          green = util.by_pixel_hr(13, -206)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(195, 1),
          green = util.by_pixel_hr(238, -23)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(-12, -175),
          green = util.by_pixel_hr(36, -199)
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
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-power-relay"},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/big-electric-pole.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "medium-remnants",
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -3}, {1, 0.5}},
    maximum_wire_distance = 64,
    supply_area_distance = DyWorld_Material_Formulas(11, DATA.Table, DATA.Tier),
	fast_replaceable_group = "relay",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
	pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole.png",
          priority = "extra-high",
          width = 76,
          height = 156,
          direction_count = 4,
          shift = util.by_pixel(1, -51),
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/big-electric-pole/hr-big-electric-pole.png",
            priority = "extra-high",
            width = 148,
            height = 312,
            direction_count = 4,
            shift = util.by_pixel(0, -51),
		    tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole-shadow.png",
          priority = "extra-high",
          width = 188,
          height = 48,
          direction_count = 4,
          shift = util.by_pixel(60, 0),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/big-electric-pole/hr-big-electric-pole-shadow.png",
            priority = "extra-high",
            width = 374,
            height = 94,
            direction_count = 4,
            shift = util.by_pixel(60, 0),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel_hr(245.0, -34.0),
          red = util.by_pixel_hr(301.0, -0.0),
          green = util.by_pixel_hr(206.0, -0.0)
        },
        wire =
        {
          copper = util.by_pixel_hr(0, -246.0),
          red = util.by_pixel_hr(58.0, -211.0),
          green = util.by_pixel_hr(-58.0, -211.0)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(279.0, -24.0),
          red = util.by_pixel_hr(284.0, 28.0),
          green = util.by_pixel_hr(204.0, -31.0)
        },
        wire =
        {
          copper = util.by_pixel_hr(34.0, -235.0),
          red = util.by_pixel_hr(41.0, -183.0),
          green = util.by_pixel_hr(-40.0, -240.0)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(292.0, 0.0),
          red = util.by_pixel_hr(244.0, 41.0),
          green = util.by_pixel_hr(244.0, -41.0)
        },
        wire =
        {
          copper = util.by_pixel_hr(47.0, -212.0),
          red = util.by_pixel_hr(1.0, -170.0),
          green = util.by_pixel_hr(1.0, -251.0)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(277.0, 23.0),
          red = util.by_pixel_hr(204.0, 30.0),
          green = util.by_pixel_hr(286.0, -29.0)
        },
        wire =
        {
          copper = util.by_pixel_hr(33.0, -188.0),
          red = util.by_pixel_hr(-41.0, -182.5),
          green = util.by_pixel_hr(41.0, -239.0)
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
	icons = {{icon = "__base__/graphics/icons/medium-electric-pole.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-power",
    stack_size = 200,
	order = dy..DATA.Name.."-power-pole",
	place_result = dy..DATA.Name.."-power-pole",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-power-pole",
    energy_required = 1,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-power-pole",
    result_count = 2,
  },
  {
    type = "item",
    name = dy..DATA.Name.."-power-relay",
	localised_name = {"looped-name.power-relay", {"looped-name."..DATA.Name}},
	icons = {{icon = "__base__/graphics/icons/big-electric-pole.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-power",
    stack_size = 200,
	order = dy..DATA.Name.."-power-relay",
	place_result = dy..DATA.Name.."-power-relay",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-power-relay",
    energy_required = 1.5,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-power-relay",
    result_count = 1,
  },
})
	if DATA.Type == "Basic" or DATA.Type == "Simple_Alloy" or DATA.Type == "Alloy" or DATA.Type == "Complex_Alloy" or DATA.Type == "Super_Alloy" then
		local result_1 = {DATA.Name.."-cable", 4}
		local result_2 = {DATA.Name.."-cable", 9}
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-pole"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-relay"].ingredients, result_2)	
	else
		local result_1 = {"copper-cable", 4}
		local result_2 = {"copper-cable", 9}
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-pole"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-relay"].ingredients, result_2)	
	end
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 10}
		local result_2 = {DATA.Name, 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-pole"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-relay"].ingredients, result_2)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 10}
		local result_2 = {dy..DATA.Name, 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-pole"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-relay"].ingredients, result_2)
	else
		local result_1 = {DATA.Name.."-plate", 8}
		local result_2 = {DATA.Name.."-plate", 12}
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-pole"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-power-relay"].ingredients, result_2)
	end
	if DATA.Type == "Primitive" or DATA.Name == "iron" or DATA.Name == "copper" then
		data.raw.recipe[dy..DATA.Name.."-power-pole"].enabled = true
		DyWorld_Add_To_Tech("electric-energy-distribution-1", dy..DATA.Name.."-power-relay")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("electric-energy-distribution-1", dy..DATA.Name.."-power-pole")
		DyWorld_Add_To_Tech("electric-energy-distribution-2", dy..DATA.Name.."-power-relay")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("electric-energy-distribution-2", dy..DATA.Name.."-power-pole")
		DyWorld_Add_To_Tech("electric-energy-distribution-3", dy..DATA.Name.."-power-relay")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("electric-energy-distribution-3", dy..DATA.Name.."-power-pole")
		DyWorld_Add_To_Tech("electric-energy-distribution-4", dy..DATA.Name.."-power-relay")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("electric-energy-distribution-4", dy..DATA.Name.."-power-pole")
		DyWorld_Add_To_Tech("electric-energy-distribution-5", dy..DATA.Name.."-power-relay")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("electric-energy-distribution-5", dy..DATA.Name.."-power-pole")
		DyWorld_Add_To_Tech("electric-energy-distribution-6", dy..DATA.Name.."-power-relay")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-power-pole"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-power-pole"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-power-relay"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-power-relay"].fuel_category = "chemical"
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
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-laser-turret"},
    max_health = (DyWorld_Material_Formulas(3, DATA.Table) * 25),
    resistances = Material_Resistances[DATA.Table],
    corpse = "medium-remnants",
	fast_replaceable_group = "turret",
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
        laser_turret_shooting(),
        laser_turret_shooting_shadow(),
        laser_turret_shooting_mask()
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
          width = 70,
          height = 52,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, 2),
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base.png",
            priority = "high",
            width = 138,
            height = 104,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(-0.5, 2),
		    tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-shadow.png",
          line_length = 1,
          width = 66,
          height = 42,
          draw_as_shadow = true,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(6, 3),
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base-shadow.png",
            line_length = 1,
            width = 132,
            height = 82,
            draw_as_shadow = true,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(6, 3),
            scale = 0.5
          }
        }
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
      min_range = DATA.Tier,
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
    prepare_range = math.floor(DyWorld_Material_Formulas(5, DATA.Table) - Round(DyWorld_Material_Formulas(5, DATA.Table) * 0.1, 2)),
    shoot_in_prepare_state = true,
    call_for_help_radius = math.floor(DyWorld_Material_Formulas(5, DATA.Table) - (DyWorld_Material_Formulas(5, DATA.Table) / 2 ))
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
			damage = {amount = Round(DyWorld_Material_Formulas(8, DATA.Table) * 0.01, 0), type = "electric"}
          },
          {
            type = "damage",
			damage = {amount = Round(DyWorld_Material_Formulas(8, DATA.Table) * 0.99, 0), type = "laser"}
          },
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
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-shotgun-laser-turret"},
    max_health = (DyWorld_Material_Formulas(3, DATA.Table) * 25),
    resistances = Material_Resistances[DATA.Table],
    corpse = "medium-remnants",
	fast_replaceable_group = "turret",
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
        laser_turret_shooting(),
        laser_turret_shooting_shadow(),
        laser_turret_shooting_mask()
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
          width = 70,
          height = 52,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, 2),
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base.png",
            priority = "high",
            width = 138,
            height = 104,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(-0.5, 2),
		    tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-shadow.png",
          line_length = 1,
          width = 66,
          height = 42,
          draw_as_shadow = true,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(6, 3),
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base-shadow.png",
            line_length = 1,
            width = 132,
            height = 82,
            draw_as_shadow = true,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(6, 3),
            scale = 0.5
          }
        }
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
      min_range = DATA.Tier,
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
            repeat_count = 10 + DATA.Tier,
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
    prepare_range = math.floor(DyWorld_Material_Formulas(5, DATA.Table) - Round(DyWorld_Material_Formulas(5, DATA.Table) * 0.1, 2)),
    shoot_in_prepare_state = true,
    call_for_help_radius = math.floor(DyWorld_Material_Formulas(5, DATA.Table) - (DyWorld_Material_Formulas(5, DATA.Table) / 2 ))
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
			damage = {amount = Round(DyWorld_Material_Formulas(8, DATA.Table) * 0.01, 0), type = "electric"}
          },
          {
            type = "damage",
			damage = {amount = Round(DyWorld_Material_Formulas(8, DATA.Table) * 0.99, 0), type = "laser"}
          },
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
	icons = {{icon = "__base__/graphics/icons/laser-turret.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare-turret",
    stack_size = 100,
	order = dy..DATA.Name.."-laser-turret",
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
	icons = {{icon = "__base__/graphics/icons/laser-turret.png"}, Materials[DATA.Table].Icon },
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare-turret",
    stack_size = 100,
	order = dy..DATA.Name.."-shotgun-laser-turret",
	place_result = dy..DATA.Name.."-shotgun-laser-turret",
  },
  {
    type = "recipe",
    name = dy..DATA.Name.."-shotgun-laser-turret",
    energy_required = 3.5,
	enabled = false,
    ingredients = {{"advanced-circuit", 3}, {dy..DATA.Name.."-laser-turret", 1}, {"battery", 2}},
    result = dy..DATA.Name.."-shotgun-laser-turret",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-laser-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-laser-turret"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 20}
		table.insert(data.raw.recipe[dy..DATA.Name.."-laser-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-laser-turret"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-laser-turret"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-shotgun-laser-turret"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("laser-turrets", dy..DATA.Name.."-laser-turret")
		DyWorld_Add_To_Tech("laser-turrets-2", dy..DATA.Name.."-shotgun-laser-turret")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("laser-turrets-2", dy..DATA.Name.."-laser-turret")
		DyWorld_Add_To_Tech("laser-turrets-3", dy..DATA.Name.."-shotgun-laser-turret")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("laser-turrets-3", dy..DATA.Name.."-laser-turret")
		DyWorld_Add_To_Tech("laser-turrets-4", dy..DATA.Name.."-shotgun-laser-turret")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("laser-turrets-4", dy..DATA.Name.."-laser-turret")
		DyWorld_Add_To_Tech("laser-turrets-5", dy..DATA.Name.."-shotgun-laser-turret")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("laser-turrets-5", dy..DATA.Name.."-laser-turret")
		DyWorld_Add_To_Tech("laser-turrets-6", dy..DATA.Name.."-shotgun-laser-turret")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("laser-turrets-6", dy..DATA.Name.."-laser-turret")
		DyWorld_Add_To_Tech("laser-turrets-7", dy..DATA.Name.."-shotgun-laser-turret")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-laser-turret"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-laser-turret"].fuel_category = "chemical"
		data.raw.item[dy..DATA.Name.."-shotgun-laser-turret"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-shotgun-laser-turret"].fuel_category = "chemical"
	end
end

function DyWorld_Mining_Tool(DATA)
data:extend(
{
  {
    type = "mining-tool",
	name = dy..DATA.Name.."-mining-tool",
	localised_name = {"looped-name.mining-tool", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/steel-axe.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
            type = "damage",
            damage = { amount = (DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier) + DATA.Tier) , type = DATA.DMG_Type}
        }
      }
    },
    durability = (DyWorld_Material_Formulas(3, DATA.Table) * 25),
    subgroup = dy.."mining-tool",
    order = DATA.Name,
    speed = (DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier) + DATA.Tier),
    stack_size = 25,
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-mining-tool",
    energy_required = 1,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-mining-tool",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mining-tool"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mining-tool"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mining-tool"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-mining-tool"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech(dy.."mining-tools-1", dy..DATA.Name.."-mining-tool")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech(dy.."mining-tools-2", dy..DATA.Name.."-mining-tool")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech(dy.."mining-tools-3", dy..DATA.Name.."-mining-tool")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech(dy.."mining-tools-4", dy..DATA.Name.."-mining-tool")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech(dy.."mining-tools-5", dy..DATA.Name.."-mining-tool")
	end
	if DATA.Name == "wood" then
		data.raw["mining-tool"][dy..DATA.Name.."-mining-tool"].fuel_value = "2MJ"
		data.raw["mining-tool"][dy..DATA.Name.."-mining-tool"].fuel_category = "chemical"
	end
end

function DyWorld_Repair_Tool(DATA)
data:extend(
{
  {
    type = "repair-tool",
	name = dy..DATA.Name.."-repair-tool",
	localised_name = {"looped-name.repair-tool", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/repair-pack.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy.."repair-tool",
    order = DATA.Name,
    speed = (DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier) + DATA.Tier),
    durability = (DyWorld_Material_Formulas(3, DATA.Table) * 25),
    stack_size = 100
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-repair-tool",
    energy_required = 1,
	enabled = false,
    ingredients = {{"electronic-circuit", 1}},
    result = dy..DATA.Name.."-repair-tool",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-repair-tool"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-repair-tool"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-repair-tool"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-repair-tool"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech(dy.."repair-tools-1", dy..DATA.Name.."-repair-tool")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech(dy.."repair-tools-2", dy..DATA.Name.."-repair-tool")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech(dy.."repair-tools-3", dy..DATA.Name.."-repair-tool")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech(dy.."repair-tools-4", dy..DATA.Name.."-repair-tool")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech(dy.."repair-tools-5", dy..DATA.Name.."-repair-tool")
	end
	if DATA.Name == "wood" then
		data.raw["repair-tool"][dy..DATA.Name.."-repair-tool"].fuel_value = "2MJ"
		data.raw["repair-tool"][dy..DATA.Name.."-repair-tool"].fuel_category = "chemical"
	end
end

function DyWorld_Solar(DATA)
data:extend(
{
  {
    type = "solar-panel",
	name = dy..DATA.Name.."-solar-normal",
	localised_name = {"looped-name.solar-normal", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/solar-panel.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-solar-normal"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    corpse = "big-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel.png",
          priority = "high",
          width = 116,
          height = 112,
          shift = util.by_pixel(-3, 3),
	      tint = Material_Colors[DATA.Table],
          hr_version = {
            filename = "__base__/graphics/entity/solar-panel/hr-solar-panel.png",
            priority = "high",
            width = 230,
            height = 224,
            shift = util.by_pixel(-3, 3.5),
	        tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow.png",
          priority = "high",
          width = 112,
          height = 90,
          shift = util.by_pixel(10, 6),
          draw_as_shadow = true,
          hr_version = {
            filename = "__base__/graphics/entity/solar-panel/hr-solar-panel-shadow.png",
            priority = "high",
            width = 220,
            height = 180,
            shift = util.by_pixel(9.5, 6),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    overlay =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow-overlay.png",
          priority = "high",
          width = 108,
          height = 90,
          shift = util.by_pixel(11, 6),
          hr_version = {
            filename = "__base__/graphics/entity/solar-panel/hr-solar-panel-shadow-overlay.png",
            priority = "high",
            width = 214,
            height = 180,
            shift = util.by_pixel(10.5, 6),
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    production = tostring(DyWorld_Material_Formulas(10, DATA.Table, DATA.Tier)).."kW",
	fast_replaceable_group = "solar-panel",
  },
  {
    type = "item",
	name = dy..DATA.Name.."-solar-normal",
	localised_name = {"looped-name.solar-normal", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/solar-panel.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-power",
    stack_size = 100,
	order = dy..DATA.Name.."-solar-normal",
	place_result = dy..DATA.Name.."-solar-normal",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-solar-normal",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy.."solar-cell", math.ceil(DyWorld_Material_Formulas(10, DATA.Table, DATA.Tier)/25)},{"electronic-circuit", 5}},
    result = dy..DATA.Name.."-solar-normal",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-solar-normal"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-solar-normal"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-solar-normal"].ingredients, result_1)
	end
	if DATA.Name == "copper" or DATA.Name == "iron" then
		data.raw.recipe[dy..DATA.Name.."-solar-normal"].enabled = true
	elseif DATA.Tier == 1 then
		DyWorld_Add_To_Tech("solar-energy", dy..DATA.Name.."-solar-normal")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("solar-energy-2", dy..DATA.Name.."-solar-normal")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("solar-energy-3", dy..DATA.Name.."-solar-normal")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("solar-energy-4", dy..DATA.Name.."-solar-normal")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("solar-energy-5", dy..DATA.Name.."-solar-normal")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("solar-energy-6", dy..DATA.Name.."-solar-normal")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-solar-normal"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-solar-normal"].fuel_category = "chemical"
	end
end

function DyWorld_Solar_Equipment(DATA)
data:extend(
{
  {
    type = "solar-panel-equipment",
	name = dy..DATA.Name.."-solar-normal-equipment",
	localised_name = {"looped-name.solar-equipment", {"looped-name."..DATA.Name}},
    sprite =
    {
      filename = "__base__/graphics/equipment/solar-panel-equipment.png",
      width = 32,
      height = 32,
      priority = "medium"
    },
    shape =
    {
      width = 1,
      height = 1,
      type = "full"
    },
	icon_size = 32,
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = tostring(DyWorld_Material_Formulas(10, DATA.Table, DATA.Tier)/5).."kW",
    categories = {"armor"}
  },
  {
    type = "item",
	name = dy..DATA.Name.."-solar-normal-equipment",
	localised_name = {"looped-name.solar-equipment", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/equipment/solar-panel-equipment.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    placed_as_equipment_result = dy..DATA.Name.."-solar-normal-equipment",
    flags = {},
    subgroup = dy.."equipment-solar",
    order = dy..DATA.Name.."-solar-normal-equipment",
    stack_size = 20
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-solar-normal-equipment",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy.."solar-cell", math.ceil(DyWorld_Material_Formulas(10, DATA.Table, DATA.Tier)/50)},{"electronic-circuit", 5}},
    result = dy..DATA.Name.."-solar-normal-equipment",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-solar-normal-equipment"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-solar-normal-equipment"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-solar-normal-equipment"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("solar-energy", dy..DATA.Name.."-solar-normal-equipment")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("solar-energy-2", dy..DATA.Name.."-solar-normal-equipment")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("solar-energy-3", dy..DATA.Name.."-solar-normal-equipment")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("solar-energy-4", dy..DATA.Name.."-solar-normal-equipment")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("solar-energy-5", dy..DATA.Name.."-solar-normal-equipment")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("solar-energy-6", dy..DATA.Name.."-solar-normal-equipment")
	end
end

function DyWorld_Steam_Engine(DATA)
data:extend(
{
  {
    type = "generator",
	name = dy..DATA.Name.."-steam-engine",
	localised_name = {"looped-name.steam-engine", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/steam-engine.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-steam-engine"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(3, -34),
    effectivity = (1 + (Materials[DATA.Table].Conductivity / 50)),
    fluid_usage_per_tick = 0.25, --(Materials[DATA.Table].Density / 50),
    maximum_temperature = 165,
    fast_replaceable_group = "steam-engine",
    collision_box = {{-1.35, -2.35}, {1.35, 2.35}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier) / 100),
      height = 2,
      base_level = -1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { type = "input-output", position = {0, 3} },
        { type = "input-output", position = {0, -3} },
      },
      production_type = "input-output",
      filter = "steam",
      minimum_temperature = 100.0
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-H.png",
          width = 176,
          height = 128,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(1, -5),
	      tint = Material_Colors[DATA.Table],
          hr_version = {
            filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-H.png",
            width = 352,
            height = 257,
            frame_count = 32,
            line_length = 8,
	        tint = Material_Colors[DATA.Table],
            shift = util.by_pixel(1, -4.75),
            scale = 0.5
          },
        },
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-H-shadow.png",
          width = 254,
          height = 80,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(48, 24),
          hr_version = {
            filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-H-shadow.png",
            width = 508,
            height = 160,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(48, 24),
            scale = 0.5
          },
        },
      },
    },
    vertical_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-V.png",
          width = 112,
          height = 195,
          frame_count = 32,
          line_length = 8,
	      tint = Material_Colors[DATA.Table],
          shift = util.by_pixel(5, -6.5),
          hr_version = {
            filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-V.png",
            width = 225,
            height = 391,
            frame_count = 32,
            line_length = 8,
	        tint = Material_Colors[DATA.Table],
            shift = util.by_pixel(4.75, -6.25),
            scale = 0.5
          },
        },
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-V-shadow.png",
          width = 165,
          height = 153,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(40.5, 9.5),
          hr_version = {
            filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-V-shadow.png",
            width = 330,
            height = 307,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(40.5, 9.25),
            scale = 0.5
          },
        },
      },
    },
    smoke =
    {
      {
        name = "light-smoke",
        north_position = {0.9, 0.0},
        east_position = {-2.0, -2.0},
        frequency = 10 / 32,
        starting_vertical_speed = 0.08,
        slow_down_factor = 1,
        starting_frame_deviation = 60
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-engine-90bpm.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  },
  {
    type = "item",
	name = dy..DATA.Name.."-steam-engine",
	localised_name = {"looped-name.steam-engine", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/steam-engine.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-power",
    stack_size = 100,
	order = dy..DATA.Name.."-steam-engine",
	place_result = dy..DATA.Name.."-steam-engine",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-steam-engine",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy.."frame", 1},{"electronic-circuit", 5},{dy.."gearbox", 3}},
    result = dy..DATA.Name.."-steam-engine",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-steam-engine"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-steam-engine"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-steam-engine"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech(dy.."steam-energy-1", dy..DATA.Name.."-steam-engine")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech(dy.."steam-energy-2", dy..DATA.Name.."-steam-engine")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech(dy.."steam-energy-3", dy..DATA.Name.."-steam-engine")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech(dy.."steam-energy-4", dy..DATA.Name.."-steam-engine")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech(dy.."steam-energy-5", dy..DATA.Name.."-steam-engine")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech(dy.."steam-energy-6", dy..DATA.Name.."-steam-engine")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-steam-engine"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-steam-engine"].fuel_category = "chemical"
	end
end

function DyWorld_Accumulator(DATA)
data:extend(
{
  {
    type = "accumulator",
	name = dy..DATA.Name.."-accumulator-normal",
	localised_name = {"looped-name.accumulator-normal", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/accumulator.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-accumulator-normal"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = tostring(math.floor(DyWorld_Material_Formulas(10, DATA.Table, DATA.Tier)*25)).."kJ",
      usage_priority = "tertiary",
      input_flow_limit = tostring(math.floor(DyWorld_Material_Formulas(10, DATA.Table, DATA.Tier)*3)).."kW",
      output_flow_limit = tostring(math.floor(DyWorld_Material_Formulas(10, DATA.Table, DATA.Tier)*3)).."kW"
    },
    picture = {
    layers =
    {
      {
        filename = "__base__/graphics/entity/accumulator/accumulator.png",
        priority = "high",
        width = 66,
        height = 94,
        repeat_count = repeat_count,
        shift = util.by_pixel(0, -10),
	    tint = Material_Colors[DATA.Table],
        animation_speed = 0.5,
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator.png",
          priority = "high",
          width = 130,
          height = 189,
          repeat_count = repeat_count,
          shift = util.by_pixel(0, -11),
          tint = Material_Colors[DATA.Table],
          animation_speed = 0.5,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
        priority = "high",
        width = 120,
        height = 54,
        repeat_count = repeat_count,
        shift = util.by_pixel(28, 6),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-shadow.png",
          priority = "high",
          width = 234,
          height = 106,
          repeat_count = repeat_count,
          shift = util.by_pixel(29, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }},
    charge_animation =
    {
    layers =
    {
      accumulator_picture({ r=1, g=1, b=1, a=1 } , 24),
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-charge.png",
        priority = "high",
        width = 90,
        height = 100,
        line_length = 6,
        frame_count = 24,
        blend_mode = "additive",
        shift = util.by_pixel(0, -22),
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-charge.png",
          priority = "high",
          width = 178,
          height = 206,
          line_length = 6,
          frame_count = 24,
          blend_mode = "additive",
          shift = util.by_pixel(0, -22),
          scale = 0.5
        }
      }
    }
    },
	fast_replaceable_group = "accumulator",
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
    discharge_animation =
    {
    layers =
    {
      accumulator_picture({ r=1, g=1, b=1, a=1 } , 24),
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-discharge.png",
        priority = "high",
        width = 88,
        height = 104,
        line_length = 6,
        frame_count = 24,
        blend_mode = "additive",
        shift = util.by_pixel(-2, -22),
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-discharge.png",
          priority = "high",
          width = 170,
          height = 210,
          line_length = 6,
          frame_count = 24,
          blend_mode = "additive",
          shift = util.by_pixel(-1, -23),
          scale = 0.5
        }
      }
    }
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
    circuit_wire_connection_point = circuit_connector_definitions["accumulator"].points,
    circuit_connector_sprites = circuit_connector_definitions["accumulator"].sprites,
    circuit_wire_max_distance = 9,
    default_output_signal = {type = "virtual", name = "signal-A"}
  },
  {
    type = "item",
	name = dy..DATA.Name.."-accumulator-normal",
	localised_name = {"looped-name.accumulator-normal", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/accumulator.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-power",
    stack_size = 100,
	order = dy..DATA.Name.."-accumulator-normal",
	place_result = dy..DATA.Name.."-accumulator-normal",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-accumulator-normal",
    energy_required = 1,
	enabled = false,
    ingredients = {{dy.."battery-pack", math.ceil(DyWorld_Material_Formulas(10, DATA.Table, DATA.Tier)/25)},{"electronic-circuit", 5}},
    result = dy..DATA.Name.."-accumulator-normal",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-accumulator-normal"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-accumulator-normal"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-accumulator-normal"].ingredients, result_1)
	end
	if DATA.Name == "copper" or DATA.Name == "iron" then
		data.raw.recipe[dy..DATA.Name.."-accumulator-normal"].enabled = true
	elseif DATA.Tier == 1 then
		DyWorld_Add_To_Tech("electric-energy-accumulators", dy..DATA.Name.."-accumulator-normal")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("electric-energy-accumulators-2", dy..DATA.Name.."-accumulator-normal")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("electric-energy-accumulators-3", dy..DATA.Name.."-accumulator-normal")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("electric-energy-accumulators-4", dy..DATA.Name.."-accumulator-normal")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("electric-energy-accumulators-5", dy..DATA.Name.."-accumulator-normal")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("electric-energy-accumulators-6", dy..DATA.Name.."-accumulator-normal")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-accumulator-normal"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-accumulator-normal"].fuel_category = "chemical"
	end
end

function DyWorld_Pumpjacks(DATA)
data:extend(
{
  {
    type = "mining-drill",
	name = dy..DATA.Name.."-pumpjack",
	localised_name = {"looped-name.pumpjack", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/pumpjack.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-pumpjack"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances = Material_Resistances[DATA.Table],
    resource_categories = {"basic-fluid"},
    collision_box = {{ -1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.6, -2.5}, {1.5, 1.6}},
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 0.15 / 1.5,
      usage_priority = "secondary-input"
    },
    output_fluid_box =
    {
      base_area = (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier) / 100),
      base_level = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
          positions = { {1, -2}, {2, -1}, {-1, 2}, {-2, 1} }
        }
      }
    },
    mining_power = (DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier) + DATA.Tier),
    mining_speed = (DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier) + DATA.Tier),
    energy_usage = DyWorld_Material_Formulas(20, DATA.Table, DATA.Tier, 1.75),
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    base_render_layer = "lower-object-above-shadow",
    base_picture =
    {
      sheets =
      {
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
          priority = "extra-high",
          width = 131,
          height = 137,
          shift = util.by_pixel(-2.5, -4.5),
		  tint = Material_Colors[DATA.Table],
          hr_version = 
          {
            filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base.png",
            priority = "extra-high",
            width = 261,
            height = 273,
            shift = util.by_pixel(-2.25, -4.75),
		    tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base-shadow.png",
          priority = "extra-high",
          width = 110,
          height = 111,
          draw_as_shadow = true,
          shift = util.by_pixel(6, 0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base-shadow.png",
            width = 220,
            height = 220,
            scale = 0.5,
            draw_as_shadow = true,
            shift = util.by_pixel(6, 0.5)
          }
        }
      }
    },
    animations =
    {
      north =
      {
        layers = 
        {
          {
            priority = "high",
            filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead.png",
            line_length = 8,
            width = 104,
            height = 102,
            frame_count = 40,
            shift = util.by_pixel(-4, -24),
            animation_speed = 0.5,
		    tint = Material_Colors[DATA.Table],
            hr_version = 
            {
              priority = "high",
              filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-horsehead.png",
              animation_speed = 0.5,
              scale = 0.5,
              line_length = 8,
              width = 206,
              height = 202,
              frame_count = 40,
              shift = util.by_pixel(-4, -24),
		      tint = Material_Colors[DATA.Table],
            }
          },
          {
            priority = "high",
            filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead-shadow.png",
            animation_speed = 0.5,
            draw_as_shadow = true,
            line_length = 8,
            width = 155,
            height = 41,
            frame_count = 40,
            shift = util.by_pixel(17.5, 14.5),
            hr_version = 
            {
              priority = "high",
              filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-horsehead-shadow.png",
              animation_speed = 0.5,
              draw_as_shadow = true,
              line_length = 8,
              width = 309,
              height = 82,
              frame_count = 40,
              scale = 0.5,
              shift = util.by_pixel(17.75, 14.5)
            }
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/pumpjack.ogg" },
      apparent_volume = 1.5
    },
    fast_replaceable_group = "pumpjack",
    
    circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
    circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
    circuit_wire_max_distance = 9,
    module_specification =
    {
      module_slots = 3
    },
  },
  {
    type = "item",
	name = dy..DATA.Name.."-pumpjack",
	localised_name = {"looped-name.pumpjack", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/pumpjack.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 100,
	order = dy..DATA.Name.."-pumpjack",
	place_result = dy..DATA.Name.."-pumpjack",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-pumpjack",
    energy_required = 1,
	enabled = false,
    ingredients = {{"electronic-circuit", 5},{dy.."frame", 1}},
    result = dy..DATA.Name.."-pumpjack",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pumpjack"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pumpjack"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-pumpjack"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-pumpjack"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("fluid-handling", dy..DATA.Name.."-pumpjack")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("fluid-handling-2", dy..DATA.Name.."-pumpjack")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("fluid-handling-3", dy..DATA.Name.."-pumpjack")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("fluid-handling-4", dy..DATA.Name.."-pumpjack")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("fluid-handling-5", dy..DATA.Name.."-pumpjack")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-pumpjack"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-pumpjack"].fuel_category = "chemical"
	end
end

function DyWorld_Mining_Drills_Electric(DATA)
data:extend(
{
  {
    type = "mining-drill",
	name = dy..DATA.Name.."-electric-drill",
	localised_name = {"looped-name.electric-drill", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/electric-mining-drill.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-electric-drill"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    resource_categories = {"basic-solid"},
    corpse = "big-remnants",
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "mining-drill",
    input_fluid_box =
    {
      production_type = "input-output",
      pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      base_area = (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier) / 100),
      height = 2,
      base_level = -1,
      pipe_connections =
      {
        { position = {-2, 0} },
        { position = {2, 0} },
        { position = {0, 2} },
      }
    },  
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
	    tint = Material_Colors[DATA.Table],
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
		  tint = Material_Colors[DATA.Table],
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
		tint = Material_Colors[DATA.Table],
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
		  tint = Material_Colors[DATA.Table],
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
		tint = Material_Colors[DATA.Table],
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
		  tint = Material_Colors[DATA.Table],
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
		tint = Material_Colors[DATA.Table],
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
		  tint = Material_Colors[DATA.Table],
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
    mining_power = (DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier) + DATA.Tier),
    mining_speed = (DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier) + DATA.Tier),
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 0.15 / 1.5,
      usage_priority = "secondary-input"
    },
    energy_usage = DyWorld_Material_Formulas(20, DATA.Table, DATA.Tier, 2.1),
    resource_searching_radius = (math.floor(Materials[DATA.Table].Hardness / 2) + 0.49),
    vector_to_place_result = {0, -1.85},
    module_specification =
    {
      module_slots = 3
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    circuit_wire_connection_points = circuit_connector_definitions["electric-mining-drill"].points,
    circuit_connector_sprites = circuit_connector_definitions["electric-mining-drill"].sprites,
    circuit_wire_max_distance = 9,
  },
  {
    type = "item",
	name = dy..DATA.Name.."-electric-drill",
	localised_name = {"looped-name.electric-drill", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/electric-mining-drill.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 100,
	order = dy..DATA.Name.."-electric-drill",
	place_result = dy..DATA.Name.."-electric-drill",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-electric-drill",
    energy_required = 1,
	enabled = false,
    ingredients = {{"electronic-circuit", 5},{dy.."frame", 1},{dy.."rotor", 2}},
    result = dy..DATA.Name.."-electric-drill",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-electric-drill"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-electric-drill"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-electric-drill"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-electric-drill"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech(dy.."electric-miners-1", dy..DATA.Name.."-electric-drill")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech(dy.."electric-miners-2", dy..DATA.Name.."-electric-drill")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech(dy.."electric-miners-3", dy..DATA.Name.."-electric-drill")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech(dy.."electric-miners-4", dy..DATA.Name.."-electric-drill")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech(dy.."electric-miners-5", dy..DATA.Name.."-electric-drill")
	end
	if (Materials[DATA.Table].Elasticity / 2) >= 20 then
		data.raw.item[dy..DATA.Name.."-electric-drill"].localised_description = {"looped-name.drill-warning"}
		data.raw["mining-drill"][dy..DATA.Name.."-electric-drill"].localised_description = {"looped-name.drill-warning"}
	end
	if data.raw.item[DATA.Name.."-ore"] then
		data.raw.item[dy..DATA.Name.."-electric-drill"].rocket_launch_products = {
			{name = DATA.Name.."-ore", amount_min = 1, amount_max = 200, probability = 1},
			{name = "stone", amount_min = 1, amount_max = 200, probability = 0.1},
			{name = "coal", amount_min = 1, amount_max = 200, probability = 0.1},
			{name = dy.."sand", amount_min = 1, amount_max = 200, probability = 0.1},
		}
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-electric-drill"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-electric-drill"].fuel_category = "chemical"
	end
end

function DyWorld_Mining_Drills_Burner(DATA)
data:extend(
{
  {
    type = "mining-drill",
	name = dy..DATA.Name.."-burner-drill",
	localised_name = {"looped-name.burner-drill", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/burner-mining-drill.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    resource_categories = {"basic-solid"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-burner-drill"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    corpse = "medium-remnants",
    collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{ -1, -1}, {1, 1}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/burner-mining-drill.ogg",
        volume = 0.8
      },
    },
	vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions = 0.1 / 3,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 3
        }
      }
    },
    energy_usage = DyWorld_Material_Formulas(20, DATA.Table, DATA.Tier, 1),
    mining_power = (DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier) + DATA.Tier),
    mining_speed = (DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier) + DATA.Tier),
    animations =
    {
      north =
      {
        layers = 
        {
          {
            priority = "extra-high",
            width = 87,
            height = 95,
            line_length = 4,
            shift = util.by_pixel(2.5, 0.5),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-N.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
			tint = Material_Colors[DATA.Table],
            hr_version = {
              priority = "extra-high",
              width = 173,
              height = 188,
              line_length = 4,
              shift = util.by_pixel(2.75, 0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-N.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5,
			  tint = Material_Colors[DATA.Table],
            }
          },
          {
            priority = "extra-high",
            width = 109,
            height = 76,
            line_length = 4,
            shift = util.by_pixel(23.5, -1),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-N-shadow.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
            draw_as_shadow = true,
            hr_version = {
              priority = "extra-high",
              width = 217,
              height = 150,
              line_length = 4,
              shift = util.by_pixel(23.75, -1),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-N-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            },
          },
        },
      },
      east =
      {
        layers =
        {
          {
            priority = "extra-high",
            width = 93,
            height = 84,
            line_length = 4,
            shift = util.by_pixel(2.5, 1),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-E.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
			tint = Material_Colors[DATA.Table],
            hr_version = {
              priority = "extra-high",
              width = 185,
              height = 168,
              line_length = 4,
              shift = util.by_pixel(2.75, 1),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-E.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5,
			  tint = Material_Colors[DATA.Table],
            },
          },
          {
            priority = "extra-high",
            width = 93,
            height = 65,
            line_length = 4,
            shift = util.by_pixel(13.5, 0.5),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-E-shadow.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
            draw_as_shadow = true,
            hr_version = {
              width = 185,
              height = 128,
              line_length = 4,
              shift = util.by_pixel(13.75, 0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-E-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            },
          },
        },
      },
      south =
      {
        layers =
        {
          {
            priority = "extra-high",
            width = 87,
            height = 87,
            line_length = 4,
            shift = util.by_pixel(0.5, -0.5),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-S.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
			tint = Material_Colors[DATA.Table],
            hr_version = {
              priority = "extra-high",
              width = 174,
              height = 174,
              line_length = 4,
              shift = util.by_pixel(0.5, -0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-S.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5,
			  tint = Material_Colors[DATA.Table],
            },
          },
          {
            priority = "extra-high",
            width = 88,
            height = 69,
            line_length = 4,
            shift = util.by_pixel(11, 2.5),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-S-shadow.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
            draw_as_shadow = true,
            hr_version = {
              priority = "extra-high",
              width = 174,
              height = 137,
              line_length = 4,
              shift = util.by_pixel(11, 2.75),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-S-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            },
          },
        },
      },
      west =
      {
        layers =
        {
          {
            priority = "extra-high",
            width = 91,
            height = 88,
            line_length = 4,
            shift = util.by_pixel(-1.5, 0),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
			tint = Material_Colors[DATA.Table],
            hr_version = {
              priority = "extra-high",
              width = 180,
              height = 176,
              line_length = 4,
              shift = util.by_pixel(-1.5, 0),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-W.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5,
			  tint = Material_Colors[DATA.Table],
            },
          },
          {
            priority = "extra-high",
            width = 89,
            height = 66,
            line_length = 4,
            shift = util.by_pixel(7.5, 1),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W-shadow.png",
            frame_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
            draw_as_shadow = true,
            hr_version = {
              priority = "extra-high",
              width = 176,
              height = 130,
              line_length = 4,
              shift = util.by_pixel(7.5, 1),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-W-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            },
          },
        },
      },
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    resource_searching_radius = (math.floor(Materials[DATA.Table].Hardness / 2) + 0.49),
    vector_to_place_result = {-0.5, -1.3},
    fast_replaceable_group = "mining-drill",
    circuit_wire_connection_points = circuit_connector_definitions["burner-mining-drill"].points,
    circuit_connector_sprites = circuit_connector_definitions["burner-mining-drill"].sprites,
    circuit_wire_max_distance = 9,
  },
  {
    type = "item",
	name = dy..DATA.Name.."-burner-drill",
	localised_name = {"looped-name.burner-drill", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/burner-mining-drill.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 100,
	order = dy..DATA.Name.."-burner-drill",
	place_result = dy..DATA.Name.."-burner-drill",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-burner-drill",
    energy_required = 1,
	enabled = false,
    ingredients = {{"electronic-circuit", 1},{dy.."rotor", 1}},
    result = dy..DATA.Name.."-burner-drill",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-burner-drill"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-burner-drill"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-burner-drill"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-burner-drill"].enabled = true
	elseif DATA.Tier == 2 then
		data.raw.recipe[dy..DATA.Name.."-burner-drill"].enabled = true
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-burner-drill"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-burner-drill"].fuel_category = "chemical"
	end
end

function DyWorld_Assembling_Machines(DATA)
data:extend(
{
  {
    type = "assembling-machine",
	name = dy..DATA.Name.."-assembling-electric",
	localised_name = {"looped-name.assembling-electric", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/assembling-machine-3.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-assembling-electric"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier) / 100),
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = (DyWorld_Material_Formulas(4, DATA.Table, DATA.Tier) / 100),
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
          priority = "high",
          width = 108,
          height = 119,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, -0.5),
		  tint = Material_Colors[DATA.Table],
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5,
			tint = Material_Colors[DATA.Table],
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
          priority = "high",
          width = 130,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(28, 4),
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5
          }
        },
      },
    },
    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = DyWorld_Material_Formulas(19, DATA.Table, DATA.Tier),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = DyWorld_Material_Formulas(20, DATA.Table, DATA.Tier, 1),
    ingredient_count = math.ceil((Materials[DATA.Table].Elasticity / 2) + 2),
    module_specification =
    {
      module_slots = math.floor(Materials[DATA.Table].Hardness / 2)
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  {
    type = "item",
	name = dy..DATA.Name.."-assembling-electric",
	localised_name = {"looped-name.assembling-electric", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/assembling-machine-3.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 100,
	order = dy..DATA.Name.."-assembling-electric",
	place_result = dy..DATA.Name.."-assembling-electric",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-assembling-electric",
    energy_required = 1,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-assembling-electric",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-assembling-electric"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 12}
		table.insert(data.raw.recipe[dy..DATA.Name.."-assembling-electric"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 12}
		table.insert(data.raw.recipe[dy..DATA.Name.."-assembling-electric"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-assembling-electric"].enabled = true
		local result_1 = {"electronic-circuit", DATA.Tier * 2}
		table.insert(data.raw.recipe[dy..DATA.Name.."-assembling-electric"].ingredients, result_1)
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("automation", dy..DATA.Name.."-assembling-electric")
		local result_1 = {"electronic-circuit", DATA.Tier * 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-assembling-electric"].ingredients, result_1)
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("automation-2", dy..DATA.Name.."-assembling-electric")
		local result_1 = {"advanced-circuit", DATA.Tier * 2}
		table.insert(data.raw.recipe[dy..DATA.Name.."-assembling-electric"].ingredients, result_1)
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("automation-3", dy..DATA.Name.."-assembling-electric")
		local result_1 = {"processing-unit", DATA.Tier * 2}
		table.insert(data.raw.recipe[dy..DATA.Name.."-assembling-electric"].ingredients, result_1)
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("automation-4", dy..DATA.Name.."-assembling-electric")
		local result_1 = {dy.."processing-advanced", DATA.Tier * 2}
		table.insert(data.raw.recipe[dy..DATA.Name.."-assembling-electric"].ingredients, result_1)
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("automation-5", dy..DATA.Name.."-assembling-electric")
		local result_1 = {dy.."processing-logic", DATA.Tier * 2}
		table.insert(data.raw.recipe[dy..DATA.Name.."-assembling-electric"].ingredients, result_1)
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-assembling-electric"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-assembling-electric"].fuel_category = "chemical"
	end
end

function DyWorld_Chests(DATA)
data:extend(
{
  {
    type = "container",
	name = dy..DATA.Name.."-chest",
	localised_name = {"looped-name.chest", {"looped-name."..DATA.Name}},
	icons = 
	{
	  Materials[DATA.Table].Icon,
	  {
		icon = "__base__/graphics/icons/iron-chest.png",
	  },
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-chest"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = DyWorld_Material_Formulas(13, DATA.Table, DATA.Tier, 1),
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          shift = util.by_pixel(0, -0.5),
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest.png",
            priority = "extra-high",
            width = 66,
            height = 76,
            shift = util.by_pixel(-0.5, -0.5),
			tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
          priority = "extra-high",
          width = 56,
          height = 26,
          shift = util.by_pixel(10, 6.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
            priority = "extra-high",
            width = 110,
            height = 50,
            shift = util.by_pixel(10.5, 6),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = 9
  },
  {
    type = "item",
	name = dy..DATA.Name.."-chest",
	localised_name = {"looped-name.chest", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-chest.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 100,
	order = dy..DATA.Name.."-chest",
	place_result = dy..DATA.Name.."-chest",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-chest",
    energy_required = 1,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-chest",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-chest"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-chest"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-chest"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-chest"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("automation", dy..DATA.Name.."-chest")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("automation-2", dy..DATA.Name.."-chest")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("automation-3", dy..DATA.Name.."-chest")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("automation-4", dy..DATA.Name.."-chest")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("automation-5", dy..DATA.Name.."-chest")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-chest"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-chest"].fuel_category = "chemical"
	end
end

function DyWorld_Warehouse_Chests_1(DATA)
data:extend(
{
  {
    type = "container",
	name = dy..DATA.Name.."-warehouse-chest",
	localised_name = {"looped-name.warehouse-chest", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-chest.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-warehouse-chest"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "warehouse",
    inventory_size = DyWorld_Material_Formulas(13, DATA.Table, DATA.Tier, 11.5),
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          shift = util.by_pixel(0, -0.5),
		  tint = Material_Colors[DATA.Table],
          scale = 3,
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest.png",
            priority = "extra-high",
            width = 66,
            height = 76,
            shift = util.by_pixel(-0.5, -0.5),
			tint = Material_Colors[DATA.Table],
            scale = 1.5
          }
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
          priority = "extra-high",
          width = 56,
          height = 26,
          shift = util.by_pixel(10, 6.5),
          draw_as_shadow = true,
          scale = 3,
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
            priority = "extra-high",
            width = 110,
            height = 50,
            shift = util.by_pixel(10.5, 6),
            draw_as_shadow = true,
            scale = 1.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites, 
    circuit_wire_max_distance = 9
  },
  {
    type = "item",
	name = dy..DATA.Name.."-warehouse-chest",
	localised_name = {"looped-name.warehouse-chest", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-chest.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 5,
	order = dy..DATA.Name.."-warehouse-chest",
	place_result = dy..DATA.Name.."-warehouse-chest",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-warehouse-chest",
    energy_required = 1,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-warehouse-chest",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 75}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 75}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 75}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("automation-2", dy..DATA.Name.."-warehouse-chest")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("automation-3", dy..DATA.Name.."-warehouse-chest")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-warehouse-chest"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-warehouse-chest"].fuel_category = "chemical"
	end
end

function DyWorld_Warehouse_Chests_2(DATA)
data:extend(
{
  {
    type = "logistic-container",
	name = dy..DATA.Name.."-warehouse-chest",
	localised_name = {"looped-name.warehouse-chest", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-chest.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-warehouse-chest"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "warehouse",
    logistic_mode = "passive-provider",
    inventory_size = DyWorld_Material_Formulas(13, DATA.Table, DATA.Tier, 15),
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          shift = util.by_pixel(0, -0.5),
		  tint = Material_Colors[DATA.Table],
          scale = 3,
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest.png",
            priority = "extra-high",
            width = 66,
            height = 76,
            shift = util.by_pixel(-0.5, -0.5),
			tint = Material_Colors[DATA.Table],
            scale = 1.5
          }
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
          priority = "extra-high",
          width = 56,
          height = 26,
          shift = util.by_pixel(10, 6.5),
          draw_as_shadow = true,
          scale = 3,
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
            priority = "extra-high",
            width = 110,
            height = 50,
            shift = util.by_pixel(10.5, 6),
            draw_as_shadow = true,
            scale = 1.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = 9
  },
  {
    type = "item",
	name = dy..DATA.Name.."-warehouse-chest",
	localised_name = {"looped-name.warehouse-chest", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-chest.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 5,
	order = dy..DATA.Name.."-warehouse-chest",
	place_result = dy..DATA.Name.."-warehouse-chest",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-warehouse-chest",
    energy_required = 1,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-warehouse-chest",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 75}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 75}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 75}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].enabled = true
	elseif DATA.Tier == 2 then
		local result_1 = {"electronic-circuit", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
		DyWorld_Add_To_Tech("automation-2", dy..DATA.Name.."-warehouse-chest")
	elseif DATA.Tier == 3 then
		local result_1 = {"advanced-circuit", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
		DyWorld_Add_To_Tech("automation-3", dy..DATA.Name.."-warehouse-chest")
	elseif DATA.Tier == 4 then
		local result_1 = {"processing-unit", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
		DyWorld_Add_To_Tech("automation-4", dy..DATA.Name.."-warehouse-chest")
	elseif DATA.Tier == 5 then
		local result_1 = {dy.."processing-advanced", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
		DyWorld_Add_To_Tech("automation-5", dy..DATA.Name.."-warehouse-chest")
	elseif DATA.Tier == 6 then
		local result_1 = {dy.."processing-logic", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-warehouse-chest"].ingredients, result_1)
		DyWorld_Add_To_Tech("automation-6", dy..DATA.Name.."-warehouse-chest")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-warehouse-chest"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-warehouse-chest"].fuel_category = "chemical"
	end
end

function DyWorld_Roboport(DATA)
data:extend(
{
  {
    type = "roboport",
	name = dy..DATA.Name.."-roboport",
	localised_name = {"looped-name.roboport", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/roboport.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-roboport"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    corpse = "big-remnants",
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    resistances = Material_Resistances[DATA.Table],
    dying_explosion = "medium-explosion",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = tostring(Materials[DATA.Table].Strength_Ultimate * 15).."MW",
      buffer_capacity = tostring(Materials[DATA.Table].Strength_Ultimate * 10).."MJ",
    },
    recharge_minimum = tostring(math.floor(Materials[DATA.Table].Strength_Yield * 0.5)).."MJ",
    energy_usage = DyWorld_Material_Formulas(20, DATA.Table, DATA.Tier, 1),
    -- per one charge slot
    charging_energy = tostring(((Materials[DATA.Table].Strength_Ultimate) + 1500) * 5).."kW",
    logistics_radius = DyWorld_Material_Formulas(22, DATA.Table, DATA.Tier),
    construction_radius = math.floor((DyWorld_Material_Formulas(22, DATA.Table, DATA.Tier)) * 1.5),
	Tier = DATA.Type,
    charge_approach_distance = 5,
    robot_slots_count = math.floor(DATA.Tier * 1.5),
    material_slots_count = math.floor(DATA.Tier * 1.5),
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {-1.5, -0.5}, {1.5, -0.5}, {1.5, 1.5}, {-1.5, 1.5},
    },
    base =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/roboport/roboport-base.png",
          width = 143,
          height = 135,
          shift = {0.5, 0.25},
	      tint = Material_Colors[DATA.Table],
          hr_version = {
            filename = "__base__/graphics/entity/roboport/hr-roboport-base.png",
            width = 228,
            height = 277,
            shift = util.by_pixel(2, 7.75),
	        tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/roboport/roboport-shadow.png",
          width = 147,
          height = 102,
          draw_as_shadow = true,
          shift = util.by_pixel(28.5, 19.25),
          hr_version = {
            filename = "__base__/graphics/entity/roboport/hr-roboport-shadow.png",
            width = 294,
            height = 201,
            draw_as_shadow = true,
            shift = util.by_pixel(28.5, 19.25),
            scale = 0.5
          }
        }
      }
    },
    base_patch =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-patch.png",
      priority = "medium",
      width = 69,
      height = 50,
      frame_count = 1,
      shift = {0.03125, 0.203125},
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/roboport/hr-roboport-base-patch.png",
        priority = "medium",
        width = 138,
        height = 100,
        frame_count = 1,
        shift = util.by_pixel(1.5, 5),
	    tint = Material_Colors[DATA.Table],
        scale = 0.5
      }
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
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/roboport/hr-roboport-base-animation.png",
        priority = "medium",
        width = 83,
        height = 59,
        frame_count = 8,
	    tint = Material_Colors[DATA.Table],
        animation_speed = 0.5,
        shift = util.by_pixel(-17.75, -61.25),
        scale = 0.5
      }
    },
    door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 52,
      height = 20,
      frame_count = 16,
      shift = {0.015625, -0.890625},
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/roboport/hr-roboport-door-up.png",
        priority = "medium",
        width = 97,
        height = 38,
	    tint = Material_Colors[DATA.Table],
        frame_count = 16,
        shift = util.by_pixel(-0.25, -29.5),
        scale = 0.5
      }
    },
    door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 52,
      height = 22,
      frame_count = 16,
      shift = {0.015625, -0.234375},
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/roboport/hr-roboport-door-down.png",
        priority = "medium",
        width = 97,
        height = 41,
	    tint = Material_Colors[DATA.Table],
        frame_count = 16,
        shift = util.by_pixel(-0.25,-9.75),
        scale = 0.5
      }
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
    circuit_wire_connection_point = circuit_connector_definitions["roboport"].points,
    circuit_connector_sprites = circuit_connector_definitions["roboport"].sprites,
    circuit_wire_max_distance = 9,
    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
	fast_replaceable_group = "roboport",
  },
  {
    type = "item",
	name = dy..DATA.Name.."-roboport",
	localised_name = {"looped-name.roboport", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/roboport.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 50,
	order = dy..DATA.Name.."-roboport",
	place_result = dy..DATA.Name.."-roboport",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-roboport",
    energy_required = 5,
	enabled = false,
    ingredients = {{"advanced-circuit", 5}},
    result = dy..DATA.Name.."-roboport",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 45}
		table.insert(data.raw.recipe[dy..DATA.Name.."-roboport"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 45}
		table.insert(data.raw.recipe[dy..DATA.Name.."-roboport"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 45}
		table.insert(data.raw.recipe[dy..DATA.Name.."-roboport"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.roboport[dy..DATA.Name.."-roboport"].charging_offsets ={{-1.5, -0.6}, {1.5, 1.6}}
		DyWorld_Add_To_Tech("construction-robotics", dy..DATA.Name.."-roboport")
		DyWorld_Add_To_Tech("logistic-robotics", dy..DATA.Name.."-roboport")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("construction-robotics-2", dy..DATA.Name.."-roboport")
		DyWorld_Add_To_Tech("logistic-robotics-2", dy..DATA.Name.."-roboport")
	elseif DATA.Tier == 3 then
		data.raw.roboport[dy..DATA.Name.."-roboport"].charging_offsets ={{-1.5, -0.6}, {1.5, -0.6}, {1.5, 1.6}, {-1.5, 1.6},{-1.5, -0.4}, {1.5, -0.4}, {1.5, 1.4}, {-1.5, 1.4}}
		local result_1 = {"processing-unit", 3}
		table.insert(data.raw.recipe[dy..DATA.Name.."-roboport"].ingredients, result_1)
		DyWorld_Add_To_Tech("construction-robotics-3", dy..DATA.Name.."-roboport")
		DyWorld_Add_To_Tech("logistic-robotics-3", dy..DATA.Name.."-roboport")
	elseif DATA.Tier == 4 then
		data.raw.roboport[dy..DATA.Name.."-roboport"].charging_offsets ={{-1.5, -0.6}, {1.5, -0.6}, {1.5, 1.6}, {-1.5, 1.6},{-1.5, -0.4}, {1.5, -0.4}, {1.5, 1.4}, {-1.5, 1.4}}
		local result_1 = {dy.."processing-advanced", 3}
		table.insert(data.raw.recipe[dy..DATA.Name.."-roboport"].ingredients, result_1)
		DyWorld_Add_To_Tech("construction-robotics-4", dy..DATA.Name.."-roboport")
		DyWorld_Add_To_Tech("logistic-robotics-4", dy..DATA.Name.."-roboport")
	elseif DATA.Tier == 5 then
		data.raw.roboport[dy..DATA.Name.."-roboport"].charging_offsets ={{-1.5, -0.6}, {1.5, -0.6}, {1.5, 1.6}, {-1.5, 1.6},{-1.5, -0.4}, {1.5, -0.4}, {1.5, 1.4}, {-1.5, 1.4}}
		local result_1 = {dy.."processing-advanced", 6}
		table.insert(data.raw.recipe[dy..DATA.Name.."-roboport"].ingredients, result_1)
		DyWorld_Add_To_Tech("construction-robotics-5", dy..DATA.Name.."-roboport")
		DyWorld_Add_To_Tech("logistic-robotics-5", dy..DATA.Name.."-roboport")
	elseif DATA.Tier == 6 then
		data.raw.roboport[dy..DATA.Name.."-roboport"].charging_offsets ={{-1.6, -0.6}, {1.6, -0.6}, {1.6, 1.6}, {-1.6, 1.6},{-1.4, -0.4}, {1.4, -0.4}, {1.4, 1.4}, {-1.4, 1.4},{-1.4, -0.6}, {1.4, -0.6}, {1.4, 1.6}, {-1.4, 1.6},{-1.6, -0.4}, {1.6, -0.4}, {1.6, 1.4}, {-1.6, 1.4}}
		local result_1 = {dy.."processing-logic", 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-roboport"].ingredients, result_1)
		DyWorld_Add_To_Tech("construction-robotics-6", dy..DATA.Name.."-roboport")
		DyWorld_Add_To_Tech("logistic-robotics-6", dy..DATA.Name.."-roboport")
	end
	if settings.startup["DyWorld_Roboport_Standard"].value then
		if data.raw["roboport"][dy..DATA.Name.."-roboport"].Tier then
			if data.raw["roboport"][dy..DATA.Name.."-roboport"].Tier == "Primitive" then
				data.raw["roboport"][dy..DATA.Name.."-roboport"].logistics_radius = 12
				data.raw["roboport"][dy..DATA.Name.."-roboport"].construction_radius = 18
			elseif data.raw["roboport"][dy..DATA.Name.."-roboport"].Tier == "Basic" then
				data.raw["roboport"][dy..DATA.Name.."-roboport"].logistics_radius = 25
				data.raw["roboport"][dy..DATA.Name.."-roboport"].construction_radius = 37
			elseif data.raw["roboport"][dy..DATA.Name.."-roboport"].Tier == "Simple_Alloy" then
				data.raw["roboport"][dy..DATA.Name.."-roboport"].logistics_radius = 40
				data.raw["roboport"][dy..DATA.Name.."-roboport"].construction_radius = 60
			elseif data.raw["roboport"][dy..DATA.Name.."-roboport"].Tier == "Alloy" then
				data.raw["roboport"][dy..DATA.Name.."-roboport"].logistics_radius = 75
				data.raw["roboport"][dy..DATA.Name.."-roboport"].construction_radius = 100
			elseif data.raw["roboport"][dy..DATA.Name.."-roboport"].Tier == "Complex_Alloy" then
				data.raw["roboport"][dy..DATA.Name.."-roboport"].logistics_radius = 100
				data.raw["roboport"][dy..DATA.Name.."-roboport"].construction_radius = 150
			elseif data.raw["roboport"][dy..DATA.Name.."-roboport"].Tier == "Super_Alloy" then
				data.raw["roboport"][dy..DATA.Name.."-roboport"].logistics_radius = 150
				data.raw["roboport"][dy..DATA.Name.."-roboport"].construction_radius = 225
			end
		end
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-roboport"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-roboport"].fuel_category = "chemical"
	end
end

function DyWorld_Logistic_Robot(DATA)
data:extend(
{
  {
    type = "logistic-robot",
	name = dy..DATA.Name.."-logistic-robot",
	localised_name = {"looped-name.logistic-robot", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/logistic-robot.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-logistic-robot"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = (((Materials[DATA.Table].Hardness + Materials[DATA.Table].Elasticity) /500) + 0.015),
    transfer_distance = 0.5,
    max_energy = tostring(Materials[DATA.Table].Density).."MJ",
    energy_per_tick = tostring(Materials[DATA.Table].Density / 100).."kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = tostring(Materials[DATA.Table].Density).."kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
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
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
        priority = "high",
        line_length = 16,
        width = 80,
        height = 84,
        frame_count = 1,
        shift = util.by_pixel(0, -3),
        direction_count = 16,
        y = 84,
	    tint = Material_Colors[DATA.Table],
        scale = 0.5
      }
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
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
        priority = "high",
        line_length = 16,
        width = 80,
        height = 84,
        frame_count = 1,
        shift = util.by_pixel(0, -3),
        direction_count = 16,
	    tint = Material_Colors[DATA.Table],
        scale = 0.5
      }
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
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
        priority = "high",
        line_length = 16,
        width = 80,
        height = 84,
        frame_count = 1,
        shift = util.by_pixel(0, -3),
        direction_count = 16,
        y = 252,
	    tint = Material_Colors[DATA.Table],
        scale = 0.5
      }
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
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
        priority = "high",
        line_length = 16,
        width = 80,
        height = 84,
        frame_count = 1,
        shift = util.by_pixel(0, -3),
        direction_count = 16,
        y = 168,
	    tint = Material_Colors[DATA.Table],
        scale = 0.5
      }
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
      y = 23,
      hr_version = {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 115,
        height = 57,
        frame_count = 1,
        shift = util.by_pixel(31.75, 19.75),
        direction_count = 16,
        y = 57,
        scale = 0.5
      }
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
      direction_count = 16,
      hr_version = {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 115,
        height = 57,
        frame_count = 1,
        shift = util.by_pixel(31.75, 19.75),
        direction_count = 16,
        scale = 0.5
      }
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
      y = 23,
      hr_version = {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 115,
        height = 57,
        frame_count = 1,
        shift = util.by_pixel(31.75, 19.75),
        direction_count = 16,
        y = 171,
        scale = 0.5
      }
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
      direction_count = 16,
      hr_version = {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 115,
        height = 57,
        frame_count = 1,
        shift = util.by_pixel(31.75, 19.75),
        direction_count = 16,
        y = 114,
        scale = 0.5
      }
    },
    working_sound = flying_robot_sounds(),
    cargo_centered = {0.0, 0.2},
  },
  {
    type = "item",
	name = dy..DATA.Name.."-logistic-robot",
	localised_name = {"looped-name.logistic-robot", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/logistic-robot.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 200,
	order = dy..DATA.Name.."-logistic-robot",
	place_result = dy..DATA.Name.."-logistic-robot",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-logistic-robot",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{"electronic-circuit", 5}},
    result = dy..DATA.Name.."-logistic-robot",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("logistic-robotics", dy..DATA.Name.."-logistic-robot")
	elseif DATA.Tier == 2 then
		local result_1 = {dy.."logistic-unit", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_1)
		DyWorld_Add_To_Tech("logistic-robotics-2", dy..DATA.Name.."-logistic-robot")
	elseif DATA.Tier == 3 then
		local result_1 = {"processing-unit", 3}
		local result_2 = {dy.."logistic-unit", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_2)
		DyWorld_Add_To_Tech("logistic-robotics-3", dy..DATA.Name.."-logistic-robot")
	elseif DATA.Tier == 4 then
		local result_1 = {dy.."processing-advanced", 3}
		local result_2 = {dy.."logistic-unit", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_2)
		DyWorld_Add_To_Tech("logistic-robotics-4", dy..DATA.Name.."-logistic-robot")
	elseif DATA.Tier == 5 then
		local result_1 = {dy.."processing-advanced", 6}
		local result_2 = {dy.."logistic-unit", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_2)
		DyWorld_Add_To_Tech("logistic-robotics-5", dy..DATA.Name.."-logistic-robot")
	elseif DATA.Tier == 6 then
		local result_1 = {dy.."processing-logic", 12}
		local result_2 = {dy.."logistic-unit", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-logistic-robot"].ingredients, result_2)
		DyWorld_Add_To_Tech("logistic-robotics-6", dy..DATA.Name.."-logistic-robot")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-logistic-robot"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-logistic-robot"].fuel_category = "chemical"
	end
end

function DyWorld_Construction_Robot(DATA)
data:extend(
{
  {
    type = "construction-robot",
	name = dy..DATA.Name.."-construction-robot",
	localised_name = {"looped-name.construction-robot", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/construction-robot.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-construction-robot"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = (((Materials[DATA.Table].Hardness + Materials[DATA.Table].Elasticity) /500) + 0.025),
    transfer_distance = 0.5,
    max_energy = tostring(Materials[DATA.Table].Density).."MJ",
    energy_per_tick = tostring(Materials[DATA.Table].Density / 100).."kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = tostring(Materials[DATA.Table].Density).."kJ",
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
	  tint = Material_Colors[DATA.Table],
      direction_count = 16,
      hr_version = {
        filename = "__base__/graphics/entity/construction-robot/hr-construction-robot.png",
        priority = "high",
        line_length = 16,
        width = 66,
        height = 76,
        frame_count = 1,
        shift = util.by_pixel(0,-4.5),
        direction_count = 16,
	    tint = Material_Colors[DATA.Table],
        scale = 0.5
      }
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
	  tint = Material_Colors[DATA.Table],
      direction_count = 16,
      y = 36,
      hr_version = {
        filename = "__base__/graphics/entity/construction-robot/hr-construction-robot.png",
        priority = "high",
        line_length = 16,
        width = 66,
        height = 76,
        frame_count = 1,
        shift = util.by_pixel(0, -4.5),
        direction_count = 16,
	    tint = Material_Colors[DATA.Table],
        y = 76,
        scale = 0.5
      }
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
      direction_count = 16,
      hr_version = {
        filename = "__base__/graphics/entity/construction-robot/hr-construction-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 104,
        height = 49,
        frame_count = 1,
        shift = util.by_pixel(33.5, 18.75),
        direction_count = 16,
        scale = 0.5
      }
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
      direction_count = 16,
      hr_version = {
        filename = "__base__/graphics/entity/construction-robot/hr-construction-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 104,
        height = 49,
        frame_count = 1,
        shift = util.by_pixel(33.5, 18.75),
        direction_count = 16,
        scale = 0.5
      }
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
	  tint = Material_Colors[DATA.Table],
      hr_version = {
        filename = "__base__/graphics/entity/construction-robot/hr-construction-robot-working.png",
        priority = "high",
        line_length = 2,
        width = 57,
        height = 74,
        frame_count = 2,
        shift = util.by_pixel(-0.25, -5),
        direction_count = 16,
        animation_speed = 0.3,
	    tint = Material_Colors[DATA.Table],
        scale = 0.5
      }
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
  },
  {
    type = "item",
	name = dy..DATA.Name.."-construction-robot",
	localised_name = {"looped-name.construction-robot", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/construction-robot.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 200,
	order = dy..DATA.Name.."-construction-robot",
	place_result = dy..DATA.Name.."-construction-robot",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-construction-robot",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{"electronic-circuit", 5}},
    result = dy..DATA.Name.."-construction-robot",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("construction-robotics", dy..DATA.Name.."-construction-robot")
	elseif DATA.Tier == 2 then
		local result_1 = {dy.."logistic-unit", 1}
		local result_2 = {"advanced-circuit", 3}
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_2)
		DyWorld_Add_To_Tech("construction-robotics-2", dy..DATA.Name.."-construction-robot")
	elseif DATA.Tier == 3 then
		local result_1 = {"processing-unit", 1}
		local result_2 = {dy.."logistic-unit", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_2)
		DyWorld_Add_To_Tech("construction-robotics-3", dy..DATA.Name.."-construction-robot")
	elseif DATA.Tier == 4 then
		local result_1 = {dy.."processing-advanced", 1}
		local result_2 = {dy.."logistic-unit", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_2)
		DyWorld_Add_To_Tech("construction-robotics-4", dy..DATA.Name.."-construction-robot")
	elseif DATA.Tier == 5 then
		local result_1 = {dy.."processing-advanced", 3}
		local result_2 = {dy.."logistic-unit", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_2)
		DyWorld_Add_To_Tech("construction-robotics-5", dy..DATA.Name.."-construction-robot")
	elseif DATA.Tier == 6 then
		local result_1 = {dy.."processing-logic", 9}
		local result_2 = {dy.."logistic-unit", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-construction-robot"].ingredients, result_2)
		DyWorld_Add_To_Tech("construction-robotics-6", dy..DATA.Name.."-construction-robot")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-construction-robot"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-construction-robot"].fuel_category = "chemical"
	end
end

function DyWorld_Walls(DATA)
data:extend(
{
  {
    type = "wall",
	name = dy..DATA.Name.."-wall",
	localised_name = {"looped-name.wall", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/wall.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-wall"},
    max_health = (DyWorld_Material_Formulas(3, DATA.Table) * 50),
    resistances = Material_Resistances[DATA.Table],
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "wall",
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    --[[attack_reaction =
    {
      {
        ---- how far the mirroring works
        range = math.floor(Materials[DATA.Table].Hardness + 1),
        ---- caused damage will be multiplied by this and added to the subsequent damages
        reaction_modifier = 0.1,
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              type = "damage",
              damage = {amount = 0.1, type = "physical"}
            }
          }
        },
      }
    },]]
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    connected_gate_visualization =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      scale = 0.5
    },
    pictures = DyWorld_Wall_Graphics(Material_Colors[DATA.Table]),
    wall_diode_green = util.conditional_return(
        {
          filename = "__base__/graphics/entity/gate/wall-diode-green.png",
          width = 21,
          height = 22,
          shift = {0, -0.78125}
        }),
    wall_diode_green_light = util.conditional_return(
        {
          minimum_darkness = 0.3,
          color = {g=1},
          shift = {0, -0.78125},
          size = 1,
          intensity = 0.3
        }),
    wall_diode_red = util.conditional_return(
    {
      filename = "__base__/graphics/entity/gate/wall-diode-red.png",
      width = 21,
      height = 22,
      shift = {0, -0.78125}
    }),
    wall_diode_red_light = util.conditional_return(
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = {0, -0.78125},
      size = 1,
      intensity = 0.3
    }),
    circuit_wire_connection_point = circuit_connector_definitions["gate"].points,
    circuit_connector_sprites = circuit_connector_definitions["gate"].sprites,
    circuit_wire_max_distance = 9,
    default_output_signal = {type = "virtual", name = "signal-G"}
  },
  {
    type = "item",
	name = dy..DATA.Name.."-wall",
	localised_name = {"looped-name.wall", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/wall.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare",
    stack_size = 200,
	order = dy..DATA.Name.."-wall",
	place_result = dy..DATA.Name.."-wall",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-wall",
    energy_required = 2.5,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-wall",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-wall"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-wall"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-wall"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("stone-walls", dy..DATA.Name.."-wall")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("stone-walls-2", dy..DATA.Name.."-wall")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("stone-walls-3", dy..DATA.Name.."-wall")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("stone-walls-4", dy..DATA.Name.."-wall")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("stone-walls-5", dy..DATA.Name.."-wall")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("stone-walls-6", dy..DATA.Name.."-wall")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-wall"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-wall"].fuel_category = "chemical"
	end
end

function DyWorld_Locomotives(DATA)
data:extend(
{
  {
    type = "locomotive",
	name = dy..DATA.Name.."-locomotive",
	localised_name = {"looped-name.locomotive", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/diesel-locomotive.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-locomotive"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = (1000 + DyWorld_Material_Formulas(3, DATA.Table)),
    resistances = Material_Resistances[DATA.Table],
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
    selection_box = {{-1, -3}, {1, 3}},
    drawing_box = {{-1, -4}, {1, 3}},
    weight = ( 2000 + (Materials[DATA.Table].Strength_Yield * Materials[DATA.Table].Density)),
    max_speed = (1.2 + (Materials[DATA.Table].Density / 100)),
    max_power = tostring(500 + Materials[DATA.Table].Strength_Ultimate).."kW",
    reversing_power_modifier = 0.6,
    braking_force = 10,
    friction_force = 0.50,
    vertical_selection_shift = -0.5,
    air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 5,
    burner =
    {
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 3,
      smoke =
      {
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 100,
          position = {0, 0},
          starting_frame = 0,
          starting_frame_deviation = 60,
          height = 2,
          height_deviation = 0.5,
          starting_vertical_speed = 0.2,
          starting_vertical_speed_deviation = 0.1,
        }
      }
    },
    front_light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.6, -16},
        size = 2,
        intensity = 0.6,
        color = {r = 1.0, g = 0.9, b = 0.9}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -16},
        size = 2,
        intensity = 0.6,
        color = {r = 1.0, g = 0.9, b = 0.9}
      }
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
    pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 238,
          height = 230,
          direction_count = 256,
		  tint = Material_Colors[DATA.Table],
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.0, -0.5},
          hr_version =
            {
            priority = "very-low",
            width = 474,
            height = 458,
            direction_count = 256,
			tint = Material_Colors[DATA.Table],
            filenames =
            {
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-1.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-2.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-3.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-4.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-5.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-6.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-7.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-8.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-9.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-10.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-11.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-12.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-13.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-14.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-15.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-16.png"
            },
            line_length = 4,
            lines_per_file = 4,
            shift = {0.0, -0.5},
            scale = 0.5
            }
        },
        {
          priority = "very-low",
          flags = { "mask" },
          width = 236,
          height = 228,
          direction_count = 256,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.0, -0.5},
          apply_runtime_tint = true,
          hr_version =
            {
              priority = "very-low",
              flags = { "mask" },
              width = 472,
              height = 456,
              direction_count = 256,
              filenames =
              {
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-1.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-2.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-3.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-4.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-5.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-6.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-7.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-8.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-9.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-10.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-11.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-12.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-13.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-14.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-15.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-16.png"
              },
              line_length = 4,
              lines_per_file = 4,
              shift = {0.0, -0.5},
              apply_runtime_tint = true,
              scale = 0.5
            }
        },
        {
          priority = "very-low",
          flags = { "shadow" },
          width = 253,
          height = 212,
          direction_count = 256,
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {1, 0.3}
        }
      }
    },
    wheels = standard_train_wheels,
    rail_category = "regular",
    stop_trigger =
    {
      -- left side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = {-0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
      },
      -- right side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = {0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
      },
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/train-breaks.ogg",
            volume = 0.6
          },
        }
      },
    },
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-engine.ogg",
        volume = 0.4
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    sound_minimum_speed = 0.5;
  },
  {
    type = "item",
	name = dy..DATA.Name.."-locomotive",
	localised_name = {"looped-name.locomotive", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/diesel-locomotive.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare",
    stack_size = 200,
	order = dy..DATA.Name.."-locomotive",
	place_result = dy..DATA.Name.."-locomotive",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-locomotive",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{"locomotive", 1},{dy.."heater", 1},{dy.."gearbox", 2}},
    result = dy..DATA.Name.."-locomotive",
    result_count = 1,
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-locomotive-armor-remover",
    energy_required = 2.5,
    category = dy.."armor-remover",
	enabled = false,
	hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
    ingredients = {{dy..DATA.Name.."-locomotive", 1}},
    result = "locomotive",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 100}
		table.insert(data.raw.recipe[dy..DATA.Name.."-locomotive"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 100}
		table.insert(data.raw.recipe[dy..DATA.Name.."-locomotive"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 100}
		table.insert(data.raw.recipe[dy..DATA.Name.."-locomotive"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("railway", dy..DATA.Name.."-locomotive")
		DyWorld_Add_To_Tech("railway", dy..DATA.Name.."-locomotive-armor-remover")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("railway-2", dy..DATA.Name.."-locomotive")
		DyWorld_Add_To_Tech("railway-2", dy..DATA.Name.."-locomotive-armor-remover")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("railway-3", dy..DATA.Name.."-locomotive")
		DyWorld_Add_To_Tech("railway-3", dy..DATA.Name.."-locomotive-armor-remover")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("railway-4", dy..DATA.Name.."-locomotive")
		DyWorld_Add_To_Tech("railway-4", dy..DATA.Name.."-locomotive-armor-remover")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("railway-5", dy..DATA.Name.."-locomotive")
		DyWorld_Add_To_Tech("railway-5", dy..DATA.Name.."-locomotive-armor-remover")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("railway-6", dy..DATA.Name.."-locomotive")
		DyWorld_Add_To_Tech("railway-6", dy..DATA.Name.."-locomotive-armor-remover")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-locomotive"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-locomotive"].fuel_category = "chemical"
	end
end

function DyWorld_Tanks(DATA)
data:extend(
{
  {
    type = "car",
	name = dy..DATA.Name.."-tank",
	localised_name = {"looped-name.tank", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/tank.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-tank"},
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = (2500 + (DyWorld_Material_Formulas(3, DATA.Table) * 15)),
    resistances = Material_Resistances[DATA.Table],
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(-4, -13),
    immune_to_tree_impacts = true,
    energy_per_hit_point = 0.4 + (DATA.Tier / 10),
    collision_box = {{-0.9, -1.3}, {0.9, 1.3}},
    selection_box = {{-0.9, -1.3}, {0.9, 1.3}},
    drawing_box = {{-1.8, -1.8}, {1.8, 1.5}},
    effectivity = 0.5 + (DATA.Tier / 10),
    braking_power = tostring(400 + Materials[DATA.Table].Strength_Ultimate).."kW",
    burner =
    {
      fuel_category = "chemical",
      effectivity = 0.8 + (DATA.Tier / 10),
      fuel_inventory_size = 1 + DATA.Tier,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
    },
    consumption = tostring(600 + Materials[DATA.Table].Strength_Ultimate).."kW",
    terrain_friction_modifier = 0.2,
    friction = 0.002 + (DATA.Tier / 100),
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200,
        },
        shift = {-0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {r = 0.9, g = 1.0, b = 1.0}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {r = 0.9, g = 1.0, b = 1.0}
      }
    },
    animation =
    {
      layers =
      {
        {
          priority = "low",
          width = 135,
          height = 106,
          frame_count = 2,
          direction_count = 64,
          shift = util.by_pixel(-4.5, -10),
          animation_speed = 8,
          max_advance = 1,
		  tint = Material_Colors[DATA.Table],
          stripes =
          {
            {
             filename = "__base__/graphics/entity/tank/tank-base-1.png",
             width_in_frames = 2,
             height_in_frames = 16,
            },
            {
             filename = "__base__/graphics/entity/tank/tank-base-2.png",
             width_in_frames = 2,
             height_in_frames = 16,
            },
            {
             filename = "__base__/graphics/entity/tank/tank-base-3.png",
             width_in_frames = 2,
             height_in_frames = 16,
            },
            {
             filename = "__base__/graphics/entity/tank/tank-base-4.png",
             width_in_frames = 2,
             height_in_frames = 16,
            }
          },
          hr_version = {
            priority = "low",
            width = 269,
            height = 212,
            frame_count = 2,
            direction_count = 64,
            shift = util.by_pixel(-4.75, -10),
            animation_speed = 8,
            max_advance = 1,
		    tint = Material_Colors[DATA.Table],
            stripes =
            {
              {
               filename = "__base__/graphics/entity/tank/hr-tank-base-1.png",
               width_in_frames = 2,
               height_in_frames = 16,
              },
              {
               filename = "__base__/graphics/entity/tank/hr-tank-base-2.png",
               width_in_frames = 2,
               height_in_frames = 16,
              },
              {
               filename = "__base__/graphics/entity/tank/hr-tank-base-3.png",
               width_in_frames = 2,
               height_in_frames = 16,
              },
              {
               filename = "__base__/graphics/entity/tank/hr-tank-base-4.png",
               width_in_frames = 2,
               height_in_frames = 16,
              }
            },
            scale = 0.5
          }
        },
        {
          priority = "low",
          width = 104,
          height = 84,
          frame_count = 2,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = util.by_pixel(-5, -21),
          max_advance = 1,
          line_length = 2,
		  tint = Material_Colors[DATA.Table],
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/tank/tank-base-mask-1.png",
              width_in_frames = 1,
              height_in_frames = 22,
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-mask-2.png",
              width_in_frames = 1,
              height_in_frames = 22,
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-mask-3.png",
              width_in_frames = 1,
              height_in_frames = 20,
            },
          }),
          hr_version =
          {
            priority = "low",
            width = 207,
            height = 166,
		    tint = Material_Colors[DATA.Table],
            frame_count = 2,
            apply_runtime_tint = true,
            direction_count = 64,
            shift = util.by_pixel(-4.75, -21),
            max_advance = 1,
            line_length = 2,
            stripes = util.multiplystripes(2,
            {
              {
                filename = "__base__/graphics/entity/tank/hr-tank-base-mask-1.png",
                width_in_frames = 1,
                height_in_frames = 22,
              },
              {
                filename = "__base__/graphics/entity/tank/hr-tank-base-mask-2.png",
                width_in_frames = 1,
                height_in_frames = 22,
              },
              {
                filename = "__base__/graphics/entity/tank/hr-tank-base-mask-3.png",
                width_in_frames = 1,
                height_in_frames = 20,
              },
            }),
            scale = 0.5
          }
        },
        {
          priority = "low",
          width = 151,
          height = 98,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = util.by_pixel(17.5, 7),
          max_advance = 1,
          stripes = util.multiplystripes(2,
          {
           {
            filename = "__base__/graphics/entity/tank/tank-base-shadow-1.png",
            width_in_frames = 1,
            height_in_frames = 16,
           },
           {
            filename = "__base__/graphics/entity/tank/tank-base-shadow-2.png",
            width_in_frames = 1,
            height_in_frames = 16,
           },
           {
            filename = "__base__/graphics/entity/tank/tank-base-shadow-3.png",
            width_in_frames = 1,
            height_in_frames = 16,
           },
           {
            filename = "__base__/graphics/entity/tank/tank-base-shadow-4.png",
            width_in_frames = 1,
            height_in_frames = 16,
           }
          }),
          hr_version =
          {
            priority = "low",
            width = 301,
            height = 194,
            frame_count = 2,
            draw_as_shadow = true,
            direction_count = 64,
            shift = util.by_pixel(17.75, 7),
            max_advance = 1,
            stripes = util.multiplystripes(2,
            {
             {
              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-1.png",
              width_in_frames = 1,
              height_in_frames = 16,
             },
             {
              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-2.png",
              width_in_frames = 1,
              height_in_frames = 16,
             },
             {
              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-3.png",
              width_in_frames = 1,
              height_in_frames = 16,
             },
             {
              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-4.png",
              width_in_frames = 1,
              height_in_frames = 16,
             }
            }),
            scale = 0.5
          }
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/tank/tank-turret.png",
          priority = "low",
          line_length = 8,
          width = 90,
          height = 67,
          frame_count = 1,
          direction_count = 64,
          shift = util.by_pixel(-5, -34.5),
          animation_speed = 8,
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            filename = "__base__/graphics/entity/tank/hr-tank-turret.png",
            priority = "low",
            line_length = 8,
            width = 179,
            height = 132,
            frame_count = 1,
            direction_count = 64,
            shift = util.by_pixel(-4.75, -34.5),
            animation_speed = 8,
		    tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/tank/tank-turret-mask.png",
          priority = "low",
          line_length = 8,
          width = 36,
          height = 33,
          frame_count = 1,
          apply_runtime_tint = true,
          direction_count = 64,
		  tint = Material_Colors[DATA.Table],
          shift = util.by_pixel(-5, -35.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/tank/hr-tank-turret-mask.png",
            priority = "low",
            line_length = 8,
            width = 72,
            height = 66,
            frame_count = 1,
            apply_runtime_tint = true,
            direction_count = 64,
            shift = util.by_pixel(-5, -35.5),
		    tint = Material_Colors[DATA.Table],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/tank/tank-turret-shadow.png",
          priority = "low",
          line_length = 8,
          width = 97,
          height = 67,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = util.by_pixel(51.5, 6.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/tank/hr-tank-turret-shadow.png",
            priority = "low",
            line_length = 8,
            width = 193,
            height = 134,
            frame_count = 1,
            draw_as_shadow = true,
            direction_count = 64,
            shift = util.by_pixel(51.25, 6.5),
            scale = 0.5
          }
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    turret_return_timeout = 300,
    stop_trigger_speed = 0.2,
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
        volume = 0.6
      },
    },
    stop_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/car-breaks.ogg",
            volume = 0.6
          },
        }
      },
    },
    sound_minimum_speed = 0.15;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/tank-engine.ogg",
        volume = 0.6
      },
      activate_sound =
      {
        filename = "__base__/sound/fight/tank-engine-start.ogg",
        volume = 0.6
      },
      deactivate_sound =
      {
        filename = "__base__/sound/fight/tank-engine-stop.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    rotation_speed = 0.0035,
    tank_driving = true,
    weight = ( 20000 + (Materials[DATA.Table].Strength_Yield * Materials[DATA.Table].Density)),
    inventory_size = Round((50 + Materials[DATA.Table].Elasticity), 0),
    guns = { dy.."tank-cannon-"..DATA.Tier, dy.."tank-machine-gun-"..DATA.Tier, dy.."tank-flamethrower-"..DATA.Tier },
  },
  {
    type = "item",
	name = dy..DATA.Name.."-tank",
	localised_name = {"looped-name.tank", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/tank.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare",
    stack_size = 1,
	order = dy..DATA.Name.."-tank",
	place_result = dy..DATA.Name.."-tank",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-tank",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{"tank", 1},{dy.."heater", 1},{dy.."gearbox", 2}},
    result = dy..DATA.Name.."-tank",
    result_count = 1,
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-tank-armor-remover",
    energy_required = 2.5,
    category = dy.."armor-remover",
	enabled = true,
	hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
    ingredients = {{dy..DATA.Name.."-tank", 1}},
    result = "tank",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 100}
		table.insert(data.raw.recipe[dy..DATA.Name.."-tank"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 100}
		table.insert(data.raw.recipe[dy..DATA.Name.."-tank"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 100}
		table.insert(data.raw.recipe[dy..DATA.Name.."-tank"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("tanks", dy..DATA.Name.."-tank")
	elseif DATA.Tier == 2 then
		local gun_1 = dy.."tank-shotgun-2"
		table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_1)
		DyWorld_Add_To_Tech("tanks-2", dy..DATA.Name.."-tank")
	elseif DATA.Tier == 3 then
		local gun_1 = dy.."tank-shotgun-3"
		local gun_2 = dy.."tank-rocket-launcher-3"
		table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_1)
		table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_2)
		DyWorld_Add_To_Tech("tanks-3", dy..DATA.Name.."-tank")
	elseif DATA.Tier == 4 then
		local gun_1 = dy.."tank-shotgun-4"
		local gun_2 = dy.."tank-rocket-launcher-4"
		table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_1)
		table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_2)
		--table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_3)
		DyWorld_Add_To_Tech("tanks-4", dy..DATA.Name.."-tank")
	elseif DATA.Tier == 5 then
		local gun_1 = dy.."tank-shotgun-5"
		local gun_2 = dy.."tank-rocket-launcher-5"
		table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_1)
		table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_2)
		--table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_3)
		--table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_4)
		DyWorld_Add_To_Tech("tanks-5", dy..DATA.Name.."-tank")
	elseif DATA.Tier == 6 then
		local gun_1 = dy.."tank-shotgun-6"
		local gun_2 = dy.."tank-rocket-launcher-6"
		local gun_5 = dy.."artillery-tank-cannon"
		table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_1)
		table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_2)
		--table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_3)
		--table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_4)
		table.insert(data.raw.car[dy..DATA.Name.."-tank"].guns, gun_5)
		DyWorld_Add_To_Tech("tanks-6", dy..DATA.Name.."-tank")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-tank"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-tank"].fuel_category = "chemical"
	end
end

function DyWorld_Cars(DATA)
data:extend(
{
  {
    type = "car",
	name = dy..DATA.Name.."-car",
	localised_name = {"looped-name.car", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/car.png",
	  },
	  Materials[DATA.Table].Icon,
	},
	icon_size = 32,
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-car"},
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = (500 + DyWorld_Material_Formulas(3, DATA.Table)),
    resistances = Material_Resistances[DATA.Table],
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(-4, -13),
    immune_to_tree_impacts = true,
    energy_per_hit_point = 0.4 + (DATA.Tier / 10),
    collision_box = {{-0.9, -1.3}, {0.9, 1.3}},
    selection_box = {{-0.9, -1.3}, {0.9, 1.3}},
    drawing_box = {{-1.8, -1.8}, {1.8, 1.5}},
    effectivity = 0.4 + (DATA.Tier / 10),
    braking_power = tostring(200 + Materials[DATA.Table].Strength_Ultimate).."kW",
    burner =
    {
      fuel_category = "chemical",
      effectivity = 0.5 + (DATA.Tier / 10),
      fuel_inventory_size = 1 + DATA.Tier,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
    },
    consumption = tostring(150 + Materials[DATA.Table].Strength_Ultimate).."kW",
    terrain_friction_modifier = 0.2,
    friction = 0.0002 + (DATA.Tier / 1000),
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200,
        },
        shift = {-0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {r = 0.9, g = 1.0, b = 1.0}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {r = 0.9, g = 1.0, b = 1.0}
      }
    },
    render_layer = "object",
    animation =
    {
      layers =
      {
        {
          priority = "low",
          width = 102,
          height = 86,
          frame_count = 2,
          direction_count = 64,
          shift = {0, -0.1875},
          animation_speed = 8,
		  tint = Material_Colors[DATA.Table],
          max_advance = 0.2,
          stripes =
          {
            {
             filename = "__base__/graphics/entity/car/car-1.png",
             width_in_frames = 2,
             height_in_frames = 22
            },
            {
             filename = "__base__/graphics/entity/car/car-2.png",
             width_in_frames = 2,
             height_in_frames = 22
            },
            {
             filename = "__base__/graphics/entity/car/car-3.png",
             width_in_frames = 2,
             height_in_frames = 20
            }
          },
          hr_version =
          {
            priority = "low",
            width = 201,
            height = 172,
            frame_count = 2,
            scale = 0.5,
            direction_count = 64,
            shift = util.by_pixel(0+2, -11.5+8.5),
            animation_speed = 8,
		    tint = Material_Colors[DATA.Table],
            max_advance = 0.2,
            stripes =
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-1.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-2.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-3.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-4.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-5.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-6.png",
                width_in_frames = 2,
                height_in_frames = 9
              }
            }
          }
        },
        {
          priority = "low",
          width = 100,
          height = 75,
          frame_count = 2,
          apply_runtime_tint = true,
          direction_count = 64,
          max_advance = 0.2,
          line_length = 2,
          shift = {0, -0.171875},
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/car/car-mask-1.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-mask-2.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-mask-3.png",
              width_in_frames = 1,
              height_in_frames = 20
            }
          }),
          hr_version =
          {
            priority = "low",
            width = 199,
            height = 147,
            frame_count = 2,
            apply_runtime_tint = true,
            scale = 0.5,
            axially_symmetrical = false,
            direction_count = 64,
            max_advance = 0.2,
            shift = util.by_pixel(0+2, -11+8.5),
            line_length = 1,
            stripes = util.multiplystripes(2,
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-1.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-2.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-3.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-4.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-5.png",
                width_in_frames = 1,
                height_in_frames = 12
              }
            })
          }
        },
        {
          priority = "low",
          width = 114,
          height = 76,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.28125, 0.25},
          max_advance = 0.2,
          stripes = util.multiplystripes(2,
          {
           {
            filename = "__base__/graphics/entity/car/car-shadow-1.png",
            width_in_frames = 1,
            height_in_frames = 22
           },
           {
            filename = "__base__/graphics/entity/car/car-shadow-2.png",
            width_in_frames = 1,
            height_in_frames = 22
           },
           {
            filename = "__base__/graphics/entity/car/car-shadow-3.png",
            width_in_frames = 1,
            height_in_frames = 20
           }
          })
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/car/car-turret.png",
          priority = "low",
          line_length = 8,
          width = 36,
          height = 29,
          frame_count = 1,
          direction_count = 64,
          shift = {0.03125, -0.890625},
          animation_speed = 8,
		  tint = Material_Colors[DATA.Table],
          hr_version =
          {
            priority = "low",
            width = 71,
            height = 57,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 64,
		    tint = Material_Colors[DATA.Table],
            shift = util.by_pixel(0+2, -33.5+8.5),
            animation_speed = 8,
            scale = 0.5,
            stripes =
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-turret-1.png",
                width_in_frames = 1,
                height_in_frames = 32
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-turret-2.png",
                width_in_frames = 1,
                height_in_frames = 32
              }
            }
          }
        },
        {
          filename = "__base__/graphics/entity/car/car-turret-shadow.png",
          priority = "low",
          line_length = 8,
          width = 46,
          height = 31,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.875, 0.359375}
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/car-no-fuel-1.ogg",
        volume = 0.6
      }
    },
    stop_trigger_speed = 0.2,
    stop_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/car-breaks.ogg",
            volume = 0.6
          }
        }
      }
    },
    sound_minimum_speed = 0.2;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/car-engine.ogg",
        volume = 0.6
      },
      activate_sound =
      {
        filename = "__base__/sound/car-engine-start.ogg",
        volume = 0.6
      },
      deactivate_sound =
      {
        filename = "__base__/sound/car-engine-stop.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume = 0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    rotation_speed = 0.015,
    guns = { "vehicle-machine-gun" },
    weight = ( 700 + (Materials[DATA.Table].Strength_Yield * Materials[DATA.Table].Density)),
    inventory_size = Round((80 + Materials[DATA.Table].Elasticity), 0),
  },
  {
    type = "item",
	name = dy..DATA.Name.."-car",
	localised_name = {"looped-name.car", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/car.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare",
    stack_size = 1,
	order = dy..DATA.Name.."-car",
	place_result = dy..DATA.Name.."-car",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-car",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{"car", 1},{dy.."gearbox", 2}},
    result = dy..DATA.Name.."-car",
    result_count = 1,
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-car-armor-remover",
    energy_required = 2.5,
    category = dy.."armor-remover",
	enabled = true,
	hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
    ingredients = {{dy..DATA.Name.."-car", 1}},
    result = "car",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 50}
		table.insert(data.raw.recipe[dy..DATA.Name.."-car"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 50}
		table.insert(data.raw.recipe[dy..DATA.Name.."-car"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 50}
		table.insert(data.raw.recipe[dy..DATA.Name.."-car"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("automobilism", dy..DATA.Name.."-car")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("automobilism-2", dy..DATA.Name.."-car")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("automobilism-3", dy..DATA.Name.."-car")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("automobilism-4", dy..DATA.Name.."-car")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("automobilism-5", dy..DATA.Name.."-car")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("automobilism-6", dy..DATA.Name.."-car")
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-car"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-car"].fuel_category = "chemical"
	end
end

function DyWorld_Speed_Module(DATA)
data:extend(
{
  {
    type = "module",
	name = dy..DATA.Name.."-module-speed",
	localised_name = {"looped-name.speed-module", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/speed-module.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy.."module-speed",
    category = "speed",
    tier = Level,
    order = dy..DATA.Name.."-module-speed",
    stack_size = 50,
    default_request_amount = 10,
    effect = 
    {
      --productivity = {bonus = DyWorld_Material_Formulas(14, DATA.Table)},
      consumption = {bonus = DyWorld_Material_Formulas(15, DATA.Table)},
      --pollution = {bonus = DyWorld_Material_Formulas(17, DATA.Table))},
      speed = {bonus = DyWorld_Material_Formulas(16, DATA.Table)}
    },
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-module-speed",
    energy_required = (10 + (5 * DATA.Tier)),
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-module-speed",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-speed"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-speed"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-speed"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.module[dy..DATA.Name.."-module-speed"].tier = 1
		local result_1 = {"electronic-circuit", (10 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-speed"].ingredients, result_1)
		DyWorld_Add_To_Tech("speed-module", dy..DATA.Name.."-module-speed")
	elseif DATA.Tier == 2 then
		data.raw.module[dy..DATA.Name.."-module-speed"].tier = 2
		local result_1 = {"advanced-circuit", (10 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-speed"].ingredients, result_1)
		DyWorld_Add_To_Tech("speed-module-2", dy..DATA.Name.."-module-speed")
	elseif DATA.Tier == 3 then
		data.raw.module[dy..DATA.Name.."-module-speed"].tier = 3
		local result_1 = {"advanced-circuit", (10 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-speed"].ingredients, result_1)
		local result_1 = {"processing-unit", (5 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-speed"].ingredients, result_1)
		DyWorld_Add_To_Tech("speed-module-3", dy..DATA.Name.."-module-speed")
	elseif DATA.Tier == 4 then
		data.raw.module[dy..DATA.Name.."-module-speed"].tier = 4
		local result_1 = {"processing-unit", (15 + (10 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-speed"].ingredients, result_1)
		DyWorld_Add_To_Tech("speed-module-4", dy..DATA.Name.."-module-speed")
	elseif DATA.Tier == 5 then
		data.raw.module[dy..DATA.Name.."-module-speed"].tier = 5
		local result_1 = {dy.."processing-advanced", (10 + (10 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-speed"].ingredients, result_1)
		DyWorld_Add_To_Tech("speed-module-5", dy..DATA.Name.."-module-speed")
	elseif DATA.Tier == 6 then
		data.raw.module[dy..DATA.Name.."-module-speed"].tier = 6
		local result_1 = {dy.."processing-logic", (10 + (10 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-speed"].ingredients, result_1)
		DyWorld_Add_To_Tech("speed-module-6", dy..DATA.Name.."-module-speed")
	end
end

function DyWorld_Productivity_Module(DATA)
data:extend(
{
  {
    type = "module",
	name = dy..DATA.Name.."-module-productivity",
	localised_name = {"looped-name.productivity-module", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/productivity-module.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy.."module-productivity",
    category = "productivity",
    tier = Level,
    order = dy..DATA.Name.."-module-productivity",
    stack_size = 50,
    default_request_amount = 10,
    limitation = DyWorld_Module_Limitation_Productivity(),
    limitation_message_key = "production-module-usable-only-on-intermediates",
    effect = 
    {
      productivity = {bonus = DyWorld_Material_Formulas(14, DATA.Table)},
      consumption = {bonus = DyWorld_Material_Formulas(15, DATA.Table)},
      pollution = {bonus = DyWorld_Material_Formulas(17, DATA.Table)},
      speed = {bonus = ((DyWorld_Material_Formulas(16, DATA.Table)* 0.5) * -1)}
    },
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-module-productivity",
    energy_required = (10 + (5 * DATA.Tier)),
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-module-productivity",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-productivity"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-productivity"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-productivity"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.module[dy..DATA.Name.."-module-productivity"].tier = 1
		local result_1 = {"electronic-circuit", (10 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-productivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("productivity-module", dy..DATA.Name.."-module-productivity")
	elseif DATA.Tier == 2 then
		data.raw.module[dy..DATA.Name.."-module-productivity"].tier = 2
		local result_1 = {"advanced-circuit", (10 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-productivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("productivity-module-2", dy..DATA.Name.."-module-productivity")
	elseif DATA.Tier == 3 then
		data.raw.module[dy..DATA.Name.."-module-productivity"].tier = 3
		local result_1 = {"advanced-circuit", (10 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-productivity"].ingredients, result_1)
		local result_1 = {"processing-unit", (5 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-productivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("productivity-module-3", dy..DATA.Name.."-module-productivity")
	elseif DATA.Tier == 4 then
		data.raw.module[dy..DATA.Name.."-module-productivity"].tier = 4
		local result_1 = {"processing-unit", (15 + (10 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-productivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("productivity-module-4", dy..DATA.Name.."-module-productivity")
	elseif DATA.Tier == 5 then
		data.raw.module[dy..DATA.Name.."-module-productivity"].tier = 5
		local result_1 = {dy.."processing-advanced", (10 + (10 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-productivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("productivity-module-5", dy..DATA.Name.."-module-productivity")
	elseif DATA.Tier == 6 then
		data.raw.module[dy..DATA.Name.."-module-productivity"].tier = 6
		local result_1 = {dy.."processing-logic", (10 + (10 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-productivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("productivity-module-6", dy..DATA.Name.."-module-productivity")
	end
end

function DyWorld_Effectivity_Module(DATA)
data:extend(
{
  {
    type = "module",
	name = dy..DATA.Name.."-module-effectivity",
	localised_name = {"looped-name.effectivity-module", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/effectivity-module.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy.."module-effectivity",
    category = "effectivity",
    tier = Level,
    order = dy..DATA.Name.."-module-effectivity",
    stack_size = 50,
    default_request_amount = 10,
    effect = 
    {
      --productivity = {bonus = DyWorld_Material_Formulas(14, DATA.Table)},
      consumption = {bonus = (DyWorld_Material_Formulas(15, DATA.Table) * -1)},
      --pollution = {bonus = DyWorld_Material_Formulas(17, DATA.Table)},
      --speed = {bonus = ((DyWorld_Material_Formulas(16, DATA.Table)* 0.5) * -1)}
    },
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-module-effectivity",
    energy_required = (10 + (5 * DATA.Tier)),
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-module-effectivity",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-effectivity"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-effectivity"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-effectivity"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.module[dy..DATA.Name.."-module-effectivity"].tier = 1
		local result_1 = {"electronic-circuit", (10 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-effectivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("effectivity-module", dy..DATA.Name.."-module-effectivity")
	elseif DATA.Tier == 2 then
		data.raw.module[dy..DATA.Name.."-module-effectivity"].tier = 2
		local result_1 = {"advanced-circuit", (10 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-effectivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("effectivity-module-2", dy..DATA.Name.."-module-effectivity")
	elseif DATA.Tier == 3 then
		data.raw.module[dy..DATA.Name.."-module-effectivity"].tier = 3
		local result_1 = {"advanced-circuit", (10 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-effectivity"].ingredients, result_1)
		local result_1 = {"processing-unit", (5 + (5 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-effectivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("effectivity-module-3", dy..DATA.Name.."-module-effectivity")
	elseif DATA.Tier == 4 then
		data.raw.module[dy..DATA.Name.."-module-effectivity"].tier = 4
		local result_1 = {"processing-unit", (15 + (10 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-effectivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("effectivity-module-4", dy..DATA.Name.."-module-effectivity")
	elseif DATA.Tier == 5 then
		data.raw.module[dy..DATA.Name.."-module-effectivity"].tier = 5
		local result_1 = {dy.."processing-advanced", (10 + (10 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-effectivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("effectivity-module-5", dy..DATA.Name.."-module-effectivity")
	elseif DATA.Tier == 6 then
		data.raw.module[dy..DATA.Name.."-module-effectivity"].tier = 6
		local result_1 = {dy.."processing-logic", (10 + (10 * DATA.Tier))}
		table.insert(data.raw.recipe[dy..DATA.Name.."-module-effectivity"].ingredients, result_1)
		DyWorld_Add_To_Tech("effectivity-module-6", dy..DATA.Name.."-module-effectivity")
	end
end

function DyWorld_Armor_Normal(DATA)
data:extend(
{
  {
    type = "armor",
	name = dy..DATA.Name.."-armor",
	localised_name = {"looped-name.armor-1", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/light-armor.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    icon_size = 32,
    flags = {},
    resistances = Material_Resistances[DATA.Table],
    durability = (DyWorld_Material_Formulas(3, DATA.Table) * 25),
    subgroup = dy.."armor-1",
    order = dy..DATA.Name.."-armor",
    stack_size = 10
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-armor",
    energy_required = 2.5,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-armor",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-armor"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-armor"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-armor"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-armor"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("basic-armor", dy..DATA.Name.."-armor")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("simple-alloy-armor", dy..DATA.Name.."-armor")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("alloy-armor", dy..DATA.Name.."-armor")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("complex-alloy-armor", dy..DATA.Name.."-armor")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("super-alloy-armor", dy..DATA.Name.."-armor")
	end
end

function DyWorld_Armor_Modular(DATA)
data:extend(
{
  {
    type = "armor",
	name = dy..DATA.Name.."-modular-armor",
	localised_name = {"looped-name.armor-2", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/modular-armor.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    icon_size = 32,
    flags = {},
    resistances = Material_Resistances[DATA.Table],
    durability = Round((DyWorld_Material_Formulas(3, DATA.Table) * 75), 0),
    subgroup = dy.."armor-2",
    order = dy..DATA.Name.."-modular-armor",
    equipment_grid = dy..DATA.Name.."-equipment-grid",
    stack_size = 1
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-modular-armor",
    energy_required = 2.5,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-modular-armor",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-modular-armor"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-modular-armor"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-modular-armor"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("power-armor", dy..DATA.Name.."-modular-armor")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("power-armor-2", dy..DATA.Name.."-modular-armor")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("power-armor-3", dy..DATA.Name.."-modular-armor")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("power-armor-4", dy..DATA.Name.."-modular-armor")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("power-armor-5", dy..DATA.Name.."-modular-armor")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("power-armor-6", dy..DATA.Name.."-modular-armor")
	end
	if data.raw.module[dy..DATA.Name.."-module-speed"] and data.raw.module[dy..DATA.Name.."-module-productivity"] then
		local result_1 = {dy..DATA.Name.."-module-speed", (2 * DATA.Tier)}
		local result_2 = {dy..DATA.Name.."-module-productivity", (1 * DATA.Tier)}
		table.insert(data.raw.recipe[dy..DATA.Name.."-modular-armor"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-modular-armor"].ingredients, result_2)
	end
end

function DyWorld_Radar(DATA)
data:extend(
{
  {
    type = "radar",
	name = dy..DATA.Name.."-radar",
	localised_name = {"looped-name.radar", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/radar.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-radar"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    corpse = "big-remnants",
	fast_replaceable_group = "radar",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_per_sector = DyWorld_Material_Formulas(20, DATA.Table, DATA.Tier, (8000 / DATA.Tier)),
    max_distance_of_sector_revealed = (10 * DATA.Tier),
    max_distance_of_nearby_sector_revealed = (2 + DATA.Tier),
    energy_per_nearby_scan = DyWorld_Material_Formulas(25, DATA.Table, DATA.Tier, 0.1), --active radius
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = DyWorld_Material_Formulas(20, DATA.Table, DATA.Tier, 10),
    integration_patch =
    {
      filename = "__base__/graphics/entity/radar/radar-integration.png",
      priority = "low",
      width = 119,
      height = 108,
      apply_projection = false,
      direction_count = 1,
      repeat_count = 64,
      line_length = 1,
      shift = util.by_pixel(1.5, 4),
      hr_version =
      {
        filename = "__base__/graphics/entity/radar/hr-radar-integration.png",
        priority = "low",
        width = 238,
        height = 216,
        apply_projection = false,
        direction_count = 1,
        repeat_count = 64,
        line_length = 1,
        shift = util.by_pixel(1.5, 4),
        scale = 0.5
      }
    },
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/radar/radar.png",
          priority = "low",
          width = 98,
          height = 128,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(1, -16),
		  tint = Material_Colors[DATA.Table],
          hr_version = {
            filename = "__base__/graphics/entity/radar/hr-radar.png",
            priority = "low",
            width = 196,
            height = 254,
            apply_projection = false,
            direction_count = 64,
            line_length = 8,
            shift = util.by_pixel(1, -16),
            scale = 0.5,
			tint = Material_Colors[DATA.Table],
          }
        },
        {
          filename = "__base__/graphics/entity/radar/radar-shadow.png",
          priority = "low",
          width = 172,
          height = 94,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(39,3),
          draw_as_shadow = true,
          hr_version = {
            filename = "__base__/graphics/entity/radar/hr-radar-shadow.png",
            priority = "low",
            width = 343,
            height = 186,
            apply_projection = false,
            direction_count = 64,
            line_length = 8,
            shift = util.by_pixel(39.25,3),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/radar.ogg"
        }
      },
      apparent_volume = 2,
    },
    radius_minimap_visualisation_color = { r = 0.059, g = 0.092, b = 0.235, a = 0.275 },
  },
  {
    type = "item",
	name = dy..DATA.Name.."-radar",
	localised_name = {"looped-name.radar", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/radar.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-warfare",
    stack_size = 200,
	order = dy..DATA.Name.."-radar",
	place_result = dy..DATA.Name.."-radar",
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-radar",
    energy_required = 2.5,
	enabled = false,
    ingredients = {},
    result = dy..DATA.Name.."-radar",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-radar"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-radar"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-radar"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-radar"].enabled = true
		local result_1 = {"electronic-circuit", DATA.Tier * 3}
		table.insert(data.raw.recipe[dy..DATA.Name.."-radar"].ingredients, result_1)
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("military", dy..DATA.Name.."-radar")
		local result_1 = {"electronic-circuit", DATA.Tier * 8}
		table.insert(data.raw.recipe[dy..DATA.Name.."-radar"].ingredients, result_1)
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-radar")
		local result_1 = {"advanced-circuit", DATA.Tier * 3}
		table.insert(data.raw.recipe[dy..DATA.Name.."-radar"].ingredients, result_1)
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-radar")
		local result_1 = {"processing-unit", DATA.Tier * 3}
		table.insert(data.raw.recipe[dy..DATA.Name.."-radar"].ingredients, result_1)
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-radar")
		local result_1 = {dy.."processing-advanced", DATA.Tier * 3}
		table.insert(data.raw.recipe[dy..DATA.Name.."-radar"].ingredients, result_1)
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-radar")
		local result_1 = {dy.."processing-logic", DATA.Tier * 3}
		table.insert(data.raw.recipe[dy..DATA.Name.."-radar"].ingredients, result_1)
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-radar"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-radar"].fuel_category = "chemical"
	end
end

function DyWorld_Land_Mines(DATA)
data:extend(
{  
  {
    type = "land-mine",
	name = dy..DATA.Name.."-mine",
	localised_name = {"looped-name.mine", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/land-mine.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    icon_size = 32,
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    mined_sound = { filename = "__core__/sound/deconstruct-small.ogg" },
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-mine"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    dying_explosion = "explosion-hit",
    picture_safe =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine.png",
      priority = "medium",
      width = 32,
      height = 32,
	  tint = Material_Colors[DATA.Table],
    },
    picture_set =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set.png",
      priority = "medium",
      width = 32,
      height = 32,
	  tint = Material_Colors[DATA.Table],
    },
    picture_set_enemy =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set-enemy.png",
      priority = "medium",
      width = 32,
      height = 32,
	  tint = Material_Colors[DATA.Table],
    },
    trigger_radius = 2.5,
    ammo_category = "landmine",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              radius = 6 + Materials[DATA.Table].Hardness,
              force = "enemy",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = 50 + Round(DyWorld_Material_Formulas(8, DATA.Table), 2), type = "impact"}
                  },
                  {
                    type = "damage",
                    damage = { amount = 100 + Round(DyWorld_Material_Formulas(8, DATA.Table), 2), type = "explosion"}
                  },
                  {
                    type = "damage",
                    damage = { amount = 50 + Round(DyWorld_Material_Formulas(8, DATA.Table), 2), type = DATA.DMG_Type}
                  },
                  {
                    type = "create-sticker",
                    sticker = "stun-sticker"
                  }
                }
              }
            },
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = { amount = 100 + Round(DyWorld_Material_Formulas(8, DATA.Table), 2), type = "impact"}
          },
          {
            type = "damage",
            damage = { amount = 700 + Round(DyWorld_Material_Formulas(8, DATA.Table), 2), type = "explosion"}
          },
          {
            type = "damage",
            damage = { amount = 200 + Round(DyWorld_Material_Formulas(8, DATA.Table), 2), type = DATA.DMG_Type}
          },
        }
      }
    },
  },
  {
    type = "item",
	name = dy..DATA.Name.."-mine",
	localised_name = {"looped-name.mine", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/land-mine.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    icon_size = 32,
    flags = {},
    damage_radius = 5 + Materials[DATA.Table].Hardness,
    subgroup = dy..DATA.Name.."-MS-group-warfare",
    stack_size = 200,
	order = dy..DATA.Name.."-mine",
	place_result = dy..DATA.Name.."-mine",
    trigger_radius = (1 + (Materials[DATA.Table].Hardness / 2))
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-mine",
    energy_required = 2.5,
	enabled = false,
    ingredients = {{dy.."gunpowder", (38 + (DATA.Tier * 2))}},
    result = dy..DATA.Name.."-mine",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 3}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mine"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 2}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mine"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 1}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mine"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-mine"].enabled = true
		local result_1 = {"coal", 5}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mine"].ingredients, result_1)
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("military", dy..DATA.Name.."-mine")
		local result_1 = {"explosives", 1}
		local result_2 = {"coal", 2}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mine"].ingredients, result_1)
		table.insert(data.raw.recipe[dy..DATA.Name.."-mine"].ingredients, result_2)
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("military-2", dy..DATA.Name.."-mine")
		local result_1 = {"explosives", 2}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mine"].ingredients, result_1)
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("military-3", dy..DATA.Name.."-mine")
		local result_1 = {"explosives", 4}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mine"].ingredients, result_1)
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("military-4", dy..DATA.Name.."-mine")
		local result_1 = {"explosives", 6}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mine"].ingredients, result_1)
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("military-5", dy..DATA.Name.."-mine")
		local result_1 = {"explosives", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-mine"].ingredients, result_1)
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-mine"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-mine"].fuel_category = "chemical"
	end
end

function DyWorld_Module_Beacons(DATA)
data:extend(
{
  {
    type = "beacon",
	name = dy..DATA.Name.."-beacon",
	localised_name = {"looped-name.beacon", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/beacon.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = DyWorld_Material_Formulas(23, DATA.Table, DATA.Tier), mining_time = DyWorld_Material_Formulas(24, DATA.Table, DATA.Tier), result = dy..DATA.Name.."-beacon"},
    max_health = DyWorld_Material_Formulas(3, DATA.Table),
    resistances = Material_Resistances[DATA.Table],
    corpse = "big-remnants",
	fast_replaceable_group = "beacon",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.5, -2.2}, {1.5, 1.3}},
    allowed_effects = {"consumption", "speed", "pollution"},
    base_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-base.png",
      width = 116,
      height = 93,
      shift = { 0.34375, 0.046875},
	  tint = Material_Colors[DATA.Table],
    },
    animation =
    {
      filename = "__base__/graphics/entity/beacon/beacon-antenna.png",
      width = 54,
      height = 50,
      line_length = 8,
      frame_count = 32,
      shift = { -0.03125, -1.71875},
      animation_speed = 0.5,
	  tint = Material_Colors[DATA.Table],
    },
    animation_shadow =
    {
      filename = "__base__/graphics/entity/beacon/beacon-antenna-shadow.png",
      width = 63,
      height = 49,
      line_length = 8,
      frame_count = 32,
      shift = { 3.140625, 0.484375},
      animation_speed = 0.5
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    supply_area_distance = Round(( 2 + (DATA.Tier)), 0),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_usage = DyWorld_Material_Formulas(20, DATA.Table, DATA.Tier, 1),
    distribution_effectivity = 0.4 + (DATA.Tier / 10),
    module_specification =
    {
      module_slots = 1 + DATA.Tier,
      module_info_icon_shift = {0, 0.5},
      module_info_multi_row_initial_height_modifier = -0.3
    }
  },
  {
    type = "item",
	name = dy..DATA.Name.."-beacon",
	localised_name = {"looped-name.beacon", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/beacon.png",
	  },
	  Materials[DATA.Table].Icon,
	},
    icon_size = 32,
    flags = {},
    damage_radius = 5 + Materials[DATA.Table].Hardness,
    subgroup = dy..DATA.Name.."-MS-group",
    stack_size = 200,
	order = dy..DATA.Name.."-beacon",
	place_result = dy..DATA.Name.."-beacon",
    trigger_radius = (1 + (Materials[DATA.Table].Hardness / 2))
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-beacon",
    energy_required = 10 * DATA.Tier,
	enabled = false,
    ingredients = {{dy.."rotor", 2},{dy.."housing", 1}},
    result = dy..DATA.Name.."-beacon",
    result_count = 1,
  },
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, (10 * DATA.Tier)}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, (15 * DATA.Tier)}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", (12 * DATA.Tier)}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("effect-transmission", dy..DATA.Name.."-beacon")
		local result_1 = {"electronic-circuit", 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("effect-transmission-2", dy..DATA.Name.."-beacon")
		local result_1 = {"electronic-circuit", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
		local result_1 = {"advanced-circuit", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("effect-transmission-3", dy..DATA.Name.."-beacon")
		local result_1 = {"advanced-circuit", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
		local result_1 = {"processing-unit", 10}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("effect-transmission-4", dy..DATA.Name.."-beacon")
		local result_1 = {"processing-unit", 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
		local result_1 = {dy.."processing-advanced", 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("effect-transmission-5", dy..DATA.Name.."-beacon")
		local result_1 = {dy.."processing-advanced", 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
		local result_1 = {dy.."processing-logic", 20}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
		data.raw.beacon[dy..DATA.Name.."-beacon"].allowed_effects = {"consumption", "speed", "pollution", "productivity"}
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("effect-transmission-6", dy..DATA.Name.."-beacon")
		local result_1 = {dy.."processing-logic", 50}
		table.insert(data.raw.recipe[dy..DATA.Name.."-beacon"].ingredients, result_1)
		data.raw.beacon[dy..DATA.Name.."-beacon"].allowed_effects = {"consumption", "speed", "pollution", "productivity"}
	end
	if DATA.Name == "wood" then
		data.raw.item[dy..DATA.Name.."-beacon"].fuel_value = "2MJ"
		data.raw.item[dy..DATA.Name.."-beacon"].fuel_category = "chemical"
	end
end

function DyWorld_Tiles(DATA)
data:extend(
{
  {
    type = "tile",
    name = dy..DATA.Name.."-tile",
	localised_name = {"looped-name.tile", {"looped-name."..DATA.Name}},
    needs_correction = true,
    minable = {hardness = 0.2, mining_time = 0.5, result = dy..DATA.Name.."-tile"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = (1 + (Materials[DATA.Table].Elasticity / 100)),
    layer = 61,
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.25,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 1,
		  tint = Material_Colors[DATA.Table],
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39,
		  tint = Material_Colors[DATA.Table],
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1,
		  tint = Material_Colors[DATA.Table],
        }
      },
      inner_corner =
      {
        picture = dyworld_path_concrete..DATA.Name.."/concrete-inner-corner.png",
        count = 16,
		tint = Material_Colors[DATA.Table],
      },
      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
        count = 16,
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner-mask.png",
          count = 16,
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      },
      outer_corner =
      {
        picture = dyworld_path_concrete..DATA.Name.."/concrete-outer-corner.png",
        count = 8,
		tint = Material_Colors[DATA.Table],
      },
      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
        count = 8,
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner-mask.png",
          count = 8,
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      },
    side =
      {
        picture = dyworld_path_concrete..DATA.Name.."/concrete-side.png",
        count = 16,
		tint = Material_Colors[DATA.Table],
      },
      side_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
        count = 16,
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side-mask.png",
          count = 16,
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      },
      u_transition =
      {
        picture = dyworld_path_concrete..DATA.Name.."/concrete-u.png",
        count = 8,
		tint = Material_Colors[DATA.Table],
      },
      u_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
        count = 8,
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u-mask.png",
          count = 8,
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      },

      o_transition =
      {
        picture = dyworld_path_concrete..DATA.Name.."/concrete-o.png",
        count = 4,
		tint = Material_Colors[DATA.Table],
      },
      o_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
        count = 4,
		tint = Material_Colors[DATA.Table],
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o-mask.png",
          count = 4,
          scale = 0.5,
		  tint = Material_Colors[DATA.Table],
        }
      },
      material_background =
      {
        picture = dyworld_path_concrete..DATA.Name.."/concrete.png",
        count = 8,
		tint = Material_Colors[DATA.Table],
      }
    },
    transitions = 
	{
	  water_transition_template
	  (
		water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/concrete.png",
      "__base__/graphics/terrain/water-transitions/hr-concrete.png",
		{
          o_transition_tall = false,
          u_transition_count = 4,
          o_transition_count = 4,
          side_count = 8,
          outer_corner_count = 8,
          inner_corner_count = 8,
		  tint = Material_Colors[DATA.Table],
          --base = { layer = 40 }
        }
	  )
	},
    transitions_between_transitions = 
	{
      water_transition_template
      (
        water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/concrete-transitions.png",
      "__base__/graphics/terrain/water-transitions/hr-concrete-transitions.png",
        {
          inner_corner_tall = true,
          inner_corner_count = 3,
          outer_corner_count = 3,
          side_count = 3,
          u_transition_count = 1,
          o_transition_count = 0,
		  tint = Material_Colors[DATA.Table],
        }
      )
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color = Material_Colors[DATA.Table],
    ageing = 0,
    vehicle_friction_modifier = (1 + (Materials[DATA.Table].Elasticity / 100)),
  },
  {
    type = "item",
    name = dy..DATA.Name.."-tile",
	localised_name = {"looped-name.tile", {"looped-name."..DATA.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/concrete.png",
		tint = Material_Colors[DATA.Table],
	  },
	},
    icon_size = 32,
    flags = {},
    subgroup = dy..DATA.Name.."-MS-group-tile",
    order = dy..DATA.Name.."-tile",
    stack_size = 500,
    place_as_tile =
    {
      result = dy..DATA.Name.."-tile",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-tile",
    energy_required = 1,
	enabled = false,
	hidden = true,
	category = dy.."tile-crafting",
    ingredients = {{DATA.Name.."-plate", 5}},
    result = dy..DATA.Name.."-tile",
    result_count = 1,
  },
  {
    type = "recipe",
	name = dy..DATA.Name.."-untile",
    energy_required = 1,
	enabled = false,
	hidden = true,
	category = dy.."tile-uncrafting",
    ingredients = {{dy..DATA.Name.."-tile", 1}},
    result = DATA.Name.."-plate",
    result_count = 5,
  },
})
	if DATA.Tier == 1 then
		DyWorld_Add_To_Tech("landfill", dy..DATA.Name.."-tile")
		DyWorld_Add_To_Tech("landfill", dy..DATA.Name.."-untile")
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("landfill-2", dy..DATA.Name.."-tile")
		DyWorld_Add_To_Tech("landfill-2", dy..DATA.Name.."-untile")
	elseif DATA.Tier == 3 then
		DyWorld_Add_To_Tech("landfill-3", dy..DATA.Name.."-tile")
		DyWorld_Add_To_Tech("landfill-3", dy..DATA.Name.."-untile")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("landfill-4", dy..DATA.Name.."-tile")
		DyWorld_Add_To_Tech("landfill-4", dy..DATA.Name.."-untile")
	elseif DATA.Tier == 5 then
		DyWorld_Add_To_Tech("landfill-5", dy..DATA.Name.."-tile")
		DyWorld_Add_To_Tech("landfill-5", dy..DATA.Name.."-untile")
	elseif DATA.Tier == 6 then
		DyWorld_Add_To_Tech("landfill-6", dy..DATA.Name.."-tile")
		DyWorld_Add_To_Tech("landfill-6", dy..DATA.Name.."-untile")
	end
end

function DyWorld_TEMPLATE(DATA)
data:extend(
{
})
	if DATA.Name == "stone" or DATA.Name == "wood" then
		local result_1 = {DATA.Name, 25}
		table.insert(data.raw.recipe[dy..DATA.Name.."-laser-turret"].ingredients, result_1)
	elseif DATA.Name == "rubber" or DATA.Name == "obsidian" or DATA.Name == "chitin" then
		local result_1 = {dy..DATA.Name, 20}
		table.insert(data.raw.recipe[dy..DATA.Name.."-laser-turret"].ingredients, result_1)
	else
		local result_1 = {DATA.Name.."-plate", 15}
		table.insert(data.raw.recipe[dy..DATA.Name.."-laser-turret"].ingredients, result_1)
	end
	if DATA.Tier == 1 then
		data.raw.recipe[dy..DATA.Name.."-splitter"].enabled = true
	elseif DATA.Tier == 2 then
		DyWorld_Add_To_Tech("logistics", dy..DATA.Name.."-splitter")
	elseif DATA.Tier == 4 then
		DyWorld_Add_To_Tech("logistics-2", dy..DATA.Name.."-splitter")
	end
end