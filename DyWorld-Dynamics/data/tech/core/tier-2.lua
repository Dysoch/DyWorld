

local Chemical_Techs = {
	----- Core Techs -----
	{
		name = "fluids-1",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		flags = {Act_2 = true},
		prerequisites = {
			"automatica-1",
			"filters-1",
			"intermediates-1",
		},
		ingredients = {
			Dy_Chemical_Tech_Pack("empty", 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "2",
	},
	{
		name = "fluids-2",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		flags = {Act_2 = true},
		prerequisites = {
			"fluids-1",
		},
		ingredients = {
			Dy_Chemical_Tech_Pack("oxygen", 150),
			Dy_Chemical_Tech_Pack("hydrogen", 150),
		},
		time = Dy_Tech_Time_Calc(10),
		order = "2",
	},
	{
		name = "fluids-3",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		flags = {Act_2 = true},
		prerequisites = {
			"fluids-2",
			"oil-processing",
		},
		ingredients = {
			Dy_Chemical_Tech_Pack("oxygen", 300),
			Dy_Chemical_Tech_Pack("nitrogen", 300),
			Dy_Chemical_Tech_Pack("hydrogen", 300),
		},
		time = Dy_Tech_Time_Calc(25),
		order = "2",
	},
	{
		name = "space-mining",
		icon = DyDs_path_tech_base.."rocket-silo.png",
		flags = {Act_2 = true},
		prerequisites = {
			"fluids-3",
			"metallurgy-2",
			"power-2",
			"titanium-processing",
			"aluminium-processing",
		},
		ingredients = {
			Dy_Chemical_Tech_Pack("oxygen", 750),
			Dy_Chemical_Tech_Pack("nitrogen", 750),
			Dy_Chemical_Tech_Pack("water", 1500),
			Dy_Chemical_Tech_Pack("hydrogen", 750),
		},
		time = Dy_Tech_Time_Calc(15),
		order = "2",
	},
	----- Extraction -----
	{
		name = "gas-extraction",
		icon = DyDs_path_tech_base.."oil-gathering.png",
		flags = {Act_2 = true},
		prerequisites = {
			"fluids-1",
		},
		ingredients = {
			Dy_Chemical_Tech_Pack("water", 250),
			Dy_Chemical_Tech_Pack("hydrogen", 50),
		},
		time = Dy_Tech_Time_Calc(12),
		order = "2",
	},
	{
		name = "oil-extraction",
		icon = DyDs_path_tech_base.."oil-gathering.png",
		flags = {Act_2 = true},
		prerequisites = {
			"fluids-1",
		},
		ingredients = {
			Dy_Chemical_Tech_Pack("water", 150),
			Dy_Chemical_Tech_Pack("hydrogen", 75),
		},
		time = Dy_Tech_Time_Calc(15),
		order = "2",
	},
	----- Power -----
	{
		name = "gas-power",
		icon = DyDs_path_tech_base.."electric-engine.png",
		flags = {Act_2 = true},
		prerequisites = {
			"gas-extraction",
			"power-2",
		},
		ingredients = {
			Dy_Chemical_Tech_Pack("natural-gas", 250),
		},
		time = Dy_Tech_Time_Calc(25),
		order = "2",
	},
	----- Oil -----
	{
		name = "oil-processing",
		icon = DyDs_path_tech_base.."oil-processing.png",
		flags = {Act_2 = true},
		prerequisites = {
			"oil-extraction",
			"fluids-2",
		},
		ingredients = {
			Dy_Chemical_Tech_Pack("water", 500),
			Dy_Chemical_Tech_Pack("crude-oil", 250),
		},
		time = Dy_Tech_Time_Calc(15),
		order = "2",
	},
	{
		name = "oil-processing-2",
		icon = DyDs_path_tech_base.."oil-processing.png",
		flags = {Act_2 = true},
		prerequisites = {
			"oil-processing",
		},
		ingredients = {
			Dy_Chemical_Tech_Pack("water", 1000),
			Dy_Chemical_Tech_Pack("crude-oil", 750),
		},
		time = Dy_Tech_Time_Calc(15),
		order = "2",
	},
}

for k,v in pairs(Chemical_Techs) do
	DyWorld_Tech_Add(v) 
end