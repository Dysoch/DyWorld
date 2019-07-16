require "data/core/functions/prefix"

local SHAPE = {
      width = 1,
      height = 1,
      type = "full"
    }
	
data:extend(
{
  {
    type = "item",
    name = dyworld_debug_prefix.."fusion-equipment",
    icon = "__base__/graphics/icons/fusion-reactor-equipment.png",
	icon_size = 32,
    placed_as_equipment_result = dyworld_debug_prefix.."fusion-equipment",
    flags = {"hidden"},
    --subgroup = dyworld_prefix.."debug",
    order = "x",
    stack_size = 100000
  },
  {
    type = "item",
    name = dyworld_debug_prefix.."shield-equipment",
    icon = "__base__/graphics/icons/energy-shield-equipment.png",
	icon_size = 32,
    placed_as_equipment_result = dyworld_debug_prefix.."shield-equipment",
    flags = {"hidden"},
    --subgroup = dyworld_prefix.."debug",
    order = "x",
    stack_size = 100000
  },
  {
    type = "item",
    name = dyworld_debug_prefix.."battery-equipment",
    icon = "__base__/graphics/icons/battery-equipment.png",
	icon_size = 32,
    placed_as_equipment_result = dyworld_debug_prefix.."battery-equipment",
    flags = {"hidden"},
    --subgroup = dyworld_prefix.."debug",
    order = "x",
    stack_size = 100000
  },
  {
    type = "item",
    name = dyworld_debug_prefix.."laser-defense-equipment",
    icon = "__base__/graphics/icons/personal-laser-defense-equipment.png",
	icon_size = 32,
    placed_as_equipment_result = dyworld_debug_prefix.."laser-defense-equipment",
    flags = {"hidden"},
    --subgroup = dyworld_prefix.."debug",
    order = "x",
    stack_size = 100000
  },
  {
    type = "item",
    name = dyworld_debug_prefix.."exoskeleton-equipment",
    icon = "__base__/graphics/icons/exoskeleton-equipment.png",
	icon_size = 32,
    placed_as_equipment_result = dyworld_debug_prefix.."exoskeleton-equipment",
    flags = {"hidden"},
    --subgroup = dyworld_prefix.."debug",
    order = "x",
    stack_size = 100000
  },
  {
    type = "item",
    name = dyworld_debug_prefix.."roboport-equipment",
    icon = "__base__/graphics/icons/personal-roboport-equipment.png",
	icon_size = 32,
    placed_as_equipment_result = dyworld_debug_prefix.."roboport-equipment",
    flags = {"hidden"},
    --subgroup = dyworld_prefix.."debug",
    order = "x",
    stack_size = 100000
  },
  {
    type = "energy-shield-equipment",
    name = dyworld_debug_prefix.."shield-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/energy-shield-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape = SHAPE,
    max_shield_value = 250000,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "120PJ",
      input_flow_limit = "240PW",
      usage_priority = "primary-input"
    },
    energy_per_shield = "20PJ",
    categories = {"armor"}
  },
  {
    type = "battery-equipment",
    name = dyworld_debug_prefix.."battery-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/battery-equipment.png",
      width = 32,
      height = 64,
      priority = "medium"
    },
    shape = SHAPE,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "20PJ",
      input_flow_limit = "200PW",
      output_flow_limit = "200PW",
      usage_priority = "tertiary"
    },
    categories = {"armor"}
  },
  {
    type = "generator-equipment",
    name = dyworld_debug_prefix.."fusion-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/fusion-reactor-equipment.png",
      width = 128,
      height = 128,
      priority = "medium"
    },
    shape = SHAPE,
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "750000EW",
    categories = {"armor"}
  },
  {
    type = "active-defense-equipment",
    name = dyworld_debug_prefix.."laser-defense-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/personal-laser-defense-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape = SHAPE,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "220PJ"
    },
    attack_parameters =
    {
      type = "beam",
      cooldown = 20,
      range = 250,
      --source_direction_count = 64,
      --source_offset = {0, -3.423489 / 4},
      damage_modifier = 100000,
      ammo_type =
      {
        category = "laser-turret",
        energy_consumption = "1kJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "laser-beam",
            max_length = 250,
            duration = 20,
            source_offset = {0, -1.31439 }
          }
        }
      }
    },
    automatic = true,
    categories = {"armor"}
  },
  {
    type = "movement-bonus-equipment",
    name = dyworld_debug_prefix.."exoskeleton-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/exoskeleton-equipment.png",
      width = 64,
      height = 128,
      priority = "medium"
    },
    shape = SHAPE,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_consumption = "200kW",
    movement_bonus = 2.5,
    categories = {"armor"}
  },
  {
    type = "roboport-equipment",
    name = dyworld_debug_prefix.."roboport-equipment",
    take_result = dyworld_debug_prefix.."roboport-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/personal-roboport-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape = SHAPE,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "35PJ",
      input_flow_limit = "3500PW",
      usage_priority = "secondary-input"
    },
    charging_energy = "100PW",

    robot_limit = 100000,
    construction_radius = 1000,
    spawn_and_station_height = 0.4,
    charge_approach_distance = 2.6,

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
    recharging_light = {intensity = 0.4, size = 5},
    stationing_offset = {0, -0.6},
    charging_station_shift = {0, 0.5},
    charging_station_count = 250,
    charging_distance = 1.6,
    charging_threshold_distance = 5,
    categories = {"armor"}
  },
}
)
