require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."wood-creation-1",
    category = dy.."farming",
    energy_required = 90,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 10},
      {type = "item", name = dy.."wood-seed", amount = 1},
    },
    result = "raw-wood",
	result_count = 3,
  },
  {
    type = "recipe",
    name = dy.."wood-creation-2",
    category = dy.."farming",
    energy_required = 30,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."fertilized-water", amount = 10},
      {type = "item", name = dy.."wood-seed", amount = 1},
    },
    result = "raw-wood",
	result_count = 5,
  },
})