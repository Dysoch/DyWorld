require "data/prefix"
require "data/chemistry/prefix"

function Chemistry_Liquids_to_Atoms(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."pt-liquid>atom-"..v.Name,
    energy_required = 0.5,
	category = dy.."splicer",
	subgroup = dy.."pt-hidden",
    enabled = false,
	hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
    ingredients =
    {
      {type = "fluid", name = v.Name, amount = 1},
    },
    results = {{type = "fluid", name = dy.."atoms", amount = math.floor(v.Mass)}},
  },
})
DyWorld_Add_To_Tech(dy.."chemistry-basic", dy.."pt-liquid>atom-"..v.Name)
end

function Chemistry_Solids_to_Atoms(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."pt-solid>atom-"..v.Name,
    energy_required = 0.5,
	category = dy.."splicer",
	subgroup = dy.."pt-hidden",
    enabled = false,
	hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
    ingredients =
    {
      {type = "item", name = v.Name, amount = 1},
    },
    results = {{type = "fluid", name = dy.."atoms", amount = math.floor(v.Mass)}},
  },
})
DyWorld_Add_To_Tech(dy.."chemistry-basic", dy.."pt-solid>atom-"..v.Name)
end

function Chemistry_Atoms_to_Liquids(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."pt-atom>liquid-"..v.Name,
    energy_required = 1,
	category = dy.."recombiner",
	subgroup = dy.."atoms>liquids",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."atoms", amount = math.floor(v.Mass)},
    },
    results = {{type = "fluid", name = v.Name, amount = 1}},
  },
})
DyWorld_Add_To_Tech(dy.."chemistry-basic", dy.."pt-atom>liquid-"..v.Name)
end

function Chemistry_Atoms_to_Solids(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."pt-atom>solid-"..v.Name,
    energy_required = 1,
	category = dy.."recombiner",
	subgroup = dy.."atoms>solids",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."atoms", amount = math.floor(v.Mass)},
    },
    results = {{type = "item", name = v.Name, amount = 1}},
  },
})
DyWorld_Add_To_Tech(dy.."chemistry-basic", dy.."pt-atom>solid-"..v.Name)
end

for k,v in pairs(Liquids) do
	Chemistry_Liquids_to_Atoms(v)
	Chemistry_Atoms_to_Liquids(v)
end

for k,v in pairs(Solids) do
	Chemistry_Solids_to_Atoms(v)
	Chemistry_Atoms_to_Solids(v)
end