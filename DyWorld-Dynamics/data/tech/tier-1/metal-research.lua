

local Metal_Techs = {
	{
		name = "copper-processing",
		icon = DyDs_path_tech.."copper.png",
		count = 15,
		ingredients = {
			{"copper-ore-impure", 25},
			{"copper-ore", 25},
			{"copper-plate", 1},
		},
		time = 5,
		order = "1",
	},
	{
		name = "iron-processing",
		icon = DyDs_path_tech.."iron.png",
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
		icon = DyDs_path_tech.."tin.png",
		count = 10,
		ingredients = {
			{"tin-ore-impure", 25},
			{"tin-ore", 25},
			{"tin-plate", 1},l
		},
		time = 5,
		order = "1",
	},
	{
		name = "bronze-processing",
		icon = DyDs_path_tech.."bronze.png",
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
		icon = DyDs_path_tech.."copper.png",
		count = 150,
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			{"copper-ore", 15},
			{"copper-plate", 10},
		},
		time = 15,
		order = "1",
	},
	{
		name = "advanced-iron-processing",
		icon = DyDs_path_tech.."iron.png",
		count = 150,
		prerequisites = {
			"metallurgy-2",
		},
		ingredients = {
			{"limestone", 15},
			{"iron-ore", 15},
			{"iron-plate", 10},
		},
		time = 20,
		order = "1",
	},
	{
		name = "advanced-tin-processing",
		icon = DyDs_path_tech.."tin.png",
		count = 150,
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			{"tin-ore", 15},
			{"tin-plate", 5},
		},
		time = 15,
		order = "1",
	},
	{
		name = "advanced-bronze-processing",
		icon = DyDs_path_tech.."bronze.png",
		count = 200,
		prerequisites = {
			"metallurgy-2",
			"advanced-copper-processing",
			"advanced-tin-processing",
		},
		ingredients = {
			{"bronze-plate", 25},
		},
		time = 60,
		order = "1",
	},
	{
		name = "steel-processing",
		icon = DyDs_path_tech.."iron.png",
		count = 10,
		prerequisites = {
			"metallurgy-2",
			"advanced-iron-processing",
		},
		ingredients = {
			{"limestone", 15},
			{"coal", 15},
			{"iron-plate", 10},
		},
		time = 5,
		order = "1",
	},
	{
		name = "titanium-processing",
		icon = DyDs_path_tech.."iron.png",
		count = 10,
		prerequisites = {
			"metallurgy-3",
		},
		ingredients = {
			{"limestone", 15},
			{"coal", 15},
			{"iron-plate", 10},
		},
		time = 5,
		order = "1",
	},
	{
		name = "aluminium-processing",
		icon = DyDs_path_tech.."iron.png",
		count = 10,
		prerequisites = {
			"metallurgy-3",
		},
		ingredients = {
			{"limestone", 15},
			{"coal", 15},
			{"iron-plate", 10},
		},
		time = 5,
		order = "1",
	},
	{
		name = "magnesium-processing",
		icon = DyDs_path_tech.."iron.png",
		count = 10,
		prerequisites = {
			"metallurgy-3",
		},
		ingredients = {
			{"limestone", 15},
			{"coal", 15},
			{"iron-plate", 10},
		},
		time = 5,
		order = "1",
	},
	{
		name = "advanced-steel-processing",
		icon = DyDs_path_tech.."iron.png",
		count = 100,
		prerequisites = {
			"metallurgy-3",
			"steel-processing",
		},
		ingredients = {
			{"limestone", 15},
			{"coal", 15},
			{"steel-plate", 10},
		},
		time = 25,
		order = "1",
	},
	----- Automation -----
	{
		name = "automation-1",
		icon = DyDs_path_tech_base.."automation.png",
		count = 100,
		prerequisites = {
			"intermediates-1",
		},
		ingredients = {
			{"iron-plate", 10},
			{"copper-plate", 10},
			{"tin-plate", 10},
			{"bronze-plate", 10},
		},
		time = 5,
		order = "1",
	},
	{
		name = "automation-2",
		icon = DyDs_path_tech_base.."automation.png",
		count = 100,
		prerequisites = {
			"intermediates-2",
		},
		ingredients = {
			{"iron-plate", 25},
			{"copper-plate", 25},
			{"tin-plate", 25},
			{"bronze-plate", 25},
		},
		time = 10,
		order = "1",
	},
	{
		name = "automation-3",
		icon = DyDs_path_tech_base.."automation.png",
		count = 100,
		prerequisites = {
			"intermediates-3",
		},
		ingredients = {
			{"iron-plate", 50},
			{"copper-plate", 50},
			{"tin-plate", 50},
			{"bronze-plate", 50},
		},
		time = 15,
		order = "1",
	},
	----- Intermediates -----
	{
		name = "intermediates-1",
		icon = DyDs_path_tech_base.."automation.png",
		count = 100,
		prerequisites = {
			"bronze-processing",
		},
		ingredients = {
			{"iron-plate", 10},
			{"copper-plate", 10},
			{"tin-plate", 10},
			{"bronze-plate", 10},
		},
		time = 5,
		order = "1",
	},
	{
		name = "intermediates-2",
		icon = DyDs_path_tech_base.."automation.png",
		count = 100,
		prerequisites = {
			"filters-1",
			"storage-1",
			"power-1",
			"metallurgy-1",
		},
		ingredients = {
			{"iron-plate", 25},
			{"copper-plate", 25},
			{"tin-plate", 25},
			{"bronze-plate", 25},
		},
		time = 10,
		order = "1",
	},
	{
		name = "intermediates-3",
		icon = DyDs_path_tech_base.."automation.png",
		count = 100,
		prerequisites = {
			"storage-2",
			"power-2",
			"steel-processing",
		},
		ingredients = {
			{"iron-plate", 50},
			{"copper-plate", 50},
			{"tin-plate", 50},
			{"bronze-plate", 50},
		},
		time = 15,
		order = "1",
	},
	----- Optics -----
	{
		name = "optics",
		icon = DyDs_path_tech_base.."optics.png",
		count = 50,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"iron-plate", 1},
			{"copper-plate", 1},
			{"tin-plate", 1},
			{"bronze-plate", 1},
		},
		time = 10,
		order = "1",
	},
	----- Recycling -----
	{
		name = "recycling",
		icon = DyDs_path_tech_base.."radar.png",
		count = 250,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"iron-plate", 1},
			{"copper-plate", 1},
			{"tin-plate", 1},
			{"bronze-plate", 1},
		},
		time = 10,
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
		time = 10,
		order = "1",
	},
	----- Logistics -----
	{
		name = "logistics-1",
		icon = DyDs_path_tech_base.."logistics.png",
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
		time = 10,
		order = "1",
	},
	{
		name = "railway-1",
		icon = DyDs_path_tech_base.."railway.png",
		count = 50,
		prerequisites = {
			"logistics-1",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 5},
			{"bronze-plate", 1},
		},
		time = 10,
		order = "1",
	},
	{
		name = "railway-2",
		icon = DyDs_path_tech_base.."railway.png",
		count = 100,
		prerequisites = {
			"railway-1",
		},
		ingredients = {
			{"iron-plate", 15},
			{"copper-plate", 15},
			{"bronze-plate", 10},
		},
		time = 10,
		order = "1",
	},
	----- Power -----
	{
		name = "power-1",
		icon = DyDs_path_tech_base.."electric-energy-distribution.png",
		count = 100,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"tin-plate", 3},
			{"bronze-plate", 1},
		},
		time = 5,
		order = "1",
	},
	{
		name = "power-2",
		icon = DyDs_path_tech_base.."electric-energy-distribution.png",
		count = 100,
		prerequisites = {
			"power-1",
			"automation-2",
		},
		ingredients = {
			{"copper-plate", 5},
			{"tin-plate", 6},
			{"bronze-plate", 2},
		},
		time = 10,
		order = "1",
	},
	{
		name = "power-3",
		icon = DyDs_path_tech_base.."electric-energy-distribution.png",
		count = 100,
		prerequisites = {
			"power-2",
			"automation-3",
		},
		ingredients = {
			{"iron-plate", 5},
			{"copper-plate", 10},
			{"tin-plate", 9},
			{"bronze-plate", 3},
		},
		time = 15,
		order = "1",
	},
	----- Warfare -----
	{
		name = "warfare-1",
		icon = DyDs_path_tech_base.."military.png",
		count = 100,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"tin-plate", 3},
		},
		time = 5,
		order = "1",
	},
	{
		name = "warfare-2",
		icon = DyDs_path_tech_base.."military.png",
		count = 250,
		prerequisites = {
			"warfare-1",
			"automation-2",
			"fluids-2",
		},
		ingredients = {
			{"iron-plate", 1},
			{"copper-plate", 3},
			{"tin-plate", 2},
		},
		time = 10,
		order = "1",
	},
	{
		name = "warfare-3",
		icon = DyDs_path_tech_base.."military.png",
		count = 100,
		prerequisites = {
			"automation-3",
			"warfare-2",
		},
		ingredients = {
			{"iron-plate", 15},
			{"copper-plate", 15},
			{"tin-plate", 9},
			{"bronze-plate", 3},
		},
		time = 15,
		order = "1",
	},
	----- Metallurgy -----
	{
		name = "metallurgy-1",
		icon = DyDs_path_tech.."metallurgy.png",
		count = 100,
		prerequisites = {
			"automation-1",
		},
		ingredients = {
			{"iron-plate", 1},
			{"copper-plate", 1},
			{"tin-plate", 1},
			{"bronze-plate", 1},
			{"slag", 1},
		},
		time = 10,
		order = "1",
	},
	{
		name = "metallurgy-2",
		icon = DyDs_path_tech.."metallurgy.png",
		count = 25,
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			{"copper-plate", 50},
			{"tin-plate", 25},
			{"slag", 10},
		},
		time = 20,
		order = "1",
	},
	{
		name = "metallurgy-3",
		icon = DyDs_path_tech.."metallurgy.png",
		count = 50,
		prerequisites = {
			"metallurgy-2",
		},
		ingredients = {
			{"bronze-plate", 100},
			{"slag", 100},
		},
		time = 30,
		order = "1",
	},
	----- Storage And Filters -----
	{
		name = "storage-1",
		icon = DyDs_path_tech.."storage.png",
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
		time = 10,
		order = "1",
	},
	{
		name = "storage-2",
		icon = DyDs_path_tech.."storage.png",
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
		time = 20,
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
		time = 10,
		order = "1",
	},
	----- Seperate Unlocks -----
	{
		name = "slag-processing",
		icon = DyDs_path_tech.."slag.png",
		count = 10,
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			{"slag", 500},
		},
		time = 30,
		order = "1",
	},
	{
		name = "basic-asteroid-mining",
		icon = DyDs_path_tech.."asteroid.png",
		count = 100,
		prerequisites = {
			"storage-2",
			"automation-3",
			"metallurgy-3",
			"advanced-copper-processing",
			"advanced-iron-processing",
			"space-mining",
			"gasoline",
		},
		ingredients = {
			{"iron-plate", 40},
			{"steel-plate", 60},
			{"copper-plate", 87},
			{"tin-plate", 13},
			{"bronze-plate", 100},
		},
		time = 60,
		order = "1",
	},
}

for k,v in pairs(Metal_Techs) do
	DyWorld_Tech_Add(v)
end