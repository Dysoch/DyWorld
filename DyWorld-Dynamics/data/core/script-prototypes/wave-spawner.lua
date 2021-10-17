



data:extend(
{
  {
    type = "simple-entity-with-force",
    name = "dy-wave-spawner",
    icon = DyDs_icon_temp,
    icon_size = 32,
    max_health = 1000000,
    corpse = "big-remnants",
    collision_box = {{-7, -7}, {7, 7}},
    selection_box = {{-7, -7}, {7, 7}},
	emissions_per_second = 0.1,
    picture =
    {
      filename = DyDs_path_entity.."spawner.png",
      priority = "extra-high",
      width = 500,
      height = 500,
      --shift = util.by_pixel(-11, 4.5)
    },
  },
})