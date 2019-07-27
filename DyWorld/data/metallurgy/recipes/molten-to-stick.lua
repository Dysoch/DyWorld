require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"
-- No balancing here, check "data/core/functions/metal-info.lua"
-- check also "data/core/functions/amounts.lua"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Molten and v.DyWorld.Intermediates and v.DyWorld.Intermediates.Stick and data.raw.fluid["molten-"..v.DyWorld.Name] then	
data:extend(
{
  {
    type = "recipe",
    name = "metallurgy-"..v.DyWorld.Name.."-stick",
    energy_required = 0.5 * v.DyWorld.Tier,
    enabled = true,
	category = dy.."forging-stick",
	hidden = true,
    ingredients = 
	{ 
	  {type = "fluid", name = "molten-"..v.DyWorld.Name, amount = 10},
	},
    results = 
	{ 
	  {type = "item", name = v.DyWorld.Name.."-stick", amount = 3},
	},
  },
})
	end
end	