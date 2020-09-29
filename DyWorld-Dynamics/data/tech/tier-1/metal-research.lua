

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
		order = "1-1-1",
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
		order = "1-1-1",
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
		order = "1-1-1",
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
		order = "1-2-1",
	},
}

for k,v in pairs(Metal_Techs) do
	DyWorld_Tech_Add(k)
end