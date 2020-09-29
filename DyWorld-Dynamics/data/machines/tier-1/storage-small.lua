data:extend({
  {
    type = "container",
    name = "small-storage",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "small-storage"},
    max_health = 150,
    corpse = "wooden-chest-remnants",
    dying_explosion = "wooden-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    --damaged_trigger_effect = hit_effects.entity(),
    inventory_size = 30,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg", volume = 0.6 },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.6 },
    --vehicle_impact_sound = sounds.car_wood_impact(0.5),
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/wooden-chest/wooden-chest.png",
          priority = "extra-high",
          width = 32,
          height = 36,
          shift = util.by_pixel(0.5, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/wooden-chest/hr-wooden-chest.png",
            priority = "extra-high",
            width = 62,
            height = 72,
            shift = util.by_pixel(0.5, -2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/wooden-chest/wooden-chest-shadow.png",
          priority = "extra-high",
          width = 52,
          height = 20,
          shift = util.by_pixel(10, 6.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/wooden-chest/hr-wooden-chest-shadow.png",
            priority = "extra-high",
            width = 104,
            height = 40,
            shift = util.by_pixel(10, 6.5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
	circuit_wire_connection_point = data.raw.container["wooden-chest"].circuit_wire_connection_point,
	circuit_connector_sprites = data.raw.container["wooden-chest"].circuit_connector_sprites,
	circuit_wire_max_distance = data.raw.container["wooden-chest"].circuit_wire_max_distance,
  },
  {
    type = "item",
    name = "small-storage",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."chests",
    order = "storage-1",
    place_result = "small-storage",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "small-storage",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {"wood", 3}
      },
      result = "small-storage",
	  energy_required = 1,
	  enabled = true,
    },
    expensive =
    {
      ingredients =
      {
        {"wood", 10}
      },
      result = "small-storage",
	  energy_required = 5,
	  enabled = true,
    },
  },
})