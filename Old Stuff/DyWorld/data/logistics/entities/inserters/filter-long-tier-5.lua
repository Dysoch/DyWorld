require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Logistics"].value then

local SPEED = 10
local TIER = 5
local STACK_TIER = 2

data:extend(
{
  {
    type = "inserter",
    name = "filter-long-inserter-tier-"..STACK_TIER,
	localised_name = {"looped-name.inserter-7", STACK_TIER},
    icon = "__base__/graphics/icons/filter-inserter.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = { mining_time = 0.1, result = "filter-long-inserter-tier-"..STACK_TIER },
    max_health = 160,
    corpse = "stack-inserter-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
	
    pickup_position = {0, -2},
    insert_position = {0, 2.2},
	
    energy_per_movement = (SPEED * 9).."KJ",
    energy_per_rotation = (SPEED * 9).."KJ",
	
    stack = false,
    filter_count = 5,
	
    extension_speed = DyWorld_Inserter_Tiered_Extension(SPEED),
    rotation_speed = DyWorld_Inserter_Tiered_Rotation(SPEED),
	
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    fast_replaceable_group = "inserter-2",
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
      filename = "__base__/graphics/entity/filter-inserter/filter-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
      hr_version =
      {
        filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/filter-inserter/filter-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/filter-inserter/filter-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
		tint = Color_Tier[TIER],
        hr_version =
        {
          filename = "__base__/graphics/entity/inserter/hr-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
		  tint = Color_Tier[TIER],
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "item",
    name = "filter-long-inserter-tier-"..STACK_TIER,
	localised_name = {"looped-name.inserter-7", STACK_TIER},
    icon = "__base__/graphics/icons/filter-inserter.png",
	flags = {},
    icon_size = 64,
    subgroup = dy.."inserter-tier-"..(TIER-1),
    order = "3",
    place_result = "filter-long-inserter-tier-"..STACK_TIER,
    stack_size = 200
  },
  {
    type = "recipe",
    name = "filter-long-inserter-tier-"..STACK_TIER,
    energy_required = SPEED,
    enabled = false,
    ingredients = {
      {"filter-inserter-tier-2", 1},
      {"tough-control-board", 1},
      {"tough-motor", 1},
      {"stainless-steel-plate", 2}
	},
    result = "filter-long-inserter-tier-"..STACK_TIER
  },
}
)

DyWorld_Add_To_Tech("automation-"..TIER, "filter-long-inserter-tier-"..STACK_TIER)

end