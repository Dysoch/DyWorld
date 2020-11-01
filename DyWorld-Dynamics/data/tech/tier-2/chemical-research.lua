

local Chemical_Techs = {
	----- Core Techs -----
	{
		name = "fluids-1",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		count = 1,
		prerequisites = {
			"automation-2",
			"filters-1",
			"intermediates-1",
		},
		ingredients = {
			{"canister-empty", 15},
			{"canister-oxygen", 15},
		},
		time = 30,
		order = "2",
	},
	{
		name = "fluids-2",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		count = 1,
		prerequisites = {
			"fluids-1",
			"intermediates-2",
		},
		ingredients = {
			{"canister-oxygen", 75},
			{"canister-hydrogen", 75},
		},
		time = 30,
		order = "2",
	},
	{
		name = "fluids-3",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		count = 1,
		prerequisites = {
			"fluids-2",
			"intermediates-3",
		},
		ingredients = {
			{"canister-oxygen", 300},
			{"canister-nitrogen", 300},
			{"canister-hydrogen", 300},
		},
		time = 30,
		order = "2",
	},
	{
		name = "space-mining",
		icon = DyDs_path_tech_base.."rocket-silo.png",
		count = 1,
		prerequisites = {
			"fluids-3",
			"metallurgy-2",
			"power-2",
			"titanium-processing",
			"aluminium-processing",
		},
		ingredients = {
			{"canister-oxygen", 1000},
			{"canister-nitrogen", 1000},
			{"canister-water", 1000},
			{"canister-hydrogen", 1000},
		},
		time = 300,
		order = "2",
	},
	----- Extraction -----
	{
		name = "gas-extraction",
		icon = DyDs_path_tech_base.."oil-gathering.png",
		count = 1,
		prerequisites = {
			"fluids-1",
		},
		ingredients = {
			{"canister-water", 100},
			{"canister-hydrogen", 15},
		},
		time = 30,
		order = "2",
	},
	{
		name = "oil-extraction",
		icon = DyDs_path_tech_base.."oil-gathering.png",
		count = 1,
		prerequisites = {
			"fluids-2",
			"automation-3",
		},
		ingredients = {
			{"canister-water", 100},
			{"canister-hydrogen", 50},
		},
		time = 35,
		order = "2",
	},
	----- Power -----
	{
		name = "gas-power",
		icon = DyDs_path_tech_base.."electric-engine.png",
		count = 1,
		prerequisites = {
			"gas-extraction",
			"power-2",
		},
		ingredients = {
			{"canister-natural-gas", 250},
		},
		time = 30,
		order = "2",
	},
	{
		name = "turbines",
		icon = DyDs_path_tech_base.."electric-engine.png",
		count = 1,
		prerequisites = {
			"fluids-2",
			"power-2",
		},
		ingredients = {
			{"canister-empty", 50000},
		},
		time = 30,
		order = "2",
	},
	{
		name = "nuclear",
		icon = DyDs_path_tech_base.."nuclear-power.png",
		count = 1,
		prerequisites = {
			"fluids-3",
			"power-3",
			"turbines",
		},
		ingredients = {
			{"canister-empty", 50000},
		},
		time = 2.5,
		order = "2",
	},
	----- Oil -----
	{
		name = "oil-processing",
		icon = DyDs_path_tech_base.."oil-processing.png",
		count = 1,
		prerequisites = {
			"oil-extraction",
		},
		ingredients = {
			{"canister-water", 250},
			{"canister-crude-oil", 250},
		},
		time = 30,
		order = "2",
	},
	{
		name = "gasoline",
		icon = DyDs_path_tech_base.."oil-processing.png",
		count = 1,
		prerequisites = {
			"oil-processing",
			"fluids-3",
		},
		ingredients = {
			{"canister-crude-oil", 250},
			{"canister-heavy-oil", 125},
			{"canister-light-oil", 100},
		},
		time = 30,
		order = "2",
	},
}

for k,v in pairs(Chemical_Techs) do
	DyWorld_Tech_Add(v)
end