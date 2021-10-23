

data:extend(
{
  {
    type = "fish",
    name = "fish",
    icon = "__base__/graphics/icons/fish.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    minable = {
	  mining_time = 0.4, 
	  results = {
	    {type = "item", name = "raw-fish-pike", amount_min = 1, amount_max = 5, probability = 0.95},
	    {type = "item", name = "raw-fish-salmon", amount_min = 1, amount_max = 3, probability = 0.5},
	  },
	},
    max_health = 20,
    subgroup = "creatures",
    order = "b-a",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-0.5, -0.3}, {0.5, 0.3}},
    pictures =
    {
      {
        filename = "__base__/graphics/entity/fish/fish-1.png",
        priority = "extra-high",
        width = 22,
        height = 36
      },
      {
        filename = "__base__/graphics/entity/fish/fish-2.png",
        priority = "extra-high",
        width = 32,
        height = 32
      }
    },
    autoplace = { influence = 0.035 }
  },
})