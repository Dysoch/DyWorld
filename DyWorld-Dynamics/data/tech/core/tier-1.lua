

local Metal_Techs = {
	{
		name = "copper-processing",
		icon = DyDs_path_tech.."copper.png",
		flags = {Act_2 = true},
		ingredients = {
			Dy_Metal_Tech_Pack("copper-1", 375),
			Dy_Metal_Tech_Pack("copper-3", 15),
		},
		time = Dy_Tech_Time_Calc(3),
		order = "1",
	},
	{
		name = "iron-processing",
		icon = DyDs_path_tech.."iron.png",
		flags = {Act_2 = true},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-1", 450),
			Dy_Metal_Tech_Pack("iron-3", 25),
		},
		time = Dy_Tech_Time_Calc(4),
		order = "1",
	},
	{
		name = "tin-processing",
		icon = DyDs_path_tech.."tin.png",
		flags = {Act_2 = true},
		ingredients = {
			Dy_Metal_Tech_Pack("tin-1", 300),
			Dy_Metal_Tech_Pack("tin-3", 10),
		},
		time = Dy_Tech_Time_Calc(2),
		order = "1",
	},
	{
		name = "bronze-processing",
		icon = DyDs_path_tech.."bronze.png",
		flags = {Act_2 = true},
		prerequisites = {
			"tin-processing",
			"iron-processing",
			"copper-processing",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 250),
			Dy_Metal_Tech_Pack("copper-3", 350),
			Dy_Metal_Tech_Pack("tin-3", 500),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "1",
	},
	{
		name = "advanced-copper-processing",
		icon = DyDs_path_tech.."copper.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("copper-2", 750),
			Dy_Metal_Tech_Pack("copper-3", 500),
		},
		time = Dy_Tech_Time_Calc(10),
		order = "1",
	},
	{
		name = "advanced-iron-processing",
		icon = DyDs_path_tech.."iron.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-2",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-2", 900),
			Dy_Metal_Tech_Pack("iron-3", 600),
			Dy_Metal_Tech_Pack("limestone", 1000),
		},
		time = Dy_Tech_Time_Calc(10),
		order = "1",
	},
	{
		name = "advanced-tin-processing",
		icon = DyDs_path_tech.."tin.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("tin-2", 1000),
			Dy_Metal_Tech_Pack("tin-3", 750),
		},
		time = Dy_Tech_Time_Calc(10),
		order = "1",
	},
	{
		name = "advanced-bronze-processing",
		icon = DyDs_path_tech.."bronze.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-2",
			"advanced-copper-processing",
			"advanced-tin-processing",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("bronze", 2000),
		},
		time = Dy_Tech_Time_Calc(15),
		order = "1",
	},
	{
		name = "steel-processing",
		icon = DyDs_path_tech_base.."steel-processing.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-2",
			"advanced-iron-processing",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("limestone", 250),
			Dy_Metal_Tech_Pack("coal", 200),
			Dy_Metal_Tech_Pack("iron-3", 300),
		},
		time = Dy_Tech_Time_Calc(18),
		order = "1",
	},
	{
		name = "titanium-processing",
		icon = DyDs_path_tech.."titanium.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-3",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("limestone", 350),
			Dy_Metal_Tech_Pack("coal", 400),
			Dy_Metal_Tech_Pack("iron-3", 500),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "1",
	},
	{
		name = "aluminium-processing",
		icon = DyDs_path_tech.."aluminium.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-3",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("limestone", 750),
			Dy_Metal_Tech_Pack("coal", 100),
			Dy_Metal_Tech_Pack("iron-3", 350),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "1",
	},
	{
		name = "magnesium-processing",
		icon = DyDs_path_tech.."magnesium.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-3",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("limestone", 250),
			Dy_Metal_Tech_Pack("coal", 75),
			Dy_Metal_Tech_Pack("iron-3", 500),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "1",
	},
	{
		name = "advanced-steel-processing",
		icon = DyDs_path_tech_base.."steel-processing.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-3",
			"steel-processing",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("limestone", 1250),
			Dy_Metal_Tech_Pack("coal", 500),
			Dy_Metal_Tech_Pack("steel", 600),
		},
		time = 25,
		order = "1",
	},
	----- Automation -----
	{
		name = "automatica-1",
		icon = DyDs_path_tech_base.."automation-1.png",
		flags = {Act_2 = true},
		prerequisites = {
			"intermediates-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 150),
			Dy_Metal_Tech_Pack("copper-3", 50),
			Dy_Metal_Tech_Pack("tin-3", 300),
			Dy_Metal_Tech_Pack("bronze", 300),
		},
		time = Dy_Tech_Time_Calc(10),
		order = "1",
	},
	{
		name = "automatica-2",
		icon = DyDs_path_tech_base.."automation-1.png",
		flags = {Act_2 = true},
		prerequisites = {
			"intermediates-2",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 300),
			Dy_Metal_Tech_Pack("copper-3", 150),
			Dy_Metal_Tech_Pack("tin-3", 600),
			Dy_Metal_Tech_Pack("bronze", 700),
		},
		time = Dy_Tech_Time_Calc(15),
		order = "1",
	},
	{
		name = "automatica-3",
		icon = DyDs_path_tech_base.."automation-2.png",
		flags = {Act_2 = true},
		prerequisites = {
			"intermediates-3",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 750),
			Dy_Metal_Tech_Pack("copper-3", 450),
			Dy_Metal_Tech_Pack("tin-3", 1000),
			Dy_Metal_Tech_Pack("bronze", 1500),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "1",
	},
	----- Intermediates -----
	{
		name = "intermediates-1",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_2 = true},
		prerequisites = {
			"bronze-processing",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 125),
			Dy_Metal_Tech_Pack("copper-3", 125),
			Dy_Metal_Tech_Pack("tin-3", 125),
			Dy_Metal_Tech_Pack("bronze", 125),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "1",
	},
	{
		name = "intermediates-2",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_2 = true},
		prerequisites = {
			"filters-1",
			"storage-1",
			"power-1",
			"metallurgy-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 450),
			Dy_Metal_Tech_Pack("copper-3", 375),
			Dy_Metal_Tech_Pack("tin-3", 300),
			Dy_Metal_Tech_Pack("bronze", 250),
		},
		time = Dy_Tech_Time_Calc(10),
		order = "1",
	},
	{
		name = "intermediates-3",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_2 = true},
		prerequisites = {
			"storage-2",
			"power-2",
			"steel-processing",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 750),
			Dy_Metal_Tech_Pack("copper-3", 350),
			Dy_Metal_Tech_Pack("tin-3", 500),
			Dy_Metal_Tech_Pack("bronze", 750),
		},
		time = Dy_Tech_Time_Calc(15),
		order = "1",
	},
	----- Optics -----
	{
		name = "optics",
		icon = DyDs_path_tech_base.."optics.png",
		flags = {Act_2 = true},
		prerequisites = {
			"automatica-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 75),
			Dy_Metal_Tech_Pack("copper-3", 75),
			Dy_Metal_Tech_Pack("tin-3", 75),
			Dy_Metal_Tech_Pack("bronze", 75),
		},
		time = Dy_Tech_Time_Calc(10),
		order = "1",
	},
	----- Recycling -----
	{
		name = "recycling",
		icon = DyDs_path_tech_base.."radar.png",
		flags = {Act_2 = true},
		prerequisites = {
			"automatica-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 125),
			Dy_Metal_Tech_Pack("copper-3", 125),
			Dy_Metal_Tech_Pack("tin-3", 125),
			Dy_Metal_Tech_Pack("bronze", 125),
		},
		time = Dy_Tech_Time_Calc(10),
		order = "1",
	},
	----- Water Filtering -----
	{
		name = "water-filtering",
		flags = {Act_2 = true},
		prerequisites = {
			"automatica-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 350),
			Dy_Metal_Tech_Pack("copper-3", 250),
			Dy_Metal_Tech_Pack("tin-3", 150),
			Dy_Metal_Tech_Pack("bronze", 50),
		},
		time = Dy_Tech_Time_Calc(10),
		order = "1",
	},
	----- Logistics -----
	{
		name = "logistica-1",
		icon = DyDs_path_tech_base.."logistics-1.png",
		flags = {Act_2 = true},
		prerequisites = {
			"automatica-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 250),
			Dy_Metal_Tech_Pack("copper-3", 250),
			Dy_Metal_Tech_Pack("tin-3", 250),
			Dy_Metal_Tech_Pack("bronze", 1000),
		},
		time = Dy_Tech_Time_Calc(7),
		order = "1",
	},
	{
		name = "rails-1",
		icon = DyDs_path_tech_base.."railway.png",
		flags = {Act_2 = true},
		prerequisites = {
			"logistica-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 500),
			Dy_Metal_Tech_Pack("copper-3", 500),
			Dy_Metal_Tech_Pack("bronze", 500),
		},
		time = Dy_Tech_Time_Calc(14),
		order = "1",
	},
	{
		name = "rails-2",
		icon = DyDs_path_tech_base.."railway.png",
		flags = {Act_2 = true},
		prerequisites = {
			"rails-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 1000),
			Dy_Metal_Tech_Pack("copper-3", 1000),
			Dy_Metal_Tech_Pack("bronze", 1000),
		},
		time = Dy_Tech_Time_Calc(14),
		order = "1",
	},
	----- Power -----
	{
		name = "power-1",
		icon = DyDs_path_tech_base.."electric-energy-distribution-1.png",
		flags = {Act_2 = true},
		prerequisites = {
			"automatica-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("tin-3", 250),
			Dy_Metal_Tech_Pack("bronze", 100),
		},
		time = Dy_Tech_Time_Calc(8),
		order = "1",
	},
	{
		name = "power-2",
		icon = DyDs_path_tech_base.."electric-energy-distribution-1.png",
		flags = {Act_2 = true},
		prerequisites = {
			"power-1",
			"automatica-2",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("copper-3", 400),
			Dy_Metal_Tech_Pack("tin-3", 500),
			Dy_Metal_Tech_Pack("bronze", 250),
		},
		time = Dy_Tech_Time_Calc(16),
		order = "1",
	},
	{
		name = "power-3",
		icon = DyDs_path_tech_base.."electric-energy-distribution-1.png",
		flags = {Act_2 = true},
		prerequisites = {
			"power-2",
			"automatica-3",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 500),
			Dy_Metal_Tech_Pack("copper-3", 1000),
			Dy_Metal_Tech_Pack("tin-3", 750),
			Dy_Metal_Tech_Pack("bronze", 500),
		},
		time = Dy_Tech_Time_Calc(24),
		order = "1",
	},
	----- Warfare -----
	{
		name = "warfare-1",
		icon = DyDs_path_tech_base.."military.png",
		flags = {Act_2 = true},
		prerequisites = {
			"automatica-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("tin-3", 250),
		},
		time = Dy_Tech_Time_Calc(10),
		order = "1",
	},
	{
		name = "warfare-2",
		icon = DyDs_path_tech_base.."military.png",
		flags = {Act_2 = true},
		prerequisites = {
			"warfare-1",
			"automatica-2",
			"fluids-2",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 250),
			Dy_Metal_Tech_Pack("copper-3", 750),
			Dy_Metal_Tech_Pack("tin-3", 500),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "1",
	},
	{
		name = "warfare-3",
		icon = DyDs_path_tech_base.."military.png",
		flags = {Act_2 = true},
		prerequisites = {
			"automatica-3",
			"warfare-2",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 500),
			Dy_Metal_Tech_Pack("copper-3", 1500),
			Dy_Metal_Tech_Pack("tin-3", 750),
			Dy_Metal_Tech_Pack("bronze", 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "1",
	},
	----- Metallurgy -----
	{
		name = "metallurgy-1",
		icon = DyDs_path_tech.."metallurgy.png",
		flags = {Act_2 = true},
		prerequisites = {
			"automatica-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 100),
			Dy_Metal_Tech_Pack("copper-3", 100),
			Dy_Metal_Tech_Pack("tin-3", 100),
			Dy_Metal_Tech_Pack("bronze", 100),
			Dy_Metal_Tech_Pack("slag", 750),
		},
		time = Dy_Tech_Time_Calc(12),
		order = "1",
	},
	{
		name = "metallurgy-2",
		icon = DyDs_path_tech.."metallurgy.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("copper-3", 750),
			Dy_Metal_Tech_Pack("tin-3", 500),
			Dy_Metal_Tech_Pack("slag", 1500),
		},
		time = Dy_Tech_Time_Calc(24),
		order = "1",
	},
	{
		name = "metallurgy-3",
		icon = DyDs_path_tech.."metallurgy.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-2",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("bronze", 750),
			Dy_Metal_Tech_Pack("slag", 2500),
		},
		time = Dy_Tech_Time_Calc(36),
		order = "1",
	},
	----- Storage And Filters -----
	{
		name = "storage-1",
		icon = DyDs_path_tech.."storage.png",
		flags = {Act_2 = true},
		prerequisites = {
			"logistica-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 250),
			Dy_Metal_Tech_Pack("copper-3", 250),
			Dy_Metal_Tech_Pack("tin-3", 150),
			Dy_Metal_Tech_Pack("bronze", 50),
		},
		time = Dy_Tech_Time_Calc(13),
		order = "1",
	},
	{
		name = "storage-2",
		icon = DyDs_path_tech.."storage.png",
		flags = {Act_2 = true},
		prerequisites = {
			"storage-1",
			"automatica-2",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 350),
			Dy_Metal_Tech_Pack("copper-3", 350),
			Dy_Metal_Tech_Pack("tin-3", 225),
			Dy_Metal_Tech_Pack("bronze", 75),
		},
		time = Dy_Tech_Time_Calc(18),
		order = "1",
	},
	{
		name = "storage-3",
		icon = DyDs_path_tech.."storage.png",
		flags = {Act_2 = true},
		prerequisites = {
			"storage-2",
			"automatica-3",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 500),
			Dy_Metal_Tech_Pack("copper-3", 500),
			Dy_Metal_Tech_Pack("steel", 500),
		},
		time = Dy_Tech_Time_Calc(23),
		order = "1",
	},
	{
		name = "filters-1",
		flags = {Act_2 = true},
		prerequisites = {
			"logistica-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 500),
			Dy_Metal_Tech_Pack("copper-3", 450),
			Dy_Metal_Tech_Pack("tin-3", 350),
			Dy_Metal_Tech_Pack("bronze", 100),
		},
		time = Dy_Tech_Time_Calc(16),
		order = "1",
	},
	----- Seperate Unlocks -----
	{
		name = "slag-processing",
		icon = DyDs_path_tech.."slag.png",
		flags = {Act_2 = true},
		prerequisites = {
			"metallurgy-1",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("slag", 7500),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "1",
	},
	{
		name = "basic-asteroid-mining",
		icon = DyDs_path_tech.."asteroid.png",
		flags = {Act_2 = true},
		prerequisites = {
			"storage-2",
			"automatica-3",
			"metallurgy-3",
			"advanced-copper-processing",
			"advanced-iron-processing",
			"space-mining",
			"oil-processing-2",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("iron-3", 3000),
			Dy_Metal_Tech_Pack("copper-3", 2500),
			Dy_Metal_Tech_Pack("tin-3", 1500),
			Dy_Metal_Tech_Pack("steel", 5000),
			Dy_Metal_Tech_Pack("bronze", 3500),
		},
		time = Dy_Tech_Time_Calc(1, true),
		order = "1",
	},
}

for k,v in pairs(Metal_Techs) do
	DyWorld_Tech_Add(v)
end

data.raw.technology["basic-asteroid-mining"].effects = data.raw.technology["rocket-silo"].effects