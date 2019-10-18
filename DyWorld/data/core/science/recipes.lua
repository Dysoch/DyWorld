require "data/core/functions/prefix"

data:extend(
{
  {
    type = "recipe",
    name = "science-basic",
	icons = data.raw.fluid["science-basic"].icons,
    category = "centrifuging",
    energy_required = 5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "oxygen", amount = 10},
      {type = "fluid", name = "hydrogen", amount = 10},
      {type = "item", name = "wood", amount = 3},
    },
    results=
    {
      {type = "fluid", name = "science-basic", amount = 100},
    },
    subgroup = dy.."science-fluids",
    order = "science-0-1",
  },
  {
    type = "recipe",
    name = "science-advanced",
	icons = data.raw.fluid["science-advanced"].icons,
    category = "centrifuging",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "nitrogen", amount = 50},
      {type = "fluid", name = "carbon-dioxide", amount = 10},
      {type = "item", name = "sulfur", amount = 3},
    },
    results=
    {
      {type = "fluid", name = "science-advanced", amount = 100},
    },
    subgroup = dy.."science-fluids",
    order = "science-0-2",
  },
  {
    type = "recipe",
    name = "science-extreme",
	icons = data.raw.fluid["science-extreme"].icons,
    category = "centrifuging",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "methane", amount = 100},
      {type = "fluid", name = "carbon-monoxide", amount = 10},
      {type = "item", name = "rubber", amount = 3},
    },
    results=
    {
      {type = "fluid", name = "science-extreme", amount = 100},
    },
    subgroup = dy.."science-fluids",
    order = "science-0-3",
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
      {type = "fluid", name = "science-basic", amount = 10},
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
      {type = "fluid", name = "science-basic", amount = 10},
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
      {type = "fluid", name = "science-advanced", amount = 10},
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
      {type = "fluid", name = "science-advanced", amount = 10},
      {type = "item", name = "chitin", amount = 5},
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
      {type = "fluid", name = "science-extreme", amount = 10},
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
      {type = "fluid", name = "science-extreme", amount = 10},
    },
    results=
    {
      {type = "fluid", name = "science-6", amount = 10},
    },
    subgroup = dy.."science-fluids",
    order = "science-6",
  },
  {
    type = "recipe",
    name = "science-7",
	icons = data.raw.fluid["science-7"].icons,
    category = "centrifuging",
    energy_required = 60,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = "science-extreme", amount = 50},
      {type = "item", name = "space-artifact", amount = 10},
    },
    results=
    {
      {type = "fluid", name = "science-7", amount = 10},
    },
    subgroup = dy.."science-fluids",
    order = "science-7",
  },
  {
    type = "recipe",
    name = "space-science-pack",
    category = "crafting-with-fluid",
    energy_required = 5,
	enabled = false,
    ingredients = 
	{
      {type = "fluid", name = "science-7", amount = 5},
	  {type = "item", name = "neutronium-plate", amount = 2}
	},
    results=
    {
      {type = "item", name = "space-science-pack", amount = 1},
    },
    subgroup = dy.."science-fluids",
    order = "science-7",
  },
})

DyWorld_Add_To_Recipe("science-3", "hydrogen", 150, true)	

if settings.startup["DyWorld_Extraction"].value then
	DyWorld_Add_To_Recipe("science-5", "cobalt-electric-mining-drill", 1)
	DyWorld_Add_To_Recipe("science-7", "tungstvar-electric-mining-drill", 1)	
else
	DyWorld_Add_To_Recipe("science-5", "electric-mining-drill", 1)	
	DyWorld_Add_To_Recipe("science-7", "electric-mining-drill", 10)	
end

if settings.startup["DyWorld_Logistics"].value then
	DyWorld_Add_To_Recipe("science-1", "stone-transport-belt", 1)
	DyWorld_Add_To_Recipe("science-2", "iron-loader", 1)
	DyWorld_Add_To_Recipe("science-2", "fast-inserter", 1)
	DyWorld_Add_To_Recipe("science-2", "stone-pump", 1)
	DyWorld_Add_To_Recipe("science-3", "bronze-splitter", 1)
	DyWorld_Add_To_Recipe("science-7", "tungstvar-transport-belt", 1)
else	
	DyWorld_Add_To_Recipe("science-1", "transport-belt", 1)
	DyWorld_Add_To_Recipe("science-2", "transport-belt", 3)
	DyWorld_Add_To_Recipe("science-2", "pipe-to-ground", 2)
	DyWorld_Add_To_Recipe("science-3", "fast-splitter", 1)
	DyWorld_Add_To_Recipe("science-7", "express-transport-belt", 25)
end

if settings.startup["DyWorld_Power"].value then
	DyWorld_Add_To_Recipe("science-3", "gold-solar-panel", 1)	
	DyWorld_Add_To_Recipe("science-6", "electranium-solar-panel", 1)
	DyWorld_Add_To_Recipe("science-7", "tungstvar-solar-panel", 1)	
	DyWorld_Add_To_Recipe("science-7", "tungstvar-accumulator", 1)	
else	
	DyWorld_Add_To_Recipe("science-3", "solar-panel", 1)
	DyWorld_Add_To_Recipe("science-6", "solar-panel", 5)
	DyWorld_Add_To_Recipe("science-7", "solar-panel", 25)
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
	DyWorld_Add_To_Recipe("science-4", "iron-gun-turret", 1)	--TEMP
	DyWorld_Add_To_Recipe("science-4", "stone-wall", 3)	
	DyWorld_Add_To_Recipe("science-7", "arditium-tungstenate-radar", 1)	
else
	DyWorld_Add_To_Recipe("science-4", "gun-turret", 1)	
	DyWorld_Add_To_Recipe("science-4", "stone-wall", 1)	
	DyWorld_Add_To_Recipe("science-7", "radar", 15)	
end