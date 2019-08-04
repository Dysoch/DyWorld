require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here recipes

local Data_Table = {
	{
		Name = "stone-plate",
		Time = 1,
		Recipe_Enabled = true,
		Icon_Type_Icons = true,
		Subgroup = "intermediates-tier-0",
		Recipe_Ingredients = {
			["stone-brick"] = 1,
		},
		Multi_Output = {
			{type = "item", name = "stone-plate", amount = 2},
		},
		Enabled = true,
	},
	{
		Name = "stone",
		Time = 2,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["sand"] = 5,
		},
		Enabled = true,
	},
	{
		Name = "stone-gear-wheel",
		Time = 1,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["stone"] = 2,
		},
		Enabled = true,
	},
	{
		Name = "glass",
		Time = 2,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["sand"] = 2,
		},
		Enabled = true,
		Category = "smelting",
	},
	{
		Name = "rubber",
		Time = 4,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["resin"] = 5,
		},
		Enabled = true,
		Category = "smelting",
	},
	{
		Name = "gunpowder",
		Time = 4,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["sulfur"] = 5,
		},
		Enabled = true,
		Category = "smelting",
	},
	{
		Name = "frame",
		Time = 2,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["iron-plate"] = 5,
			["copper-plate"] = 1,
			["steel-plate"] = 2,
		},
		Enabled = true,
	},
	{
		Name = "coil",
		Time = 2,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["tin-plate"] = 1,
			["lead-plate"] = 2,
			["copper-cable"] = 2,
		},
		Enabled = true,
	},
	{
		Name = "heater",
		Time = 5,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["coil"] = 2,
			["iron-plate"] = 5,
			["bronze-plate"] = 2,
		},
		Enabled = true,
	},
	{
		Name = "blade",
		Time = 1,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["stone"] = 2,
			["iron-plate"] = 1,
		},
		Enabled = true,
	},
	{
		Name = "gearbox",
		Time = 7.5,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["iron-gear-wheel"] = 5,
			["rotor"] = 1,
			["coil"] = 4,
			["heater"] = 1,
			["rubber"] = 2,
			["intake"] = 1,
			["lead-plate"] = 2,
		},
		Enabled = true,
	},
	{
		Name = "rotor",
		Time = 2.5,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["iron-gear-wheel"] = 1,
			["blade"] = 3,
			["copper-cable"] = 2,
		},
		Enabled = true,
	},
	{
		Name = "solar-cell",
		Time = 12.5,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["silver-plate"] = 4,
			["bronze-plate"] = 1,
			["electronic-circuit"] = 1,
		},
		Enabled = true,
	},
	{
		Name = "battery-pack",
		Time = 7.5,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["battery"] = 4,
			["lead-plate"] = 1,
			["electronic-circuit"] = 1,
		},
		Enabled = true,
	},
	{
		Name = "logistic-unit",
		Time = 12.5,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["battery-pack"] = 1,
			["frame"] = 1,
			["glass"] = 2,
			["rubber"] = 1,
			["advanced-circuit"] = 2,
		},
		Enabled = true,
	},
	{
		Name = "resin",
		Time = 1,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["wood"] = 1,
		},
		Enabled = true,
	},
	{
		Name = "controller",
		Time = 1,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["housing"] = 1,
			["invar-plate"] = 4,
			["processing-unit"] = 2,
			["logistic-unit"] = 1,
		},
		Enabled = true,
	},
	{
		Name = "housing",
		Time = 1,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["frame"] = 1,
			["cobalt-plate"] = 3,
			["electronic-circuit"] = 2,
		},
		Enabled = true,
	},
	{
		Name = "intake",
		Time = 1,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["frame"] = 1,
			["rotor"] = 3,
			["steel-plate"] = 2,
		},
		Enabled = true,
	},
	{
		Name = "filter-empty",
		Time = 2,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["iron-plate"] = 2,
		},
		Enabled = true,
	},
}

for k,v in pairs(Data_Table) do
	if not data.raw.recipe[v.Name] then
		DyWorld_Master_Recipe_Creator(v)
	end
end	