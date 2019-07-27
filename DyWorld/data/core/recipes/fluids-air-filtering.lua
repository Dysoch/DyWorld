require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here is just the tier in which is resides in the crafting menu (the number behind the =)

local Data_Table = {
	{
		Name = "oxygen",
		Time = 5,
		Recipe_Enabled = true,
		Enabled = true,
		Category = dy.."air-filter",
		Multi_Output = {
			{type = "fluid", name = "oxygen", amount_min = 1, amount_max = 100, probability = 1},
		},
		Icon_Type_Icons = true,
		Icon = data.raw.fluid["oxygen"].icons,
		Subgroup = "fluids-0",
	},
	{
		Name = "hydrogen",
		Time = 5,
		Recipe_Enabled = true,
		Enabled = true,
		Category = dy.."air-filter",
		Multi_Output = {
			{type = "fluid", name = "hydrogen", amount_min = 1, amount_max = 100, probability = 1},
		},
		Icon_Type_Icons = true,
		Icon = data.raw.fluid["hydrogen"].icons,
		Subgroup = "fluids-0",
	},
}

for k,v in pairs(Data_Table) do
	DyWorld_Master_Recipe_Creator(v)
end	