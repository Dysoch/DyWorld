require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"
-- No balancing here, check "data/core/functions/metal-info.lua"
-- check also "data/core/functions/amounts.lua"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Mixed and data.raw.fluid["molten-"..v.DyWorld.Name] then	
data:extend(
{
  {
    type = "recipe",
    name = "molten-"..v.DyWorld.Name,
    energy_required = 10 * v.DyWorld.Tier,
    enabled = false,
	category = dy.."melting",
    ingredients = 
	{ 
	  
	},
    results = 
	{ 
	  {type = "fluid", name = "molten-"..v.DyWorld.Name, amount = 15},
	},
  },
})
	if v.DyWorld.Metallurgy.Mixed_Formula then
		for n, a in pairs(v.DyWorld.Metallurgy.Mixed_Formula) do
			local Ingredient = {type = "fluid", name = "molten-"..n, amount = a}
			table.insert(data.raw.recipe["molten-"..v.DyWorld.Name].ingredients, Ingredient)
		end
	end
	if v.DyWorld.Metallurgy.Mixed_Item then
		for n, a in pairs(v.DyWorld.Metallurgy.Mixed_Item) do
			local Ingredient = {type = "item", name = n, amount = a}
			table.insert(data.raw.recipe["molten-"..v.DyWorld.Name].ingredients, Ingredient)
		end
	end
	DyWorld_Add_To_Tech("metallurgy-"..v.DyWorld.Tier, "molten-"..v.DyWorld.Name)
	end
end	