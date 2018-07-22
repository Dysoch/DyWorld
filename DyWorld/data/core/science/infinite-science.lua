require "data/prefix"

data:extend(
{
  {
    type = "tool",
    name = dy.."extra-solar-science-pack",
    icon = "__base__/graphics/icons/space-science-pack.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = dy.."science-tool",
    order = "07",
    stack_size = 2000,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "item",
    name = dy.."extra-solar-artifact",
    icon = "__base__/graphics/icons/alien-artifact-goo.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = dy.."science-artifact",
    order = "extra-solar-artifact",
    stack_size = 2000
  },
  {
    type = "recipe",
    name = dy.."extra-solar-science-pack",
    icon = "__base__/graphics/icons/space-science-pack.png",
    category = "centrifuging",
    energy_required = 600,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 150000},
      {type = "fluid", name = "hydrogen", amount = 75000},
      {type = "fluid", name = "oxygen", amount = 45000},
      {type = "fluid", name = dy.."methane", amount = 50000},
      {type = "item", name = dy.."extra-solar-artifact", amount = 100},
      {type = "item", name = dy.."filter-coal", amount = 150},
      {type = "item", name = dy.."filter-stone", amount = 100},
      {type = "item", name = dy.."diamond", amount = 50},
      {type = "item", name = dy.."glass", amount = 50},
    },
    results=
    {
      {type = "item", name = dy.."extra-solar-science-pack", amount = 100},
    },
    subgroup = dy.."science-recipe-infinite",
    order = "extra-solar-science-pack",
  },
})

data.raw.item.satellite.rocket_launch_product = {dy.."extra-solar-artifact", 250}
DyWorld_Add_To_Tech("rocket-silo", dy.."extra-solar-science-pack")