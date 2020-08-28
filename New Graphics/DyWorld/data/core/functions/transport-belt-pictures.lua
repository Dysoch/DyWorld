function DyWorld_express_belt_animation_set(TINT)
set = {
  animation_set =
  {
    filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    frame_count = 32,
    direction_count = 20,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/express-transport-belt/hr-express-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      frame_count = 32,
	  tint = TINT,
      direction_count = 20
    }
  }
}
return set
end
