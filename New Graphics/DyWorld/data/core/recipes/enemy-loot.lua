require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"


local Data_Table = {
	{
		Name = "enemy-farming-1",
		Time = 1000,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["egg"] = 1,
		},
		Enabled = true,
		Category = dy.."farming",
		Multi_Output = {
			{type = "item", name = "egg", amount_min = 1, amount_max = 1, probability = 0.25},
			{type = "item", name = "chitin", amount_min = 1, amount_max = 50, probability = 1},
			{type = "item", name = "obsidian", amount_min = 1, amount_max = 10, probability = 1},
			{type = "item", name = "diamond", amount_min = 1, amount_max = 1, probability = 0.025},
		},
		Icon = data.raw.item.egg.icons[1].icon,
		Subgroup = "0-resource",
	},
	{
		Name = "enemy-farming-2",
		Time = 1000,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["egg"] = 1,
		},
		Enabled = true,
		Category = dy.."farming-2",
		Multi_Output = {
			{type = "item", name = "egg", amount_min = 1, amount_max = 1, probability = 0.45},
			{type = "item", name = "chitin", amount_min = 1, amount_max = 100, probability = 1},
			{type = "item", name = "obsidian", amount_min = 1, amount_max = 20, probability = 1},
			{type = "item", name = "diamond", amount_min = 1, amount_max = 1, probability = 0.05},
		},
		Icon = data.raw.item.egg.icons[1].icon,
		Subgroup = "0-resource",
	},
	{
		Name = "enemy-farming-3",
		Time = 1000,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["egg"] = 1,
		},
		Enabled = true,
		Category = dy.."farming-3",
		Multi_Output = {
			{type = "item", name = "egg", amount_min = 1, amount_max = 1, probability = 0.65},
			{type = "item", name = "chitin", amount_min = 1, amount_max = 150, probability = 1},
			{type = "item", name = "obsidian", amount_min = 1, amount_max = 35, probability = 0.95},
			{type = "item", name = "diamond", amount_min = 1, amount_max = 2, probability = 0.075},
		},
		Icon = data.raw.item.egg.icons[1].icon,
		Subgroup = "0-resource",
	},
	{
		Name = "enemy-farming-4",
		Time = 1000,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["egg"] = 1,
		},
		Enabled = true,
		Category = dy.."farming-4",
		Multi_Output = {
			{type = "item", name = "egg", amount_min = 1, amount_max = 1, probability = 0.9},
			{type = "item", name = "chitin", amount_min = 1, amount_max = 200, probability = 1},
			{type = "item", name = "obsidian", amount_min = 1, amount_max = 50, probability = 0.9},
			{type = "item", name = "diamond", amount_min = 1, amount_max = 3, probability = 0.1},
		},
		Icon = data.raw.item.egg.icons[1].icon,
		Subgroup = "0-resource",
	},
	{
		Name = "enemy-farming-5",
		Time = 1000,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["egg"] = 1,
		},
		Enabled = true,
		Category = dy.."farming-5",
		Multi_Output = {
			{type = "item", name = "egg", amount_min = 1, amount_max = 1, probability = 1},
			{type = "item", name = "chitin", amount_min = 1, amount_max = 250, probability = 1},
			{type = "item", name = "obsidian", amount_min = 1, amount_max = 50, probability = 1},
			{type = "item", name = "diamond", amount_min = 1, amount_max = 10, probability = 0.15},
		},
		Icon = data.raw.item.egg.icons[1].icon,
		Subgroup = "0-resource",
	},
}

for k,v in pairs(Data_Table) do
	if not data.raw.recipe[v.Name] then
		DyWorld_Master_Recipe_Creator(v)
	end
end	