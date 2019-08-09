require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"
-- No balancing here, check "data/core/functions/metal-info.lua"
-- check also "data/core/functions/amounts.lua"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Slag_Output and data.raw.fluid["molten-"..v.DyWorld.Name] then	
data:extend(
{
  {
    type = "recipe",
    name = "molten-"..v.DyWorld.Name.."-slag",
	localised_name = {"looped-name.molten-slag", {"looped-name."..v.DyWorld.Name}},
	icons = 
	{
	  {
		icon = dyworld_path_fluid.."base.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	  {
		icon = dyworld_path_icon.."base-slag.png",
		tint = Material_Colors[v.DyWorld.Name],
		scale = 0.7,
	  },
	},
    energy_required = 30 * v.DyWorld.Tier,
    enabled = false,
	category = dy.."melting",
    order = "molten-"..v.DyWorld.Name.."-x",
    subgroup = dy.."fluids-"..(v.DyWorld.Tier-1),
    normal = { 
	  energy_required = 10 * v.DyWorld.Tier,
	  enabled = false,
	  ingredients = {{type = "item", name = v.DyWorld.Name.."-slag", amount = 100}},
	  results = { 
	    {type = "fluid", name = "molten-"..v.DyWorld.Name, amount = 25, probability = 0.8},
	  },
	},
    expensive = { 
	  energy_required = 30 * v.DyWorld.Tier,
	  enabled = false,
	  ingredients = {{type = "item", name = v.DyWorld.Name.."-slag", amount = 100}},
	  results = { 
	    {type = "fluid", name = "molten-"..v.DyWorld.Name, amount = 25, probability = 0.8},
	  },
	},
  },
})
	DyWorld_Add_To_Tech("metallurgy-"..v.DyWorld.Tier, "molten-"..v.DyWorld.Name.."-slag")
	if v.DyWorld.Metallurgy.Slag_Output then
		for NAME,AMOUNT in pairs(v.DyWorld.Metallurgy.Slag_Output) do
			local insert = {type = "fluid", name = "molten-"..NAME, amount = AMOUNT, probability = 0.8}
			table.insert(data.raw.recipe["molten-"..v.DyWorld.Name.."-slag"].normal.results, insert)
			table.insert(data.raw.recipe["molten-"..v.DyWorld.Name.."-slag"].expensive.results, insert)
		end
	end
	end
end	