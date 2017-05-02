require "data/prefix"

Data_Table_Roboport = {
	{
		Name = dyworld_prefix.."roboport-1",
		--Icon = --todo
		Recipe_Craft_Time = 60,
		Recipe_Ingredients = {{"roboport", 1},{"processing-unit", 50},{"steel-plate", 150}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = 500,
		Radius_Construct = 250,
		Radius_Logistic = 50,
		Slots = 10,
	},
	{
		Name = dyworld_prefix.."roboport-2",
		--Icon = --todo
		Recipe_Craft_Time = 60,
		Recipe_Ingredients = {{"roboport", 1},{"processing-unit", 75},{"steel-plate", 200}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = 500,
		Radius_Construct = 500,
		Radius_Logistic = 0,
		Slots = 10,
	},
	{
		Name = dyworld_prefix.."roboport-3",
		--Icon = --todo
		Recipe_Craft_Time = 60,
		Recipe_Ingredients = {{"roboport", 1},{"processing-unit", 100},{"steel-plate", 100}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = 500,
		Radius_Construct = 100,
		Radius_Logistic = 100,
		Slots = 10,
	},
}

function DyWorld_Roboport_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Roboport_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Roboport_Entity(NAME, HEALTH, TINT, ENERGY, RADIUS_LOGISTIC, RADIUS_CONSTRUCT, SLOTS)
  local result =
  {
    type = "roboport",
    name = NAME,
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = NAME},
    max_health = HEALTH,
    corpse = "big-remnants",
    fast_replaceable_group = "roboport",
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
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
    dying_explosion = "medium-explosion",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = (tostring(ENERGY/20).."MW"),
      buffer_capacity = (tostring(ENERGY).."MJ")
    },
    recharge_minimum = (tostring(ENERGY/0.4).."MJ"),
    energy_usage = (tostring(ENERGY/2).."kW"),
    -- per one charge slot
    charging_energy = (tostring(ENERGY*10).."kW"),
    logistics_radius = RADIUS_LOGISTIC,
    construction_radius = RADIUS_CONSTRUCT,
    charge_approach_distance = 5,
    robot_slots_count = SLOTS,
    material_slots_count = SLOTS,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {-1.5, -0.5}, {1.5, -0.5}, {1.5, 1.5}, {-1.5, 1.5},
    },
    base =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base.png",
      width = 143,
      height = 135,
      shift = {0.5, 0.25},
	  tint = TINT
    },
    base_patch =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-patch.png",
      priority = "medium",
      width = 69,
      height = 50,
      frame_count = 1,
      shift = {0.03125, 0.203125},
	  tint = TINT
    },
    base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 42,
      height = 31,
      frame_count = 8,
      animation_speed = 0.5,
      shift = {-0.5315, -1.9375},
	  tint = TINT
    },
    door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 52,
      height = 20,
      frame_count = 16,
      shift = {0.015625, -0.890625}
    },
    door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 52,
      height = 22,
      frame_count = 16,
      shift = {0.015625, -0.234375}
    },
    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.6 },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.5,
      probability = 1 / (5 * 60) -- average pause between the sound is 5 seconds
    },
    recharging_light = {intensity = 0.4, size = 5, color = {r = 1.0, g = 1.0, b = 1.0}},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = -0.1,

    draw_logistic_radius_visualization = true,
    draw_construction_radius_visualization = true,

    open_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 1.2 }
      },
    },
    close_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 0.75 }
      },
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {1.17188, 1.98438},
        green = {1.04688, 2.04688}
      },
      wire =
      {
        red = {0.78125, 1.375},
        green = {0.78125, 1.53125}
      }
    },
    circuit_connector_sprites = get_circuit_connector_sprites({0.59375, 1.3125}, nil, 18),
    circuit_wire_max_distance = 7.5,
    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
  }
  return result
end

data.raw["roboport"]["roboport"].fast_replaceable_group = "roboport"

for k,v in pairs(Data_Table_Roboport) do
data:extend(
	{
		DyWorld_Roboport_Entity(v.Name, v.Health, v.Tint, v.Energy, v.Radius_Logistic, v.Radius_Construct, v.Slots),
		DyWorld_Roboport_Item(v.Name, v.Stack),
		DyWorld_Roboport_Recipe(v.Name, v.Recipe_Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end