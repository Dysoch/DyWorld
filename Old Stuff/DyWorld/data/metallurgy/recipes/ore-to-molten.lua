require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"
-- No balancing here, check "data/core/functions/metal-info.lua"
-- check also "data/core/functions/amounts.lua"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Ore and data.raw.fluid["molten-"..v.DyWorld.Name] then	
data:extend(
{
  {
    type = "recipe",
    name = "molten-"..v.DyWorld.Name,
    energy_required = 5 * v.DyWorld.Tier,
    enabled = false,
	category = dy.."melting",
    normal = { 
	  energy_required = 5 * v.DyWorld.Tier,
	  enabled = false,
	  ingredients = {{type = "item", name = v.DyWorld.Name.."-ore", amount = Ore_To_Molten_Ore_Amount}},
	  results = { 
	    {type = "fluid", name = "molten-"..v.DyWorld.Name, amount = math.floor(Ore_To_Molten_Ore_Amount * Ore_To_Molten_Ratio)},
	  },
	},
    expensive = { 
	  energy_required = 15 * v.DyWorld.Tier,
	  enabled = false,
	  ingredients = {{type = "item", name = v.DyWorld.Name.."-ore", amount = Expensive_Check(Ore_To_Molten_Ore_Amount)}},
	  results = { 
	    {type = "fluid", name = "molten-"..v.DyWorld.Name, amount = math.floor(Ore_To_Molten_Ore_Amount * Ore_To_Molten_Ratio)},
	  },
	},
  },
})
	if v.DyWorld.Tier >= 9 then
		data.raw.recipe["molten-"..v.DyWorld.Name].category = dy.."melting-5"
	elseif v.DyWorld.Tier >= 7 then
		data.raw.recipe["molten-"..v.DyWorld.Name].category = dy.."melting-4"
	elseif v.DyWorld.Tier >= 5 then
		data.raw.recipe["molten-"..v.DyWorld.Name].category = dy.."melting-3"
	elseif v.DyWorld.Tier >= 3 then
		data.raw.recipe["molten-"..v.DyWorld.Name].category = dy.."melting-2"
	elseif v.DyWorld.Tier >= 1 then
		data.raw.recipe["molten-"..v.DyWorld.Name].category = dy.."melting"
	end
	DyWorld_Add_To_Tech("metallurgy-"..v.DyWorld.Tier, "molten-"..v.DyWorld.Name)
	end
end	