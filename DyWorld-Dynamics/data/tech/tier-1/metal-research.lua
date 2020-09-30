

local Metal_Techs = {
	{
		name = "copper-processing",
		count = 15,
		ingredients = {
			{"copper-ore-impure", 25},
			{"copper-ore", 25},
			{"copper-plate", 1},
		},
		time = 2.5,
		order = "1",
	},
	{
		name = "iron-processing",
		count = 25,
		ingredients = {
			{"iron-ore-impure", 25},
			{"iron-ore", 25},
			{"iron-plate", 1},
		},
		time = 5,
		order = "1",
	},
	{
		name = "tin-processing",
		count = 10,
		ingredients = {
			{"tin-ore-impure", 25},
			{"tin-ore", 25},
			{"tin-plate", 1},
		},
		time = 1,
		order = "1",
	},
	{
		name = "bronze-processing",
		count = 100,
		prerequisites = {
			"tin-processing",
			"iron-processing",
			"copper-processing",
		},
		ingredients = {
			{"iron-plate", 1},
			{"copper-plate", 10},
			{"tin-plate", 10},
		},
		time = 10,
		order = "1",
	},
	{
		name = "advanced-copper-processing",
		count = 15,
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			{"copper-ore-impure", 25},
			{"copper-ore", 25},
			{"copper-plate", 1},
		},
		time = 2.5,
		order = "1",
	},
	{
		name = "advanced-iron-processing",
		count = 25,
		prerequisites = {
			"slag-processing",
			"liquid-metals",
		},
		ingredients = {
			{"iron-ore-impure", 25},
			{"iron-ore", 25},
			{"iron-plate", 1},
		},
		time = 5,
		order = "1",
	},
	{
		name = "advanced-tin-processing",
		count = 10,
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			{"tin-ore-impure", 25},
			{"tin-ore", 25},
			{"tin-plate", 1},
		},
		time = 1,
		order = "1",
	},
	{
		name = "liquid-metals",
		count = 100,
		prerequisites = {
			"metallurgy-2",
		},
		ingredients = {
			{"iron-plate", 1},
			{"copper-plate", 10},
			{"tin-plate", 10},
		},
		time = 10,
		order = "1",
	},
	{
		name = "advanced-bronze-processing",
		count = 100,
		prerequisites = {
			"liquid-metals",
			"metallurgy-2",
			"advanced-copper-processing",
			"advanced-tin-processing",
		},
		ingredients = {
			{"iron-plate", 1},
			{"copper-plate", 10},
			{"tin-plate", 10},
		},
		time = 10,
		order = "1",
	},
	----- Automation -----
	{
		name = "automation-1",
		count = 100,
		prerequisites = {
			"bronze-processing",
		},
		ingredients = {
			{"iron-plate", 25},
			{"copper-plate", 25},
			{"tin-plate", 25},
			{"bronze-plate", 25},
		},
		time = 15,
		order = "1",
	},
	{
		name = "automation-2",
		count = 1000,
		prerequisites = {
			"filters-1",
			"storage-1",
			"power-1",
			"metallurgy-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	{
		name = "automation-3",
		count = 5000,
		prerequisites = {
			"storage-2",
			"power-2",
			"metallurgy-2",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	----- Optics -----
	{
		name = "optics",
		count = 250,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	----- Recycling -----
	{
		name = "recycling",
		count = 250,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	----- Water Filtering -----
	{
		name = "water-filtering",
		count = 250,
		prerequisites = {
			"automation-3",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	----- Logistics -----
	{
		name = "logistics-1",
		count = 100,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	----- Power -----
	{
		name = "power-1",
		count = 100,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	{
		name = "power-2",
		count = 100,
		prerequisites = {
			"power-1",
			"automation-2",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	{
		name = "power-3",
		count = 100,
		prerequisites = {
			"power-2",
			"automation-3",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	----- Warfare -----
	{
		name = "warfare-1",
		count = 100,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	{
		name = "warfare-2",
		count = 100,
		prerequisites = {
			"warfare-1",
			"automation-2",
			"fluids-2",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	{
		name = "warfare-3",
		count = 100,
		prerequisites = {
			"automation-3",
			"warfare-2",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	----- Metallurgy -----
	{
		name = "metallurgy-1",
		count = 100,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	{
		name = "metallurgy-2",
		count = 100,
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	{
		name = "metallurgy-3",
		count = 100,
		prerequisites = {
			"metallurgy-2",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	----- Storage And Filters -----
	{
		name = "storage-1",
		count = 100,
		prerequisites = {
			"logistics-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	{
		name = "storage-2",
		count = 100,
		prerequisites = {
			"storage-1",
			"automation-2",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	{
		name = "filters-1",
		count = 100,
		prerequisites = {
			"logistics-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	----- Seperate Unlocks -----
	{
		name = "slag-processing",
		count = 100,
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
	{
		name = "basic-asteroid-mining",
		count = 100,
		prerequisites = {
			"storage-2",
			"automation-3",
			"metallurgy-3",
			"advanced-copper-processing",
			"advanced-iron-processing",
			"space-mining",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 30,
		order = "1",
	},
}

for k,v in pairs(Metal_Techs) do
	DyWorld_Tech_Add(v)
end