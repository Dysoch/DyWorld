


data.raw.resource["iron-ore"].minable.fluid_amount = 75
data.raw.resource["iron-ore"].minable.required_fluid = "water"
data.raw.resource["copper-ore"].minable.fluid_amount = 50
data.raw.resource["copper-ore"].minable.required_fluid = "water"

data:extend(
{
  {
    type = "recipe",
    name = "dyworld-stone-to-iron",
    category = "primitive-crafting",
    ingredients = {{"stone", 3}},
    result = "iron-ore",
    result_count = 1
  },
  {
    type = "recipe",
    name = "dyworld-stone-to-copper",
    category = "primitive-crafting",
    ingredients = {{"stone", 2}},
    result = "copper-ore",
    result_count = 1
  },
})

data.raw.recipe["burner-inserter"].ingredients = {{"stone", 1},{"iron-plate", 2}}