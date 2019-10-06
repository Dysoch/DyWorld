require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend(
{
  {
    type = "projectile",
    name = "landmine-wave",
    flags = {"not-on-map"},
    acceleration = 0,
    action =
    {
      {
        type = "area",
        radius = 1,
        action_delivery =
        {
          type = "instant",
          target_effects =
		  {
			{
		      type = "damage",
			  damage = {amount = 5, type = "explosion"}
			},
			{
		      type = "damage",
			  damage = {amount = 1, type = "impact"}
			},
            {
              type = "create-explosion",
              entity_name = dy.."explosion-small"
            },
		  }
        }
      }
    },
    animation =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    },
    shadow =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }
  },
})