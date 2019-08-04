require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here is just the tier in which is resides in the crafting menu (the number behind the =)

local Data_Table = {
	{
		Name = "oxygen",
		Time = 25,
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
		Time = 25,
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
	{
		Name = "carbon-monoxide",
		Time = 25,
		Recipe_Enabled = true,
		Enabled = true,
		Category = dy.."air-filter",
		Multi_Output = {
			{type = "fluid", name = "carbon-monoxide", amount_min = 1, amount_max = 100, probability = 1},
		},
		Icon_Type_Icons = true,
		Icon = data.raw.fluid["carbon-monoxide"].icons,
		Subgroup = "fluids-0",
	},
	{
		Name = "carbon-dioxide",
		Time = 25,
		Recipe_Enabled = true,
		Enabled = true,
		Category = dy.."air-filter",
		Multi_Output = {
			{type = "fluid", name = "carbon-dioxide", amount_min = 1, amount_max = 100, probability = 1},
		},
		Icon_Type_Icons = true,
		Icon = data.raw.fluid["carbon-dioxide"].icons,
		Subgroup = "fluids-0",
	},
	{
		Name = "nitrogen",
		Time = 25,
		Recipe_Enabled = true,
		Enabled = true,
		Category = dy.."air-filter",
		Multi_Output = {
			{type = "fluid", name = "nitrogen", amount_min = 1, amount_max = 100, probability = 1},
		},
		Icon_Type_Icons = true,
		Icon = data.raw.fluid["nitrogen"].icons,
		Subgroup = "fluids-0",
	},
	{
		Name = "methane",
		Time = 25,
		Recipe_Enabled = true,
		Enabled = true,
		Category = dy.."air-filter",
		Multi_Output = {
			{type = "fluid", name = "methane", amount_min = 1, amount_max = 100, probability = 1},
		},
		Icon_Type_Icons = true,
		Icon = data.raw.fluid["methane"].icons,
		Subgroup = "fluids-0",
	},
	{
		Name = "argon",
		Time = 25,
		Recipe_Enabled = true,
		Enabled = true,
		Category = dy.."air-filter",
		Multi_Output = {
			{type = "fluid", name = "argon", amount_min = 1, amount_max = 100, probability = 1},
		},
		Icon_Type_Icons = true,
		Icon = data.raw.fluid["argon"].icons,
		Subgroup = "fluids-0",
	},
	{
		Name = "boron",
		Time = 25,
		Recipe_Enabled = true,
		Enabled = true,
		Category = dy.."air-filter",
		Multi_Output = {
			{type = "fluid", name = "boron", amount_min = 1, amount_max = 100, probability = 1},
		},
		Icon_Type_Icons = true,
		Icon = data.raw.fluid["boron"].icons,
		Subgroup = "fluids-0",
	},
	{
		Name = "air-filtering",
		Time = 5,
		Recipe_Enabled = true,
		Enabled = true,
		Category = dy.."air-filter",
		Multi_Output = {
			{type = "fluid", name = "pollution", amount_min = 13, amount_max = 31, probability = 0.9}, --22
			{type = "fluid", name = "nitrogen", amount_min = 50, amount_max = 70, probability = 0.9}, --60
			{type = "fluid", name = "hydrogen", amount = 1, probability = 0.9}, --1
			{type = "fluid", name = "oxygen", amount_min = 14, amount_max = 20, probability = 0.9}, --17
		},
		Icon_Type_Icons = true,
		Icon = data.raw.fluid["pollution"].icons,
		Subgroup = "fluids-0",
	},
	{
		Name = "pollution-filtering",
		Time = 5,
		Recipe_Enabled = true,
		Enabled = true,
		Category = "centrifuging",
		Add_Fluid_1 = "pollution",
		Add_Fluid_1_Amount = 25,
		Multi_Output = {
			{type = "fluid", name = "methane", amount_min = 10, amount_max = 25, probability = 0.9}, 
			{type = "fluid", name = "carbon-monoxide", amount_min = 10, amount_max = 25, probability = 0.9}, 
			{type = "fluid", name = "carbon-dioxide", amount_min = 10, amount_max = 25, probability = 0.9}, 
			{type = "fluid", name = "argon", amount_min = 10, amount_max = 25, probability = 0.9}, 
		},
		Icon_Type_Icons = true,
		Icon = data.raw.fluid["pollution"].icons,
		Subgroup = "fluids-0",
	},
}

for k,v in pairs(Data_Table) do
	if not data.raw.recipe[v.Name] then
		DyWorld_Master_Recipe_Creator(v)
	end
end	