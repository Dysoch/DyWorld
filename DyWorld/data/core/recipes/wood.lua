require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here is just the tier in which is resides in the crafting menu (the number behind the =)

local Data_Table = {
	{
		Name = "wood",
		Time = 300,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["acorn"] = 1,
		},
		-- Water ingredient is added at bottom of file because of temperature
		Enabled = true,
		Category = dy.."farming",
		Multi_Output = {
			{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.95},
			{type = "item", name = "acorn", amount_min = 1, amount_max = 10, probability = 0.25},
		},
		Icon = data.raw.item.wood.icon,
		Subgroup = "0-resource",
	},
}

for k,v in pairs(Data_Table) do
	if not data.raw.recipe[v.Name] then
		DyWorld_Master_Recipe_Creator(v)
	end
end	

for k,v in pairs(data.raw.tree) do
	if v.minable then
		v.minable = {
        mining_particle = "wooden-particle",
        mining_time = 0.55,
        results = {
		  {type = "item", name = "wood", amount_min = 1, amount_max = 7, probability = 0.98},
		  {type = "item", name = "acorn", amount_min = 1, amount_max = 1, probability = 0.10},
		},
      }
	else
		v.minable = {
        mining_particle = "wooden-particle",
        mining_time = 0.55,
        results = {
		  {type = "item", name = "wood", amount_min = 1, amount_max = 7, probability = 0.98},
		  {type = "item", name = "acorn", amount_min = 1, amount_max = 1, probability = 0.10},
		},
      }
	end
end

local INSERT = {type = "fluid", name = "water", amount = 250, minimum_temperature = 10, maximum_temperature = 35}
table.insert(data.raw.recipe["wood"].normal.ingredients, INSERT)
local INSERT = {type = "fluid", name = "water", amount = 1250, minimum_temperature = 10, maximum_temperature = 25}
table.insert(data.raw.recipe["wood"].expensive.ingredients, INSERT)