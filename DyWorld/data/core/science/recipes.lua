require "data/core/functions/prefix"

data:extend(
{
  {
    type = "recipe",
    name = "science-base",
	icons = data.raw.fluid["science-base"].icons,
    category = "centrifuging",
    energy_required = 5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 100},
      {type = "fluid", name = "carbon-dioxide", amount = 10},
      {type = "item", name = "wood", amount = 3},
    },
    results=
    {
      {type = "fluid", name = "science-base", amount = 100},
    },
    subgroup = dy.."science-fluids",
    order = "science-0",
  },
  {
    type = "recipe",
    name = "science-1",
	icons = data.raw.fluid["science-1"].icons,
    category = "centrifuging",
    energy_required = 10,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "science-base", amount = 10},
    },
    results=
    {
      {type = "fluid", name = "science-1", amount = 10},
    },
    subgroup = dy.."science-fluids",
    order = "science-1",
  },
  {
    type = "recipe",
    name = "science-2",
	icons = data.raw.fluid["science-2"].icons,
    category = "centrifuging",
    energy_required = 15,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "science-base", amount = 10},
    },
    results=
    {
      {type = "fluid", name = "science-2", amount = 10},
    },
    subgroup = dy.."science-fluids",
    order = "science-2",
  },
  {
    type = "recipe",
    name = "science-3",
	icons = data.raw.fluid["science-3"].icons,
    category = "centrifuging",
    energy_required = 20,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "science-base", amount = 10},
    },
    results=
    {
      {type = "fluid", name = "science-3", amount = 10},
    },
    subgroup = dy.."science-fluids",
    order = "science-4",
  },
  {
    type = "recipe",
    name = "science-4",
	icons = data.raw.fluid["science-4"].icons,
    category = "centrifuging",
    energy_required = 20,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "science-base", amount = 10},
    },
    results=
    {
      {type = "fluid", name = "science-4", amount = 10},
    },
    subgroup = dy.."science-fluids",
    order = "science-3",
  },
  {
    type = "recipe",
    name = "science-5",
	icons = data.raw.fluid["science-5"].icons,
    category = "centrifuging",
    energy_required = 30,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "science-base", amount = 10},
    },
    results=
    {
      {type = "fluid", name = "science-5", amount = 10},
    },
    subgroup = dy.."science-fluids",
    order = "science-5",
  },
  {
    type = "recipe",
    name = "science-6",
	icons = data.raw.fluid["science-6"].icons,
    category = "centrifuging",
    energy_required = 40,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "science-base", amount = 10},
    },
    results=
    {
      {type = "fluid", name = "science-6", amount = 20},
    },
    subgroup = dy.."science-fluids",
    order = "science-6",
  },
})


DyWorld_Add_To_Recipe("science-3", "methane", 5, true)	
DyWorld_Add_To_Recipe("science-3", "hydrogen", 150, true)	

if settings.startup["DyWorld_Extraction"].value then
	DyWorld_Add_To_Recipe("science-5", "cobalt-electric-mining-drill", 1)	
else
	DyWorld_Add_To_Recipe("science-5", "electric-mining-drill", 1)	
end

if settings.startup["DyWorld_Logistics"].value then
	DyWorld_Add_To_Recipe("science-1", "stone-transport-belt", 1)
	DyWorld_Add_To_Recipe("science-2", "iron-loader", 1)
	DyWorld_Add_To_Recipe("science-2", "fast-inserter", 1)
	DyWorld_Add_To_Recipe("science-2", "stone-pump", 1)
	DyWorld_Add_To_Recipe("science-3", "bronze-splitter", 1)
else	
	DyWorld_Add_To_Recipe("science-1", "transport-belt", 1)
	DyWorld_Add_To_Recipe("science-2", "transport-belt", 3)
	DyWorld_Add_To_Recipe("science-2", "pipe-to-ground", 2)
	DyWorld_Add_To_Recipe("science-3", "fast-splitter", 1)
end

if settings.startup["DyWorld_Power"].value then
	DyWorld_Add_To_Recipe("science-3", "gold-solar-panel", 1)	
	DyWorld_Add_To_Recipe("science-6", "electranium-solar-panel", 1)	
else	
	DyWorld_Add_To_Recipe("science-3", "solar-panel", 1)
	DyWorld_Add_To_Recipe("science-6", "solar-panel", 5)
end

if settings.startup["DyWorld_Processing"].value then
	DyWorld_Add_To_Recipe("science-1", "stone-assembling-machine", 1)
	DyWorld_Add_To_Recipe("science-5", "copper-centrifuge", 1)	
	DyWorld_Add_To_Recipe("science-5", "invar-assembling-machine", 1)	
	DyWorld_Add_To_Recipe("science-6", "electranium-assembling-machine", 1)	
else	
	DyWorld_Add_To_Recipe("science-1", "iron-chest", 1)
	DyWorld_Add_To_Recipe("science-5", "centrifuge", 1)	
	DyWorld_Add_To_Recipe("science-5", "assembling-machine-3", 1)	
	DyWorld_Add_To_Recipe("science-6", "assembling-machine-3", 3)	
end

if settings.startup["DyWorld_Warfare"].value then
	DyWorld_Add_To_Recipe("science-4", "gun-turret", 1)	--TEMP
	DyWorld_Add_To_Recipe("science-4", "stone-wall", 3)	
else
	DyWorld_Add_To_Recipe("science-4", "gun-turret", 1)	
	DyWorld_Add_To_Recipe("science-4", "stone-wall", 1)	
end