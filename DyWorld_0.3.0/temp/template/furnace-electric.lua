require "data/prefix"

Data_Table_Furnace_Electric = {
	{
		Name = dyworld_prefix.."furnace-electric-01",
		--Icon = --todo
		Recipe_Craft_Time = 30,
		Recipe_Ingredients = {{"electric-furnace", 1},{dyworld_prefix_intermediate.."heater", 4},{"advanced-circuit", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "250kW",
		Speed = (2*2),
		Pollution = (0.005*2),
		Modules = 3,
	},
	{
		Name = dyworld_prefix.."furnace-electric-02",
		--Icon = --todo
		Recipe_Craft_Time = 60,
		Recipe_Ingredients = {{dyworld_prefix.."furnace-electric-01", 1},{dyworld_prefix_intermediate.."heater", 6},{"processing-unit", 25},{dyworld_prefix_intermediate.."rotor", 5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "450kW",
		Speed = (2*4),
		Pollution = (0.005*4),
		Modules = 5,
	},
	{
		Name = dyworld_prefix.."furnace-electric-03",
		--Icon = --todo
		Recipe_Craft_Time = 90,
		Recipe_Ingredients = {{dyworld_prefix.."furnace-electric-02", 1},{dyworld_prefix_intermediate.."heater", 9},{dyworld_prefix_intermediate.."processing-advanced", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 25000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "750kW",
		Speed = (2*8),
		Pollution = (0.005*8),
		Modules = 7,
	},
	{
		Name = dyworld_prefix.."furnace-electric-04",
		--Icon = --todo
		Recipe_Craft_Time = 120,
		Recipe_Ingredients = {{dyworld_prefix.."furnace-electric-03", 1},{dyworld_prefix_intermediate.."heater", 14},{dyworld_prefix_intermediate.."processing-logic", 25},{dyworld_prefix_intermediate.."crystal", 5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 100000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = "1250kW",
		Speed = (2*16),
		Pollution = (0.005*16),
		Modules = 11,
	},
}

function DyWorld_Furnace_Electric_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
  local result =
  {
    type = "recipe",
    name = NAME,
    energy_required = CRAFTTIME,
	enabled = ENABLED,
    ingredients = {},
    result = NAME,
    result_count = RESULTCOUNT,
  }
  return result
end

function DyWorld_Furnace_Electric_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."furnace-electric",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Furnace_Electric_Entity(NAME, HEALTH, TINT, ENERGY, SPEED, MODULE, POLLUTION)
  local result =
  {
    type = "furnace",
    name = NAME,
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = NAME},
    max_health = HEALTH,
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
      module_slots = MODULE,
      module_info_icon_shift = {0, 0.8}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    crafting_speed = SPEED,
    energy_usage = ENERGY,
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = POLLUTION
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
	  tint = TINT
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

for k,v in pairs(Data_Table_Furnace_Electric) do
data:extend(
	{
		DyWorld_Furnace_Electric_Entity(v.Name, v.Health, v.Tint, v.Energy, v.Speed, v.Modules, v.Pollution),
		DyWorld_Furnace_Electric_Item(v.Name, v.Stack),
		DyWorld_Furnace_Electric_Recipe(v.Name, v.Recipe_Craft_Time, v.Recipe_Results_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end