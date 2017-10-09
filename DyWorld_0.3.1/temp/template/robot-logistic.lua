require "data/prefix"

Data_Table_Robot_Logistic = {
	{
		Name = dyworld_prefix.."logistic-robot-godlike",
		--Icon = --todo
		Recipe_Craft_Time = 2,
		Recipe_Ingredients = {{"logistic-robot", 1},{dyworld_prefix_intermediate.."processing-advanced", 7},{dyworld_prefix_intermediate.."processing-logic", 4},{dyworld_prefix_intermediate.."logistic-unit", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 100,
		Tint = {r=0.500, g=0.500, b=0.500},
		Slots = 1,
		Speed = 0.75,
		Energy = 500
	},
}

function DyWorld_Robot_Logistic_Recipe(DATA)
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

function DyWorld_Robot_Logistic_Item(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name,
    icon = "__base__/graphics/icons/construction-robot.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."robot-logistic",
    order = DATA.Name,
    place_result = DATA.Name,
    stack_size = DATA.Stack,
  }
  return result
end

function DyWorld_Robot_Logistic_Entity(DATA)
  local result =
  {
    type = "logistic-robot",
    name = DATA.Name,
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {hardness = 0.1, mining_time = 0.1, result = DATA.Name},
    resistances = { { type = "fire", percent = 85 } },
    max_health = DATA.Health,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = DATA.Speed,
    transfer_distance = 0.5,
    max_energy = (tostring((DATA.Energy/10)+1)).."MJ",
    energy_per_tick = (tostring(DATA.Energy/100)).."kJ",
    speed_multiplier_when_out_of_energy = (DATA.Speed/5),
    energy_per_move = (tostring(DATA.Energy)).."kJ",
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
	  tint = DATA.Tint
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
	  tint = DATA.Tint
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
	  tint = DATA.Tint
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
	  tint = DATA.Tint
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

for k,v in pairs(Data_Table_Robot_Logistic) do
data:extend(
	{
		DyWorld_Robot_Logistic_Entity(v),
		DyWorld_Robot_Logistic_Item(v),
		DyWorld_Robot_Logistic_Recipe(v),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
	if v.Name == dyworld_prefix.."logistic-robot-godlike" then
		data.raw["logistic-robot"][v.Name].energy_per_tick = "0.01kJ"
		data.raw["logistic-robot"][v.Name].energy_per_move = "1kJ"
	end
end