require "data/prefix"

Data_Table_Inserter_Stack = {
	{
		Name = dyworld_prefix.."inserter-stack-1",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"stack-inserter", 1},{"electronic-circuit", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 100,
		Health = 500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed_Extent = (0.07*2),
		Speed_Turn = (0.04*2),
		Energy = (20000*1.5),
	},
	{
		Name = dyworld_prefix.."inserter-stack-2",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{dyworld_prefix.."inserter-stack-1", 1},{"advanced-circuit", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 100,
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed_Extent = (0.07*4),
		Speed_Turn = (0.04*4),
		Energy = (20000*2),
	},
	{
		Name = dyworld_prefix.."inserter-stack-3",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{dyworld_prefix.."inserter-stack-2", 1},{"advanced-circuit", 50}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 100,
		Health = 2500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed_Extent = (0.07*8),
		Speed_Turn = (0.04*8),
		Energy = (20000*2.5),
	},
	{
		Name = dyworld_prefix.."inserter-stack-4",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{dyworld_prefix.."inserter-stack-3", 1},{"processing-unit", 100}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 100,
		Health = 10000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Speed_Extent = (0.07*16),
		Speed_Turn = (0.04*16),
		Energy = (20000*3),
	},
}

function DyWorld_Inserter_Stack_Recipe(DATA)
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

function DyWorld_Inserter_Stack_Item(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name,
    icon = "__base__/graphics/icons/stack-inserter.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."inserter-stack",
    order = DATA.Name,
    place_result = DATA.Name,
    stack_size = DATA.Stack,
  }
  return result
end

function DyWorld_Inserter_Stack_Entity(DATA)
  local result =
  {
    type = "inserter",
    name = DATA.Name,
    icon = "__base__/graphics/icons/stack-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    stack = true,
    minable =
    {
      hardness = 0.2,
      mining_time = 0.5,
      result = DATA.Name
    },
    max_health = DATA.Health,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = DATA.Energy,
    energy_per_rotation = DATA.Energy,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.5kW"
    },
    extension_speed = DATA.Speed_Extent,
    rotation_speed = DATA.Speed_Turn,
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-fast-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-closed.png",
      priority = "extra-high",
      width = 24,
      height = 41
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-open.png",
      priority = "extra-high",
      width = 32,
      height = 41
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/stack-inserter/stack-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
		tint = DATA.Tint,
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  }
  return result
end

for k,v in pairs(Data_Table_Inserter_Stack) do
data:extend(
	{
		DyWorld_Inserter_Stack_Entity(v),
		DyWorld_Inserter_Stack_Item(v),
		DyWorld_Inserter_Stack_Recipe(v),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end