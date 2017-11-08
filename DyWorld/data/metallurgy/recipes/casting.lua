require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."iron-plate",
    category = dy.."blast-furnace",
    energy_required = 7.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-iron", amount = 100},
    },
    results=
    {
      {type = "item", name = "iron-plate", amount = 10},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."iron-plate",
  },
  {
    type = "recipe",
    name = dy.."copper-plate",
    category = dy.."blast-furnace",
    energy_required = 7.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-copper", amount = 100},
    },
    results=
    {
      {type = "item", name = "copper-plate", amount = 10},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."copper-plate",
  },
  {
    type = "recipe",
    name = dy.."steel-plate",
    category = dy.."blast-furnace",
    energy_required = 7.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-steel-normal", amount = 100},
    },
    results=
    {
      {type = "item", name = "steel-plate", amount = 10},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."steel-plate",
  },
  {
    type = "recipe",
    name = dy.."tin-plate",
    category = dy.."blast-furnace",
    energy_required = 7.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-tin", amount = 100},
    },
    results=
    {
      {type = "item", name = "tin-plate", amount = 10},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."tin-plate",
  },
  {
    type = "recipe",
    name = dy.."silver-plate",
    category = dy.."blast-furnace",
    energy_required = 7.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-silver", amount = 100},
    },
    results=
    {
      {type = "item", name = "silver-plate", amount = 10},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."silver-plate",
  },
  {
    type = "recipe",
    name = dy.."gold-plate",
    category = dy.."blast-furnace",
    energy_required = 7.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-gold", amount = 100},
    },
    results=
    {
      {type = "item", name = "gold-plate", amount = 10},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."gold-plate",
  },
  {
    type = "recipe",
    name = dy.."lead-plate",
    category = dy.."blast-furnace",
    energy_required = 7.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-lead", amount = 100},
    },
    results=
    {
      {type = "item", name = "lead-plate", amount = 10},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."lead-plate",
  },
  {
    type = "recipe",
    name = dy.."chromium-plate",
    category = dy.."blast-furnace",
    energy_required = 7.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-chromium", amount = 100},
    },
    results=
    {
      {type = "item", name = "chromium-plate", amount = 10},
    },
    subgroup = dy.."casting-recipes",
    order = dy.."chromium-plate",
  },
})

DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."iron-plate")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."copper-plate")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."steel-plate")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."silver-plate")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."tin-plate")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."gold-plate")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."lead-plate")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."chromium-plate")