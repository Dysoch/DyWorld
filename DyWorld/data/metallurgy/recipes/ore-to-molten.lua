require "data/core/functions/prefix"
require "data/core/functions/colors"
-- No balancing here, check "data/core/functions/metal-info.lua"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Ore and data.raw.fluid["molten-"..v.DyWorld.Name] then	
data:extend(
{
  {
    type = "recipe",
    name = "molten-"..v.DyWorld.Name,
    energy_required = 5 * v.DyWorld.Tier,
    enabled = true,
	category = dy.."melting",
    ingredients = 
	{ 
	  {type = "item", name = v.DyWorld.Metallurgy.Ore, amount = 10},
	},
    results = 
	{ 
	  {type = "fluid", name = "molten-"..v.DyWorld.Name, amount = 100},
	},
  },
})
	end
end	