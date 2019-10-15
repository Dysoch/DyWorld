require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here recipes

local Data_Table = {
	{
		Name = "lead-electric-mining-drill-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["frame"] = 1,
			["rotor"] = 2,
			["electronic-motor"] = 5,
			["electronic-control-board"] = 15,
			["lead-gear-wheel"] = 6,
			["lead-plate"] = 20,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "lead-electric-mining-drill", amount = 1},
		},
		Tech = "automation-4",
	},
	{
		Name = "bronze-pumpjack-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["frame"] = 1,
			["plastic-bar"] = 15,
			["electronic-motor"] = 5,
			["electronic-control-board"] = 15,
			["bronze-gear-wheel"] = 6,
			["bronze-plate"] = 20,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "bronze-pumpjack", amount = 1},
		},
		Tech = "automation-4",
	},
}

for k,v in pairs(Data_Table) do
	if not data.raw.recipe[v.Name] then
		DyWorld_Master_Recipe_Creator(v)
	end
end	