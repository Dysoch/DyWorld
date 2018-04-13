require "data/prefix"
require "data/chemistry/prefix"

function Chemistry_Atoms_to_Compounds(k, v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."pt-atom>compound-"..k,
    energy_required = 2.5,
	category = dy.."recombiner",
	subgroup = dy.."atoms>compounds",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."atoms", amount = Round(v.Mass, 0)},
    },
    results = {{type = v.Type, name = k, amount = 1}},
  },
})
DyWorld_Add_To_Tech(dy.."chemistry-"..v.Atom_To_Compound_Tech, dy.."pt-atom>compound-"..k)
end

for k,v in pairs(Compounds) do
	Mass_Calc(k)
end

for k,v in pairs(Compounds) do
	if v.Atom_To_Compound then
		Chemistry_Atoms_to_Compounds(k, v)
	end 
end