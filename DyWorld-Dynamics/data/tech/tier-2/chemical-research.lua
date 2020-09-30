

local Chemical_Techs = {
	----- Core Techs -----
	{
		name = "fluids-1",
		count = 15,
		prerequisites = {
			"automation-2",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "fluids-2",
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
		name = "fluids-3",
		count = 15,
		prerequisites = {
			"fluids-2",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	{
		name = "space-mining",
		count = 15,
		prerequisites = {
			"fluids-3",
			"metallurgy-2",
			"power-2",
		},
		ingredients = {
			{"canister-empty", 1},
		},
		time = 2.5,
		order = "2",
	},
	----- Extraction -----
	{
		name = "gas-extraction",
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