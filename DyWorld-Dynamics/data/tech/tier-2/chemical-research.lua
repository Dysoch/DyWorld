

local Chemical_Techs = {
	----- Core Techs -----
	{
		name = "fluids-1",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		count = 15,
		prerequisites = {
			"automation-2",
			"filters-1",
			"intermediates-1",
		},
		ingredients = {
			{"canister-empty", 1},
			{"canister-oxygen", 1},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "fluids-2",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		count = 15,
		prerequisites = {
			"fluids-1",
			"intermediates-2",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "fluids-3",
		icon = DyDs_path_tech_base.."fluid-handling.png",
		count = 15,
		prerequisites = {
			"fluids-2",
			"intermediates-3",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "space-mining",
		icon = DyDs_path_tech_base.."rocket-silo.png",
		count = 150,
		prerequisites = {
			"fluids-3",
			"metallurgy-2",
			"power-2",
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
		count = 15,
		prerequisites = {
			"fluids-1",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "oil-extraction",
		icon = DyDs_path_tech_base.."oil-gathering.png",
		count = 15,
		prerequisites = {
			"fluids-2",
			"automation-3",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	----- Power -----
	{
		name = "gas-power",
		icon = DyDs_path_tech_base.."electric-engine.png",
		count = 15,
		prerequisites = {
			"gas-extraction",
			"power-2",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "turbines",
		icon = DyDs_path_tech_base.."electric-engine.png",
		count = 15,
		prerequisites = {
			"fluids-2",
			"power-2",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "nuclear",
		icon = DyDs_path_tech_base.."nuclear-power.png",
		count = 15,
		prerequisites = {
			"fluids-3",
			"power-3",
			"turbines",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	----- Oil -----
	{
		name = "oil-processing",
		icon = DyDs_path_tech_base.."oil-processing.png",
		count = 15,
		prerequisites = {
			"oil-extraction",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "gasoline",
		icon = DyDs_path_tech_base.."oil-processing.png",
		count = 15,
		prerequisites = {
			"oil-processing",
			"fluids-3",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
}

for k,v in pairs(Chemical_Techs) do
	DyWorld_Tech_Add(v)
end