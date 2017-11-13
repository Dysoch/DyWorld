require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."molten-rock",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-rock"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
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
    subgroup = dy.."sub-recipes",
    order = dy.."molten-rock",
  },
  {
    type = "recipe",
    name = dy.."molten-iron",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-iron"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
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
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-copper"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
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
    name = dy.."molten-steel",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-steel"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
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
      {type = "fluid", name = dy.."molten-steel", amount = 60},
    },
    subgroup = dy.."melting-recipes",
    order = dy.."molten-steel",
  },
  --[[{
    type = "recipe",
    name = dy.."molten-steel-stainless",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-stainless-steel"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
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
  },]]--
  {
    type = "recipe",
    name = dy.."molten-tin",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-tin"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
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
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-lead"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
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
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-gold"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
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
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-silver"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
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
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-chromium"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
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
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-steel")
--DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-steel-stainless")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-tin")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-gold")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-lead")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-silver")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-chromium")