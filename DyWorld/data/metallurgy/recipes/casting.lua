require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."iron-plate",
    category = dy.."blast-furnace",
    energy_required = 2,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-iron", amount = 50},
    },
    results=
    {
      {type = "item", name = "iron-plate", amount = 5},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."iron-plate",
  },
  {
    type = "recipe",
    name = dy.."copper-plate",
    category = dy.."blast-furnace",
    energy_required = 2,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-copper", amount = 50},
    },
    results=
    {
      {type = "item", name = "copper-plate", amount = 5},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."copper-plate",
  },
  {
    type = "recipe",
    name = dy.."steel-plate",
    category = dy.."blast-furnace",
    energy_required = 2,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-steel-normal", amount = 50},
    },
    results=
    {
      {type = "item", name = "steel-plate", amount = 5},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."steel-plate",
  },
})

DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."iron-plate")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."copper-plate")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."steel-plate")