require "data/prefix"

Data_Table_Radar = {
	{
		Name = dyworld_prefix.."radar-basic",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"raw-wood", 1},{"electronic-circuit", 5},{"iron-plate", 15},{"iron-gear-wheel", 5}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (300*1),
		Scan = 10,
		Sight = 3
	},
	{
		Name = dyworld_prefix.."radar-intermediate",
		--Icon = --todo
		Recipe_Craft_Time = 10,
		Recipe_Ingredients = {{dyworld_prefix.."radar-basic", 1},{"electronic-circuit", 15},{"iron-plate", 25},{"iron-gear-wheel", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 2500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (300*4),
		Scan = 15,
		Sight = 4
	},
	{
		Name = dyworld_prefix.."radar-enhanced",
		--Icon = --todo
		Recipe_Craft_Time = 20,
		Recipe_Ingredients = {{dyworld_prefix.."radar-intermediate", 1},{"advanced-circuit", 15},{"steel-plate", 25},{"iron-gear-wheel", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 10000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (300*7),
		Scan = 25,
		Sight = 5
	},
	{
		Name = dyworld_prefix.."radar-advanced",
		--Icon = --todo
		Recipe_Craft_Time = 40,
		Recipe_Ingredients = {{dyworld_prefix.."radar-enhanced", 1},{"advanced-circuit", 15},{"steel-plate", 75}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 50000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (300*10),
		Scan = 50,
		Sight = 6
	},
	{
		Name = dyworld_prefix.."radar-godlike",
		--Icon = --todo
		Recipe_Craft_Time = 120,
		Recipe_Ingredients = {{dyworld_prefix.."radar-advanced", 2},{"processing-unit", 150},{"solar-panel", 50},{"accumulator", 50},{"steel-plate", 300},{"iron-gear-wheel", 200}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 250000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (300*0.1),
		Scan = 1000,
		Sight = 10
	},
}

function DyWorld_Radar_Recipe(DATA)
  local result =
  {
    type = "recipe",
    name = DATA.Name,
    energy_required = DATA.Recipe_Craft_Time,
	enabled = DATA.Recipe_Without_Tech,
    ingredients = {},
    result = DATA.Name,
    result_count = DATA.Recipe_Results_Count,
  }
  return result
end

function DyWorld_Radar_Item(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name,
    icon = "__base__/graphics/icons/radar.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = DATA.Name,
    place_result = DATA.Name,
    stack_size = DATA.Stack,
  }
  return result
end

function DyWorld_Radar_Entity(DATA)
  local result =
  {
    type = "radar",
    name = DATA.Name,
    icon = "__base__/graphics/icons/radar.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = DATA.Name},
    max_health = DATA.Health,
    corpse = "big-remnants",
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
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_per_sector = (tostring(DATA.Energy/30)).."MJ",
    max_distance_of_sector_revealed = DATA.Scan,
    max_distance_of_nearby_sector_revealed = DATA.Sight,
    energy_per_nearby_scan = (tostring(math.floor(DATA.Energy*0.75))).."kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = (tostring(DATA.Energy)).."kW",
    pictures =
    {
      filename = "__base__/graphics/entity/radar/radar.png",
      priority = "low",
      width = 153,
      height = 131,
      apply_projection = false,
      direction_count = 64,
      line_length = 8,
      shift = util.by_pixel(27.5,-12.5),
	  tint = DATA.Tint
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
  }
  return result
end

data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"

for k,v in pairs(Data_Table_Radar) do
data:extend(
	{
		DyWorld_Radar_Entity(v),
		DyWorld_Radar_Item(v),
		DyWorld_Radar_Recipe(v),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end