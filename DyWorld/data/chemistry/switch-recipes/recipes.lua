require "data/prefix"

Solids = {"sulfur"}
Liquids = {dy.."hydrogen", dy.."oxygen", dy.."methane"}

function Chemistry_Liquids_to_Atoms(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."pt-liquid>atom-"..v,
    energy_required = 2.5,
	category = dy.."splitter",
	subgroup = dy.."pt-hidden",
    enabled = true,
	hidden = true,
    ingredients =
    {
      {type = "fluid", name = v, amount = 50},
    },
    results = {{type = "fluid", name = dy.."atoms", amount = 50}},
  },
})
end

function Chemistry_Solids_to_Atoms(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."pt-solid>atom-"..v,
    energy_required = 2.5,
	category = dy.."splitter",
	subgroup = dy.."pt-hidden",
    enabled = true,
	hidden = true,
    ingredients =
    {
      {type = "item", name = v, amount = 1},
    },
    results = {{type = "fluid", name = dy.."atoms", amount = 1}},
  },
})
end

function Chemistry_Atoms_to_Liquids(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."pt-atom>liquid-"..v,
    energy_required = 10,
	category = dy.."recombiner",
	subgroup = dy.."atoms>liquids",
    enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."atoms", amount = 50},
    },
    results = {{type = "fluid", name = v, amount = 25}},
  },
})
end

function Chemistry_Atoms_to_Solids(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."pt-atom>solid-"..v,
    energy_required = 10,
	category = dy.."recombiner",
	subgroup = dy.."atoms>solids",
    enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."atoms", amount = 2},
    },
    results = {{type = "item", name = v, amount = 1}},
  },
})
end

for k,v in pairs(Liquids) do
	Chemistry_Liquids_to_Atoms(v)
	Chemistry_Atoms_to_Liquids(v)
end

for k,v in pairs(Solids) do
	Chemistry_Solids_to_Atoms(v)
	Chemistry_Atoms_to_Solids(v)
end