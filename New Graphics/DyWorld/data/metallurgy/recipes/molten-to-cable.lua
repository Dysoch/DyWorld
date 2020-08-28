require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"
-- No balancing here, check "data/core/functions/metal-info.lua"
-- check also "data/core/functions/amounts.lua"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Molten and v.DyWorld.Metallurgy.Cable and data.raw.fluid["molten-"..v.DyWorld.Name] then	
data:extend(
{
  {
    type = "recipe",
    name = "metallurgy-"..v.DyWorld.Name.."-cable",
    enabled = true,
	category = dy.."forging-cable",
	allow_decomposition = false,
	hidden = true,
    normal = { 
	  energy_required = 0.5 * v.DyWorld.Tier,
	  hidden = true,
	  ingredients = {{type = "fluid", name = "molten-"..v.DyWorld.Name, amount = 10}},
	  results = { 
	    {type = "item", name = v.DyWorld.Name.."-cable", amount = 5},
	  },
	},
    expensive = { 
	  energy_required = 2.5 * v.DyWorld.Tier,
	  hidden = true,
	  ingredients = {{type = "fluid", name = "molten-"..v.DyWorld.Name, amount = Expensive_Check(10)}},
	  results = { 
	    {type = "item", name = v.DyWorld.Name.."-cable", amount = 5},
	  },
	},
  },
})
	end
end	