require "data/prefix"
require "data/chemistry/prefix"

function Chemistry_Compound_to_Atoms(k, v)
	if v.Type == "item" then
		data:extend(
		{	
		  {
			type = "recipe",
			name = dy.."pt-compound>atom-"..k,
			energy_required = 0.5,
			category = dy.."splicer",
			subgroup = dy.."pt-hidden",
			enabled = false,
			hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
			ingredients =
			{
			  {type = "item", name = k, amount = 1},
			},
			results = {{type = "fluid", name = dy.."atoms", amount = math.floor(v.Mass)}},
		  },
		})
		DyWorld_Add_To_Tech(dy.."chemistry-basic", dy.."pt-compound>atom-"..k)
	elseif v.Type == "fluid" then
		data:extend(
		{	
		  {
			type = "recipe",
			name = dy.."pt-compound>atom-"..k,
			energy_required = 0.5,
			category = dy.."splicer",
			subgroup = dy.."pt-hidden",
			enabled = false,
			hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
			ingredients =
			{
			  {type = "fluid", name = k, amount = 1},
			},
			results = {{type = "fluid", name = dy.."atoms", amount = math.floor(v.Mass)}},
		  },
		})
		DyWorld_Add_To_Tech(dy.."chemistry-basic", dy.."pt-compound>atom-"..k)
	end
end

for k,v in pairs(Compounds) do
	Chemistry_Compound_to_Atoms(k, v)
end