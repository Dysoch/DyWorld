require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."science-fluid-1",
    category = "centrifuging",
    energy_required = 1.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 50},
      {type = "item", name = "iron-ore", amount = 2},
      {type = "item", name = "copper-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-1", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-1",
  },
  {
    type = "recipe",
    name = dy.."science-fluid-2",
    category = "centrifuging",
    energy_required = 1.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."oxygen", amount = 50},
      {type = "fluid", name = dy.."acid", amount = 5},
      {type = "item", name = dy.."stone-transport-belt", amount = 1},
      {type = "item", name = dy.."copper-power-pole", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-2", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-2",
  },
  {
    type = "recipe",
    name = dy.."science-fluid-3",
    category = "centrifuging",
    energy_required = 1.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."sludge", amount = 250},
      {type = "fluid", name = dy.."molten-lead", amount = 5},
      {type = "item", name = "advanced-circuit", amount = 3},
      {type = "item", name = dy.."tin-storage-tank", amount = 1},
      {type = "item", name = dy.."chromium-mining-tool", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-3", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-3",
  },
  {
    type = "recipe",
    name = dy.."science-fluid-4",
    category = "centrifuging",
    energy_required = 1.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."sewage", amount = 50},
      {type = "fluid", name = dy.."acid", amount = 25},
      {type = "fluid", name = dy.."methane", amount = 25},
      {type = "item", name = dy.."lead-shotgun-ammo", amount = 1},
      {type = "item", name = dy.."copper-shotgun-laser-turret", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-4", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-4",
  },
  {
    type = "recipe",
    name = dy.."science-fluid-5",
    category = "centrifuging",
    energy_required = 1.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."hydrogen", amount = 50},
      {type = "fluid", name = dy.."clean-oil", amount = 5},
      {type = "item", name = dy.."chromium-assembling-electric", amount = 1},
      {type = "item", name = dy.."cadmium-repair-tool", amount = 1},
      {type = "item", name = dy.."steel-pump", amount = 1},
      {type = "item", name = dy.."gold-stack-inserter", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-5", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-5",
  },
  {
    type = "recipe",
    name = dy.."science-fluid-6",
    category = "centrifuging",
    energy_required = 1.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-billon", amount = 15},
      {type = "fluid", name = dy.."molten-gold", amount = 5},
      {type = "fluid", name = dy.."methane", amount = 35},
      {type = "fluid", name = dy.."water-clean", amount = 250},
      {type = "item", name = dy.."controller", amount = 1},
      {type = "item", name = "iron-gear-wheel", amount = 2},
      {type = "item", name = dy.."crystai", amount = 2},
      {type = "item", name = dy.."processing-logic", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-6", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-6",
  },
})

DyWorld_Add_To_Tech("advanced-electronics", dy.."science-fluid-3")
DyWorld_Add_To_Tech("military-2", dy.."science-fluid-4")
DyWorld_Add_To_Tech("advanced-material-processing-2", dy.."science-fluid-5")
DyWorld_Add_To_Tech("advanced-electronics-2", dy.."science-fluid-6")