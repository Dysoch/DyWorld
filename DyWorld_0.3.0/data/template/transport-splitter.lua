require "data/prefix"

Data_Table_Transport_Splitter = {
	{
		Name = dyworld_prefix.."transport-splitter-01",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3}},
		Recipe_Results_Count = 4,
		Recipe_Without_Tech = true,
		Stack = 200,
		Health = 10,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = 0.01625,
	},
	{
		Name = dyworld_prefix.."transport-splitter-02",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3}},
		Recipe_Results_Count = 4,
		Recipe_Without_Tech = false,
		Stack = 200,
		Health = 500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = (0.09375*2),
	},
	{
		Name = dyworld_prefix.."transport-splitter-03",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3}},
		Recipe_Results_Count = 4,
		Recipe_Without_Tech = false,
		Stack = 200,
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = (0.09375*4),
	},
	{
		Name = dyworld_prefix.."transport-splitter-04",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3}},
		Recipe_Results_Count = 4,
		Recipe_Without_Tech = false,
		Stack = 200,
		Health = 2500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = (0.09375*8),
	},
	{
		Name = dyworld_prefix.."transport-splitter-05",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3}},
		Recipe_Results_Count = 4,
		Recipe_Without_Tech = false,
		Stack = 200,
		Health = 10000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = (0.09375*16),
	},
}

function DyWorld_Transport_Splitter_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Transport_Splitter_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/splitter.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."transport-splitter",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Transport_Splitter_Entity(NAME, HEALTH, TINT, SPEED)
  local result =
  {
    type = "splitter",
    name = NAME,
    icon = "__base__/graphics/icons/splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = NAME},
    max_health = HEALTH,
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
    belt_horizontal = basic_belt_horizontal,
    belt_vertical = basic_belt_vertical,
    ending_top = basic_belt_ending_top,
    ending_bottom = basic_belt_ending_bottom,
    ending_side = basic_belt_ending_side,
    starting_top = basic_belt_starting_top,
    starting_bottom = basic_belt_starting_bottom,
    starting_side = basic_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "splitter",
    speed = SPEED,
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
		tint = TINT,
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
		  tint = TINT,
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
		tint = TINT,
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
		  tint = TINT,
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
		tint = TINT,
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
		  tint = TINT,
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
		tint = TINT,
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
		  tint = TINT,
        }
      },
    },
    ending_patch = ending_patch_prototype
  }
  return result
end

for k,v in pairs(Data_Table_Transport_Splitter) do
data:extend(
	{
		DyWorld_Transport_Splitter_Entity(v.Name, v.Health, v.Tint, v.Speed),
		DyWorld_Transport_Splitter_Item(v.Name, v.Stack),
		DyWorld_Transport_Splitter_Recipe(v.Name, v.Recipe_Craft_Time, v.Recipe_Results_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end