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
    enabled = false,
	category = dy.."melting",
    normal = { 
	  energy_required = 1 * v.DyWorld.Tier,
	  enabled = false,
	  ingredients = {},
	  results = { 
	    {type = "fluid", name = "molten-"..v.DyWorld.Name, amount = 150},
	  },
	},
    expensive = { 
	  energy_required = 2 * v.DyWorld.Tier,
	  enabled = false,
	  ingredients = {},
	  results = { 
	    {type = "fluid", name = "molten-"..v.DyWorld.Name, amount = 150},
	  },
	},
  },
})
	if v.DyWorld.Metallurgy.Mixed_Formula then
		for n, a in pairs(v.DyWorld.Metallurgy.Mixed_Formula) do
			local Ingredient = {type = "fluid", name = "molten-"..n, amount = a}
			local Ingredient_2 = {type = "fluid", name = "molten-"..n, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe["molten-"..v.DyWorld.Name].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe["molten-"..v.DyWorld.Name].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Metallurgy.Mixed_Item then
		for n, a in pairs(v.DyWorld.Metallurgy.Mixed_Item) do
			local Ingredient = {type = "item", name = n, amount = a}
			local Ingredient_2 = {type = "item", name = n, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe["molten-"..v.DyWorld.Name].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe["molten-"..v.DyWorld.Name].expensive.ingredients, Ingredient_2)
		end
	end
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