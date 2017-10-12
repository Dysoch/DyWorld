require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."wheat-farming-2",
    category = dy.."farming",
    energy_required = 30,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."fertilized-water", amount = 10},
      {type = "fluid", name = dy.."wheat-seed", amount = 1},
    },
    result = dy.."wheat",
	result_count = 5,
  },
  {
    type = "recipe",
    name = dy.."carrot-farming-2",
    category = dy.."farming",
    energy_required = 30,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."fertilized-water", amount = 10},
      {type = "fluid", name = dy.."carrot", amount = 1},
    },
    result = dy.."carrot",
	result_count = 4,
  },
})