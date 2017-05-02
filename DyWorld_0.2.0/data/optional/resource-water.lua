


data.raw.resource["iron-ore"].minable.fluid_amount = 10
data.raw.resource["iron-ore"].minable.required_fluid = "water"
data.raw.resource["copper-ore"].minable.fluid_amount = 10
data.raw.resource["copper-ore"].minable.required_fluid = "water"

data:extend(
{
  {
    type = "recipe",
    name = "dyworld-stone-to-iron",
    category = "crafting-with-fluid",
    ingredients = {{"stone", 3}},
    result = "iron-plate",
    result_count = 1
  },
  {
    type = "recipe",
    name = "dyworld-stone-to-copper",
    category = "crafting-with-fluid",
    ingredients = {{"stone", 2}},
    result = "copper-plate",
    result_count = 1
  },
})