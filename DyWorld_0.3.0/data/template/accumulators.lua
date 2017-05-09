require "data/prefix"

Data_Table_Accumulators = {
	{
		Name = dyworld_prefix.."accumulator-1",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"solar-panel", 1},{"advanced-circuit", 5},{"steel-plate", 15},{"battery", 10}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*5),
	},
	{
		Name = dyworld_prefix.."accumulator-2",
		--Icon = --todo
		Recipe_Craft_Time = 10,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-1", 1},{"advanced-circuit", 15},{"steel-plate", 25},{"battery", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*10),
	},
	{
		Name = dyworld_prefix.."accumulator-3",
		--Icon = --todo
		Recipe_Craft_Time = 15,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-2", 1},{"advanced-circuit", 50},{"steel-plate", 50},{"battery", 50}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 2000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*15),
	},
	{
		Name = dyworld_prefix.."accumulator-4",
		--Icon = --todo
		Recipe_Craft_Time = 20,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-3", 1},{"processing-unit", 15},{"steel-plate", 75},{"battery", 75}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*25),
	},
	{
		Name = dyworld_prefix.."accumulator-5",
		--Icon = --todo
		Recipe_Craft_Time = 25,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-4", 1},{"processing-unit", 30},{"steel-plate", 100},{"battery", 100}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 10000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*35),
	},
	{
		Name = dyworld_prefix.."accumulator-6",
		--Icon = --todo
		Recipe_Craft_Time = 30,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-5", 1},{"processing-unit", 45},{"steel-plate", 150},{"battery", 150}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 20000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*50),
	},
	{
		Name = dyworld_prefix.."accumulator-7",
		--Icon = --todo
		Recipe_Craft_Time = 35,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-6", 1},{"processing-unit", 60},{"steel-plate", 200},{"battery", 200}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 50000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*65),
	},
	{
		Name = dyworld_prefix.."accumulator-8",
		--Icon = --todo
		Recipe_Craft_Time = 40,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-7", 1},{"processing-unit", 120},{"steel-plate", 250},{"battery", 250}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 100000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*100),
	},
	{
		Name = dyworld_prefix.."accumulator-9",
		--Icon = --todo
		Recipe_Craft_Time = 45,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-8", 1},{"processing-unit", 250},{"steel-plate", 300},{"battery", 350}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 200000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*200),
	},
}

function DyWorld_Accumulators_Recipe(DATA)
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

function DyWorld_Accumulators_Item(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name,
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."accumulator",
    order = DATA.Name,
    place_result = DATA.Name,
    stack_size = DATA.Stack,
  }
  return result
end

function DyWorld_Accumulators_Entity(DATA)
  local result =
  {
    type = "accumulator",
    name = DATA.Name,
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = DATA.Name},
    max_health = DATA.Health,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = (tostring(DATA.Energy)).."MJ",
      usage_priority = "terciary",
      input_flow_limit = (tostring(DATA.Energy*60)).."kW",
      output_flow_limit = (tostring(DATA.Energy*60)).."kW"
    },
    picture =
    {
      filename = "__base__/graphics/entity/accumulator/accumulator.png",
      priority = "extra-high",
      width = 124,
      height = 103,
      shift = {0.6875, -0.203125},
	  tint = DATA.Tint,
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
    circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
    circuit_wire_max_distance = 7.5,
    default_output_signal = {type = "virtual", name = "signal-A"}
  }
  return result
end

data.raw["roboport"]["roboport"].fast_replaceable_group = "roboport"

for k,v in pairs(Data_Table_Accumulators) do
data:extend(
	{
		DyWorld_Accumulators_Entity(v),
		DyWorld_Accumulators_Item(v),
		DyWorld_Accumulators_Recipe(v),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end