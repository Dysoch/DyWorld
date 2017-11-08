require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."molten-rock",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "item", name = "stone", amount = 10},
      {type = "item", name = "coal", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-rock", amount = 125},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-rock",
  },
  {
    type = "recipe",
    name = dy.."molten-iron",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-rock", amount = 10, minimum_temperature = Materials.Iron.Melting_Point},
      {type = "item", name = "iron-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-iron", amount = 14},
      {type = "fluid", name = dy.."sludge", amount = 10},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-iron",
  },
  {
    type = "recipe",
    name = dy.."molten-copper",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-rock", amount = 10, minimum_temperature = Materials.Copper.Melting_Point},
      {type = "item", name = "copper-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-copper", amount = 14},
      {type = "fluid", name = dy.."sludge", amount = 10},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-copper",
  },
  {
    type = "recipe",
    name = dy.."molten-steel-normal",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-iron", amount = 45, minimum_temperature = Materials.Steel.Melting_Point},
      {type = "item", name = "coal", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-steel-normal", amount = 60},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-steel-normal",
  },
  {
    type = "recipe",
    name = dy.."molten-steel-stainless",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-iron", amount = 45, minimum_temperature = Materials.Stainless_Steel.Melting_Point},
      {type = "item", name = "chromium-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-steel-stainless", amount = 60},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-steel-stainless",
  },
  {
    type = "recipe",
    name = dy.."molten-tin",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-rock", amount = 10, minimum_temperature = Materials.Tin.Melting_Point},
      {type = "item", name = "tin-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-tin", amount = 14},
      {type = "fluid", name = dy.."sludge", amount = 10},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-tin",
  },
  {
    type = "recipe",
    name = dy.."molten-lead",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-rock", amount = 10, minimum_temperature = Materials.Lead.Melting_Point},
      {type = "item", name = "lead-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-lead", amount = 14},
      {type = "fluid", name = dy.."sludge", amount = 10},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-lead",
  },
  {
    type = "recipe",
    name = dy.."molten-gold",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-rock", amount = 10, minimum_temperature = Materials.Gold.Melting_Point},
      {type = "item", name = "gold-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-gold", amount = 14},
      {type = "fluid", name = dy.."sludge", amount = 10},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-gold",
  },
  {
    type = "recipe",
    name = dy.."molten-silver",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-rock", amount = 10, minimum_temperature = Materials.Silver.Melting_Point},
      {type = "item", name = "silver-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-silver", amount = 14},
      {type = "fluid", name = dy.."sludge", amount = 10},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-silver",
  },
  {
    type = "recipe",
    name = dy.."molten-chromium",
	icon = dyworld_path_icon_temp,
    category = dy.."blast-furnace",
    energy_required = 0.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."molten-rock", amount = 10, minimum_temperature = Materials.Chromium.Melting_Point},
      {type = "item", name = "chromium-ore", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-chromium", amount = 14},
      {type = "fluid", name = dy.."sludge", amount = 10},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-chromium",
  },
})

DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-rock")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-iron")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-copper")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-steel-normal")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-steel-stainless")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-tin")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-gold")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-lead")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-silver")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-chromium")