require "data/prefix"

Data_Table_Logistic_Storage = {
	{
		Name = dyworld_prefix.."logistic-storage-1",
		--Icon = --todo
		Recipe_Craft_Time = 2.5,
		Recipe_Ingredients = {{"wood", 5},{"iron-plate", 10},{"copper-plate", 10}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 100,
		Tint = {r=0.500, g=0.500, b=0.500},
		Slots = 1,
	},
}

function DyWorld_Logistic_Storage_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Logistic_Storage_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."chest-storage",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Logistic_Storage_Entity(NAME, HEALTH, TINT, SLOTS)
  local result =
  {
    type = "logistic-container",
    name = NAME,
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = NAME},
    max_health = HEALTH,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_size = SLOTS,
    logistic_mode = "storage",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__base__/graphics/entity/logistic-chest/logistic-chest-storage.png",
      priority = "extra-high",
      width = 38,
      height = 32,
      shift = {0.09375, 0},
	  tint = TINT
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.734375, 0.453125},
        green = {0.609375, 0.515625},
      },
      wire =
      {
        red = {0.40625, 0.21875},
        green = {0.40625, 0.375},
      }
    },
    circuit_wire_max_distance = 7.5,
    circuit_connector_sprites = get_circuit_connector_sprites({0.1875, 0.15625}, nil, 18),
  }
  return result
end

data.raw["roboport"]["roboport"].fast_replaceable_group = "roboport"

for k,v in pairs(Data_Table_Logistic_Storage) do
data:extend(
	{
		DyWorld_Logistic_Storage_Entity(v.Name, v.Health, v.Tint, v.Slots),
		DyWorld_Logistic_Storage_Item(v.Name, v.Stack),
		DyWorld_Logistic_Storage_Recipe(v.Name, v.Recipe_Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end