

local Science_Techs = {
	{
		name = "dy-science-pack-1",
		flags = {Act_3 = true},
		prerequisites = {
			"basic-asteroid-mining",
		},
		ingredients = {
			Dy_Metal_Tech_Pack("steel", 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-2",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-1",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-3",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-1",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-4",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-3",
		},
		ingredients = {
			Dy_Main_Tech_Pack(2.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-5",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-3",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 2500),
			Dy_Main_Tech_Pack(2.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-6",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-5",
		},
		ingredients = {
			Dy_Main_Tech_Pack(3.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-7",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-1",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-8",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-7",
		},
		ingredients = {
			Dy_Main_Tech_Pack("mil-2", 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-9",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-5",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 2500),
			Dy_Main_Tech_Pack(2.1, 2500),
			Dy_Main_Tech_Pack(3.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-10",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-9",
		},
		ingredients = {
			Dy_Main_Tech_Pack(5.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-11",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-9",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 2500),
			Dy_Main_Tech_Pack(2.1, 2500),
			Dy_Main_Tech_Pack(3.1, 2500),
			Dy_Main_Tech_Pack(5.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-12",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-11",
		},
		ingredients = {
			Dy_Main_Tech_Pack(6.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-13",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-11",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 2500),
			Dy_Main_Tech_Pack(2.1, 2500),
			Dy_Main_Tech_Pack(3.1, 2500),
			Dy_Main_Tech_Pack(5.1, 2500),
			Dy_Main_Tech_Pack(6.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-14",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-13",
		},
		ingredients = {
			Dy_Main_Tech_Pack(7.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-15",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-3",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 2500),
			Dy_Main_Tech_Pack(2.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
	{
		name = "dy-science-pack-16",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-15",
		},
		ingredients = {
			Dy_Main_Tech_Pack(4.1, 2500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	},
}

for k,v in pairs(Science_Techs) do
	DyWorld_Tech_Add(v)
end