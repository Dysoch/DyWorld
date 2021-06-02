

local Chemical_Techs = {
	----- Core Techs -----
	{
		name = "fluids-1",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		flags = {Act_2 = true},
		count = 15,
		prerequisites = {
			"automatica-2",
			"filters-1",
			"intermediates-1",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 5,
		order = "2",
	},
	{
		name = "fluids-2",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		flags = {Act_2 = true},
		count = 75,
		prerequisites = {
			"fluids-1",
			"intermediates-2",
		},
		ingredients = {
			{"canister-oxygen", 1},
			{"canister-hydrogen", 1},
		},
		time = 10,
		order = "2",
	},
	{
		name = "fluids-3",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		flags = {Act_2 = true},
		count = 300,
		prerequisites = {
			"fluids-2",
			"intermediates-3",
		},
		ingredients = {
			{"canister-oxygen", 1},
			{"canister-nitrogen", 1},
			{"canister-hydrogen", 1},
		},
		time = 15,
		order = "2",
	},
	{
		name = "space-mining",
		icon = DyDs_path_tech_base.."rocket-silo.png",
		flags = {Act_2 = true},
		count = 1000,
		prerequisites = {
			"fluids-3",
			"metallurgy-2",
			"power-2",
			"titanium-processing",
			"aluminium-processing",
		},
		ingredients = {
			{"canister-oxygen", 1},
			{"canister-nitrogen", 1},
			{"canister-water", 1},
			{"canister-hydrogen", 1},
		},
		time = 10,
		order = "2",
	},
	----- Extraction -----
	{
		name = "gas-extraction",
		icon = DyDs_path_tech_base.."oil-gathering.png",
		flags = {Act_2 = true},
		count = 25,
		prerequisites = {
			"fluids-1",
		},
		ingredients = {
			{"canister-water", 8},
			{"canister-hydrogen", 1},
		},
		time = 8,
		order = "2",
	},
	{
		name = "oil-extraction",
		icon = DyDs_path_tech_base.."oil-gathering.png",
		flags = {Act_2 = true},
		count = 50,
		prerequisites = {
			"fluids-2",
			"automatica-3",
		},
		ingredients = {
			{"canister-water", 2},
			{"canister-hydrogen", 1},
		},
		time = 4,
		order = "2",
	},
	----- Power -----
	{
		name = "gas-power",
		icon = DyDs_path_tech_base.."electric-engine.png",
		flags = {Act_2 = true},
		count = 250,
		prerequisites = {
			"gas-extraction",
			"power-2",
		},
		ingredients = {
			{"canister-natural-gas", 1},
		},
		time = 5,
		order = "2",
	},
	{
		name = "turbines",
		icon = DyDs_path_tech_base.."electric-engine.png",
		flags = {Act_2 = true},
		count = 1,
		prerequisites = {
			"fluids-2",
			"power-2",
		},
		ingredients = {
			{"canister-empty", 50000},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "nuclear",
		icon = DyDs_path_tech_base.."nuclear-power.png",
		flags = {Act_2 = true},
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
		flags = {Act_2 = true},
		count = 250,
		prerequisites = {
			"oil-extraction",
		},
		ingredients = {
			{"canister-water", 1},
			{"canister-crude-oil", 1},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "gasoline",
		icon = DyDs_path_tech_base.."oil-processing.png",
		flags = {Act_2 = true},
		count = 100,
		prerequisites = {
			"oil-processing",
			"fluids-3",
		},
		ingredients = {
			{"canister-crude-oil", 3},
			{"canister-heavy-oil", 2},
			{"canister-light-oil", 1},
		},
		time = 3,
		order = "2",
	},
}

for k,v in pairs(Chemical_Techs) do
	DyWorld_Tech_Add(v)
end