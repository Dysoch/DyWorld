require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here recipes

if settings.startup["DyWorld_Logistics"].value then

local Data_Table = {
	{
		Name = "steel-underground-belt-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["steel-transport-belt"] = 14,
			["electronic-motor"] = 4,
			["electronic-control-board"] = 5,
			["steel-gear-wheel"] = 6,
			["steel-plate"] = 15,
			["steel-stick"] = 2,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "steel-underground-belt", amount = 2},
		},
		Tech = "logistics-4",
		No_Decomp = true,
		No_Allow_As_Intermediate = true,
	},
	{
		Name = "steel-transport-belt-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["electronic-motor"] = 2,
			["steel-gear-wheel"] = 6,
			["steel-plate"] = 6,
			["steel-stick"] = 1,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "steel-transport-belt", amount = 1},
		},
		Tech = "logistics-4",
		No_Decomp = true,
		No_Allow_As_Intermediate = true,
	},
	{
		Name = "steel-loader-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["electronic-motor"] = 1,
			["steel-transport-belt"] = 1,
			["steel-gear-wheel"] = 1,
			["steel-plate"] = 2,
			["steel-stick"] = 4,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "steel-loader", amount = 1},
		},
		Tech = "logistics-4",
		No_Decomp = true,
		No_Allow_As_Intermediate = true,
	},
	{
		Name = "steel-splitter-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["electronic-motor"] = 2,
			["steel-transport-belt"] = 2,
			["electronic-control-board"] = 2,
			["steel-gear-wheel"] = 4,
			["steel-plate"] = 3,
			["steel-stick"] = 4,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "steel-splitter", amount = 1},
		},
		Tech = "logistics-4",
		No_Decomp = true,
		No_Allow_As_Intermediate = true,
	},
	{
		Name = "steel-pump-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["electronic-motor"] = 5,
			["electronic-control-board"] = 2,
			["steel-gear-wheel"] = 2,
			["steel-plate"] = 10,
			["steel-stick"] = 5,
			["bronze-pipe"] = 2,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "steel-pump", amount = 1},
		},
		Tech = "logistics-4",
		No_Decomp = true,
		No_Allow_As_Intermediate = true,
	},
	{
		Name = "bronze-pipe-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["bronze-plate"] = 10,
			["rubber"] = 5,
			["glass"] = 2,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "bronze-pipe", amount = 1},
		},
		Tech = "logistics-4",
		No_Decomp = true,
		No_Allow_As_Intermediate = true,
	},
	{
		Name = "bronze-pipe-to-ground-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["bronze-plate"] = 15,
			["rubber"] = 15,
			["glass"] = 5,
			["bronze-pipe"] = 10,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "bronze-pipe-to-ground", amount = 1},
		},
		Tech = "logistics-4",
		No_Decomp = true,
		No_Allow_As_Intermediate = true,
	},
	{
		Name = "gold-roboport-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["electronic-motor"] = 15,
			["electronic-control-board"] = 30,
			["gold-plate"] = 50,
			["gold-stick"] = 30,
			["rubber"] = 25,
			["frame"] = 2,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "gold-roboport", amount = 1},
		},
		Tech = "construction-robotics-4",
		No_Decomp = true,
		No_Allow_As_Intermediate = true,
	},
	{
		Name = "gold-logistic-robot-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["electronic-motor"] = 3,
			["electronic-control-board"] = 10,
			["gold-plate"] = 15,
			["gold-stick"] = 2,
			["rubber"] = 5,
			["frame"] = 1,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "gold-logistic-robot", amount = 1},
		},
		Tech = "logistic-robotics-4",
		No_Decomp = true,
		No_Allow_As_Intermediate = true,
	},
	{
		Name = "gold-construction-robot-2",
		Time = 15,
		Enabled = true,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["electronic-motor"] = 3,
			["electronic-control-board"] = 10,
			["gold-plate"] = 15,
			["gold-stick"] = 2,
			["rubber"] = 5,
			["frame"] = 1,
		},
		Icon_Type_Icons = true,
		Subgroup = "standalone",
		Multi_Output = {
			{type = "item", name = "gold-construction-robot", amount = 1},
		},
		Tech = "construction-robotics-4",
		No_Decomp = true,
		No_Allow_As_Intermediate = true,
	},
}

for k,v in pairs(Data_Table) do
	if not data.raw.recipe[v.Name] then
		DyWorld_Master_Recipe_Creator(v)
	end
end	

end