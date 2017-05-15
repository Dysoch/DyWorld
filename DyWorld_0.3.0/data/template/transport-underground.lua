require "data/prefix"

Data_Table_Transport_Underground = {
	{
		Name = dyworld_prefix.."transport-underground-01",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3}},
		Recipe_Results_Count = 2,
		Recipe_Without_Tech = true,
		Stack = 200,
		Health = 10,
		Range = 3,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = 0.01625,
	},
	{
		Name = dyworld_prefix.."transport-underground-02",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3}},
		Recipe_Results_Count = 2,
		Recipe_Without_Tech = true,
		Stack = 200,
		Health = 500,
		Range = 12,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = (0.09375*2),
	},
	{
		Name = dyworld_prefix.."transport-underground-03",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3}},
		Recipe_Results_Count = 2,
		Recipe_Without_Tech = true,
		Stack = 200,
		Health = 1000,
		Range = 16,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = (0.09375*4),
	},
	{
		Name = dyworld_prefix.."transport-underground-04",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3}},
		Recipe_Results_Count = 2,
		Recipe_Without_Tech = true,
		Stack = 200,
		Health = 2500,
		Range = 20,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = (0.09375*8),
	},
	{
		Name = dyworld_prefix.."transport-underground-05",
		--Icon = --todo
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"wood", 3}},
		Recipe_Results_Count = 2,
		Recipe_Without_Tech = true,
		Stack = 200,
		Health = 10000,
		Range = 25,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed = (0.09375*16),
	},
}

function DyWorld_Transport_Underground_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Transport_Underground_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/underground-belt.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."transport-underground",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Transport_Underground_Entity(NAME, HEALTH, TINT, SPEED, RANGE)
  local result =
  {
    type = "underground-belt",
    name = NAME,
    icon = "__base__/graphics/icons/transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = NAME},
    max_health = HEALTH,
    corpse = "small-remnants",
    max_distance = RANGE,
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 32,
    belt_horizontal = basic_belt_horizontal,
    belt_vertical = basic_belt_vertical,
    ending_top = basic_belt_ending_top,
    ending_bottom = basic_belt_ending_bottom,
    ending_side = basic_belt_ending_side,
    starting_top = basic_belt_starting_top,
    starting_bottom = basic_belt_starting_bottom,
    starting_side = basic_belt_starting_side,
    fast_replaceable_group = "underground-belt",
    speed = SPEED,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
          y = 43,
		  tint = TINT,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5,
		    tint = TINT,
          }
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
		  tint = TINT,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            scale = 0.5,
		    tint = TINT,
          }

        }

      }
    },
    ending_patch = ending_patch_prototype
  }
  return result
end

for k,v in pairs(Data_Table_Transport_Underground) do
data:extend(
	{
		DyWorld_Transport_Underground_Entity(v.Name, v.Health, v.Tint, v.Speed, v.Range),
		DyWorld_Transport_Underground_Item(v.Name, v.Stack),
		DyWorld_Transport_Underground_Recipe(v.Name, v.Recipe_Craft_Time, v.Recipe_Results_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end