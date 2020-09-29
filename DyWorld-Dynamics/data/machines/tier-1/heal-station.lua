data:extend({
  {
    type = "player-port",
    name = "heal-station",
    icon = "__base__/graphics/icons/player-port.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    subgroup = "other",
    minable = {mining_time = 0.5, result = "heal-station"},
    max_health = 50,
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    animation =
    {
      filename = "__base__/graphics/entity/player-port/player-port-animation.png",
      width = 64,
      height = 64,
      frame_count = 2
    }
  },
  {
    type = "item",
    name = "heal-station",
    icon = "__base__/graphics/icons/player-port.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."chests",
    order = "storage-1",
    place_result = "heal-station",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "heal-station",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {"wood", 3}
      },
      result = "heal-station",
	  energy_required = 15,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {"wood", 10}
      },
      result = "heal-station",
	  energy_required = 75,
	  enabled = false,
    },
  },
})