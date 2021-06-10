

local Biological_Techs = {
	----- Core Techs -----
	{
		name = "bio-centrifuge",
		flags = {Act_3 = true},
		prerequisites = {
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	----- Agro -----
	{
		name = "agroforestry",
		flags = {Act_3 = true},
		prerequisites = {
			"bio-centrifuge",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "agroforestry-sulfur",
		flags = {Act_3 = true},
		prerequisites = {
			"agroforestry",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "agroforestry-oak",
		flags = {Act_3 = true},
		prerequisites = {
			"agroforestry",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "agroforestry-dead",
		flags = {Act_3 = true},
		prerequisites = {
			"agroforestry-oak",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "agriculture",
		flags = {Act_3 = true},
		prerequisites = {
			"bio-centrifuge",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "agriculture-herbs-1",
		flags = {Act_3 = true},
		prerequisites = {
			"agriculture",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "agriculture-herbs-2",
		flags = {Act_3 = true},
		prerequisites = {
			"agriculture-herbs-1",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "agriculture-food",
		flags = {Act_3 = true},
		prerequisites = {
			"agriculture",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	----- Natives -----
	{
		name = "natives",
		flags = {Act_3 = true},
		prerequisites = {
			"bio-centrifuge",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "arachnid-1",
		flags = {Act_3 = true},
		prerequisites = {
			"natives",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "arachnid-2",
		flags = {Act_3 = true},
		prerequisites = {
			"arachnid-1",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "arachnid-3",
		flags = {Act_3 = true},
		prerequisites = {
			"arachnid-2",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "arachnid-4",
		flags = {Act_3 = true},
		prerequisites = {
			"arachnid-3",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "arachnid-5",
		flags = {Act_3 = true},
		prerequisites = {
			"arachnid-4",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "myriapod-1",
		flags = {Act_3 = true},
		prerequisites = {
			"natives",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "myriapod-2",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-1",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "myriapod-3",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-2",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "myriapod-4",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-3",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "myriapod-5",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-4",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	----- Genetics -----
	{
		name = "genetics-1",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-1",
			"arachnid-1",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "genetics-2",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-2",
			"arachnid-2",
			"genetics-1",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "genetics-3",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-3",
			"arachnid-3",
			"genetics-2",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "genetics-4",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-4",
			"arachnid-4",
			"genetics-3",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "genetics-5",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-5",
			"arachnid-5",
			"genetics-4",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	---- Misc 1 -----
	{
		name = "bio-waste",
		flags = {Act_3 = true},
		prerequisites = {
			"agriculture-herbs-2",
			"agroforestry-dead",
			"agroforestry-sulfur",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "salinization",
		flags = {Act_3 = true},
		prerequisites = {
			"bio-waste",
			"agroforestry-dead",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	---- Fish -----
	{
		name = "piscis",
		flags = {Act_3 = true},
		icons = {{icon = DyDs_path_tech.."fish.png"}},
		prerequisites = {
			"natives",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "piscis-pike",
		icons = {{icon = DyDs_path_tech.."fish.png", tint = {112, 130, 56}}},
		flags = {Act_3 = true},
		prerequisites = {
			"piscis",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("fish-pike", 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "piscis-salmon",
		icons = {{icon = DyDs_path_tech.."fish.png", tint = {250, 128, 114}}},
		flags = {Act_3 = true},
		prerequisites = {
			"piscis",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("fish-salmon", 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "piscis-farm",
		icons = {{icon = DyDs_path_tech.."fish.png"}},
		flags = {Act_3 = true},
		prerequisites = {
			"piscis-salmon",
			"piscis-pike",
			"salinization",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("fish-salmon", 50),
			Dy_Bio_Tech_Pack("fish-pike", 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	---- Misc 2 -----
	{
		name = "acidification",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-1",
			"agroforestry-sulfur",
			"piscis-farm",
		},
		ingredients = {
			Dy_Bio_Tech_Pack(1, 50),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
}

for k,v in pairs(Biological_Techs) do
	DyWorld_Tech_Add(v) 
end