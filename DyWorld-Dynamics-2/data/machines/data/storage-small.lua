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
        {"wood", 16}
      },
      result = "small-storage",
	  energy_required = 15,
	  enabled = true,
    },
  },
  {
    type = "container",
    name = "small-storage-2",
    icon = "__base__/graphics/icons/iron-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "small-storage-2"},
    max_health = 200,
    corpse = "iron-chest-remnants",
    dying_explosion = "iron-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    --damaged_trigger_effect = hit_effects.entity(),
    inventory_size = 35,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume = 0.43 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
    --vehicle_impact_sound = sounds.car_wood_impact(0.5),
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          shift = util.by_pixel(0, -0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest.png",
            priority = "extra-high",
            width = 66,
            height = 76,
            shift = util.by_pixel(-0.5, -0.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
          priority = "extra-high",
          width = 56,
          height = 26,
          shift = util.by_pixel(10, 6.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
            priority = "extra-high",
            width = 110,
            height = 50,
            shift = util.by_pixel(10.5, 6),
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
    name = "small-storage-2",
    icon = "__base__/graphics/icons/iron-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."chests",
    order = "storage-2",
    place_result = "small-storage-2",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "small-storage-2",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {"iron-ingot", 4}
      },
      result = "small-storage-2",
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {"iron-plate", 6},
        {"iron-ingot", 8},
      },
      result = "small-storage-2",
	  energy_required = 1,
	  enabled = false,
    },
  },
  {
    type = "container",
    name = "small-storage-3",
    icon = "__base__/graphics/icons/steel-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "small-storage-3"},
    max_health = 350,
    corpse = "steel-chest-remnants",
    dying_explosion = "steel-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 35,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume = 0.43 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
          priority = "extra-high",
          width = 32,
          height = 40,
          shift = util.by_pixel(0, -0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-chest/hr-steel-chest.png",
            priority = "extra-high",
            width = 64,
            height = 80,
            shift = util.by_pixel(-0.25, -0.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/steel-chest/steel-chest-shadow.png",
          priority = "extra-high",
          width = 56,
          height = 22,
          shift = util.by_pixel(12, 7.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-chest/hr-steel-chest-shadow.png",
            priority = "extra-high",
            width = 110,
            height = 46,
            shift = util.by_pixel(12.25, 8),
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
    name = "small-storage-3",
    icon = "__base__/graphics/icons/steel-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."chests",
    order = "storage-3",
    place_result = "small-storage-3",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "small-storage-3",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {"steel-plate", 5}
      },
      result = "small-storage-3",
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {"steel-plate", 30}
      },
      result = "small-storage-3",
	  energy_required = 1,
	  enabled = false,
    },
  },
})