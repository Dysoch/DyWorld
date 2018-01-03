require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."minigun",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"advanced-circuit", 5},
      {"steel-plate", 5},
      {"submachine-gun", 2}
    },
    result = dy.."minigun",
  },
})

DyWorld_Add_To_Tech("military-3", dy.."minigun")