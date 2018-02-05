require "data/prefix"
require "data/chemistry/prefix"

function Chemistry_Compound_to_Atoms(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."pt-compound>atom-"..v.Name,
    energy_required = 0.5,
	category = dy.."splicer",
	subgroup = dy.."pt-hidden",
    enabled = true,
	hidden = true,
    ingredients =
    {
      {type = "item", name = v.Name, amount = 1},
    },
    results = {{type = "fluid", name = dy.."atoms", amount = math.floor(v.Mass)}},
  },
})
end

for k,v in pairs(Compounds) do
	Chemistry_Compound_to_Atoms(v)
end