require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here is just the tier in which is resides in the crafting menu (the number behind the =)

local Data_Table = {
	{
		Name = "nickel-plate",
		Time = 3.2,
		Recipe_Enabled = true,
		Productivity = true,
		Recipe_Ingredients = {
			["nickel-ore"] = 2,
		},
		Enabled = true,
		Category = "smelting",
	},
	{
		Name = "silver-plate",
		Time = 3.2,
		Recipe_Enabled = true,
		Productivity = true,
		Recipe_Ingredients = {
			["silver-ore"] = 2,
		},
		Enabled = true,
		Category = "smelting",
	},
	{
		Name = "tin-plate",
		Time = 3.2,
		Recipe_Enabled = true,
		Productivity = true,
		Recipe_Ingredients = {
			["tin-ore"] = 2,
		},
		Enabled = true,
		Category = "smelting",
	},
	{
		Name = "gold-plate",
		Time = 5,
		Recipe_Enabled = true,
		Productivity = true,
		Recipe_Ingredients = {
			["gold-ore"] = 2,
		},
		Enabled = true,
		Category = "smelting",
	},
	{
		Name = "lead-plate",
		Time = 5,
		Recipe_Enabled = true,
		Productivity = true,
		Recipe_Ingredients = {
			["lead-ore"] = 2,
		},
		Enabled = true,
		Category = "smelting",
	},
}

for k,v in pairs(Data_Table) do
	if not data.raw.recipe[v.Name] then
		DyWorld_Master_Recipe_Creator(v)
	end
end	