require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"


local Data_Table = {
	{
		Name = "carrot",
		Time = 500,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["carrot"] = 2,
		},
		-- Water ingredient is added at bottom of file because of temperature
		Enabled = true,
		Category = dy.."farming",
		Multi_Output = {
			{type = "item", name = "carrot", amount_min = 2, amount_max = 10, probability = 0.98},
		},
		Icon = data.raw.capsule.carrot.icons[1].icon,
		Subgroup = "0-resource",
	},
	{
		Name = "wheat",
		Time = 1500,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["wheat"] = 2,
		},
		Enabled = true,
		Category = dy.."farming",
		Multi_Output = {
			{type = "item", name = "wheat", amount_min = 2, amount_max = 10, probability = 0.98},
		},
		Icon = data.raw.item.wheat.icons[1].icon,
		Subgroup = "0-resource",
	},
}

for k,v in pairs(Data_Table) do
	if not data.raw.recipe[v.Name] then
		DyWorld_Master_Recipe_Creator(v)
	end
end	

local INSERT = {type = "fluid", name = "water", amount = 250, minimum_temperature = 15, maximum_temperature = 25}
local INSERT_HARD = {type = "fluid", name = "water", amount = math.ceil(250 * Expensive_Modifier), minimum_temperature = 15, maximum_temperature = 25}
table.insert(data.raw.recipe["carrot"].normal.ingredients, INSERT)
table.insert(data.raw.recipe["carrot"].expensive.ingredients, INSERT_HARD)

local INSERT = {type = "fluid", name = "water", amount = 250, minimum_temperature = 20, maximum_temperature = 25}
local INSERT_HARD = {type = "fluid", name = "water", amount = math.ceil(250 * Expensive_Modifier), minimum_temperature = 20, maximum_temperature = 25}
table.insert(data.raw.recipe["wheat"].normal.ingredients, INSERT)
table.insert(data.raw.recipe["wheat"].expensive.ingredients, INSERT_HARD)

local INSERT = {type = "fluid", name = "methane", amount = 50}
local INSERT_HARD = {type = "fluid", name = "methane", amount = math.ceil(50 * Expensive_Modifier)}
table.insert(data.raw.recipe["wheat"].normal.ingredients, INSERT)
table.insert(data.raw.recipe["wheat"].expensive.ingredients, INSERT_HARD)