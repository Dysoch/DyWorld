require "data/prefix"

Data_Table_Miner_Burner = {
	{
		Name = dyworld_prefix.."drill-burner-1",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3},{"iron-plate", 10},{"copper-plate", 4}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 100,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = 0.25,
		Effectivity = 0.75,
		Pollution = 5,
		Energy = "250kW",
		Power = 1.5,
		Radius = 0.99,
	},
	{
		Name = dyworld_prefix.."drill-burner-2",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{dyworld_prefix.."drill-burner-1", 1},{"iron-plate", 10}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Stack = 50,
		Health = 150,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = 0.3,
		Effectivity = 1,
		Pollution = 10,
		Energy = "350kW",
		Power = 2.5,
		Radius = 0.99,
	},
}

function DyWorld_Miner_Burner_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Miner_Burner_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Miner_Burner_Entity(NAME, HEALTH, TINT, SPEED, EFFECTIVITY, POLLUTION, ENERGY, POWER, RADIUS)
  local result =
  {
    type = "mining-drill",
    name = NAME,
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    flags = {"placeable-neutral", "player-creation"},
    resource_categories = {"basic-solid"},
    minable = {mining_time = 1, result = NAME},
    max_health = HEALTH,
    corpse = "medium-remnants",
    collision_box = {{ -0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{ -1, -1}, {1, 1}},
    mining_speed = SPEED,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/burner-mining-drill.ogg",
        volume = 0.8
      },
    },
    energy_source =
    {
      type = "burner",
      effectivity = EFFECTIVITY,
      fuel_inventory_size = 1,
      emissions = (POLLUTION/10) / POLLUTION,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 3
        }
      }
    },
    energy_usage = ENERGY,
    mining_power = POWER,
    animations =
    {
      north =
      {
        priority = "extra-high",
        width = 110,
        height = 76,
        line_length = 4,
        shift = {0.6875, -0.09375},
        filename = "__base__/graphics/entity/burner-mining-drill/north.png",
        frame_count = 32,
        animation_speed = 0.5,
        run_mode = "forward-then-backward",
		tint = TINT
      },
      east =
      {
        priority = "extra-high",
        width = 94,
        height = 74,
        line_length = 4,
        shift = {0.4375, -0.09375},
        filename = "__base__/graphics/entity/burner-mining-drill/east.png",
        frame_count = 32,
        animation_speed = 0.5,
        run_mode = "forward-then-backward",
		tint = TINT
      },
      south =
      {
        priority = "extra-high",
        width = 89,
        height = 88,
        line_length = 4,
        shift = {0.40625, 0},
        filename = "__base__/graphics/entity/burner-mining-drill/south.png",
        frame_count = 32,
        animation_speed = 0.5,
        run_mode = "forward-then-backward",
		tint = TINT
      },
      west =
      {
        priority = "extra-high",
        width = 91,
        height = 78,
        line_length = 4,
        shift = {0.09375, -0.0625},
        filename = "__base__/graphics/entity/burner-mining-drill/west.png",
        frame_count = 32,
        animation_speed = 0.5,
        run_mode = "forward-then-backward",
		tint = TINT
      }
    },
    resource_searching_radius = RADIUS,
    vector_to_place_result = {-0.5, -1.3},
    fast_replaceable_group = "mining-drill"
  }
  return result
end

for k,v in pairs(Data_Table_Miner_Burner) do
data:extend(
	{
		DyWorld_Miner_Burner_Entity(v.Name, v.Health, v.Tint, v.Speed, v.Effectivity, v.Pollution, v.Energy, v.Power, v.Radius),
		DyWorld_Miner_Burner_Item(v.Name, v.Stack),
		DyWorld_Miner_Burner_Recipe(v.Name, v.Recipe_Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end