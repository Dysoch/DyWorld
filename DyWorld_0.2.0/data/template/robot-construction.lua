require "data/prefix"

Data_Table_Robot_Construction = {
	{
		Name = dyworld_prefix.."construction-robot-1",
		--Icon = --todo
		Recipe_Craft_Time = 2,
		Recipe_Ingredients = {{"wood", 1},{"iron-plate", 7},{"copper-plate", 4}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 100,
		Tint = {r=0.500, g=0.500, b=0.500},
		Slots = 1,
		Speed = 0.015,
		Energy = 5
	},
	{
		Name = dyworld_prefix.."construction-robot-godlike",
		--Icon = --todo
		Recipe_Craft_Time = 2,
		Recipe_Ingredients = {{"wood", 1},{"iron-plate", 7},{"copper-plate", 4}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 100,
		Tint = {r=0.500, g=0.500, b=0.500},
		Slots = 1,
		Speed = 0.5,
		Energy = 5
	},
}

function DyWorld_Robot_Construction_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Robot_Construction_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/construction-robot.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Robot_Construction_Entity(NAME, HEALTH, TINT, SLOTS, SPEED, ENERGY)
  local result =
  {
    type = "construction-robot",
    name = NAME,
    icon = "__base__/graphics/icons/construction-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {hardness = 0.1, mining_time = 0.1, result = NAME},
    resistances = { { type = "fire", percent = 85 } },
    max_health = HEALTH,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = SLOTS,
    speed = SPEED,
    transfer_distance = 0.5,
    max_energy = (tostring((ENERGY/10)+1)).."MJ",
    energy_per_tick = (tostring(ENERGY/100)).."kJ",
    speed_multiplier_when_out_of_energy = (SPEED/5),
    energy_per_move = (tostring(ENERGY)).."kJ",
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
	  tint = TINT
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
	  tint = TINT
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
	  tint = TINT
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

data.raw["roboport"]["roboport"].fast_replaceable_group = "roboport"

for k,v in pairs(Data_Table_Robot_Construction) do
data:extend(
	{
		DyWorld_Robot_Construction_Entity(v.Name, v.Health, v.Tint, v.Slots, v.Speed, v.Energy),
		DyWorld_Robot_Construction_Item(v.Name, v.Stack),
		DyWorld_Robot_Construction_Recipe(v.Name, v.Recipe_Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
	if v.Name == dyworld_prefix.."construction-robot-1" then
		data.raw["construction-robot"][v.Name].energy_per_tick = "0.01kJ"
		data.raw["construction-robot"][v.Name].energy_per_move = "1kJ"
	end
	if v.Name == dyworld_prefix.."construction-robot-godlike" then
		data.raw["construction-robot"][v.Name].energy_per_tick = "0.01kJ"
		data.raw["construction-robot"][v.Name].energy_per_move = "1kJ"
	end
end