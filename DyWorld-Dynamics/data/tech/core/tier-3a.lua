

local Biological_Techs = {
	----- Core Techs -----
	{
		name = "bio-centrifuge",
		icon = DyDs_path_tech.."bio.png",
		flags = {Act_3 = true},
		prerequisites = {
			"automatica-1",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("wood", 1500),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "3",
	},
	----- Agro -----
	{
		name = "agroforestry",
		icon = DyDs_path_tech.."agroforestry.png",
		flags = {Act_3 = true},
		prerequisites = {
			"bio-centrifuge",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("wood", 4500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "3",
	},
	{
		name = "agroforestry-sulfur",
		icon = DyDs_path_tech.."agroforestry.png",
		flags = {Act_3 = true},
		prerequisites = {
			"agroforestry",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("wood", 3500),
		},
		time = Dy_Tech_Time_Calc(45),
		order = "3",
	},
	{
		name = "agroforestry-oak",
		icon = DyDs_path_tech.."agroforestry.png",
		flags = {Act_3 = true},
		prerequisites = {
			"agroforestry",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("wood", 2500),
		},
		time = Dy_Tech_Time_Calc(45),
		order = "3",
	},
	{
		name = "agroforestry-dead",
		icon = DyDs_path_tech.."agroforestry.png",
		flags = {Act_3 = true},
		prerequisites = {
			"agroforestry-oak",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("wood", 5000),
			Dy_Bio_Tech_Pack("chitin", 350),
		},
		time = Dy_Tech_Time_Calc(45),
		order = "3",
	},
	{
		name = "agriculture",
		icon = DyDs_path_tech.."agriculture.png",
		flags = {Act_3 = true},
		prerequisites = {
			"bio-centrifuge",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("wood", 5000),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "agriculture-herbs-1",
		icon = DyDs_path_tech.."agriculture.png",
		flags = {Act_3 = true},
		prerequisites = {
			"agriculture",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("soil", 5000),
			Dy_Bio_Tech_Pack("chitin", 350),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "agriculture-herbs-2",
		icon = DyDs_path_tech.."agriculture.png",
		flags = {Act_3 = true},
		prerequisites = {
			"agriculture-herbs-1",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("soil", 5000),
			Dy_Bio_Tech_Pack("chitin", 350),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	{
		name = "agriculture-food",
		icon = DyDs_path_tech.."agriculture.png",
		flags = {Act_3 = true},
		prerequisites = {
			"agriculture",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("soil", 5000),
			Dy_Bio_Tech_Pack("chitin", 350),
		},
		time = Dy_Tech_Time_Calc(5),
		order = "3",
	},
	-- Main Implantation -- 
	{
		name = "implants-1",
		icon = DyDs_path_tech_base.."radar.png",
		flags = {Act_3 = true},
		prerequisites = {
			"genetics-1",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("exotic", 500),
			Dy_Bio_Tech_Pack("dna-myriapod", 1000),
			Dy_Bio_Tech_Pack("dna-arachnid", 1000),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "implants-2",
		icon = DyDs_path_tech_base.."radar.png",
		flags = {Act_3 = true},
        effects = {
			{type = "nothing", effect_description = {"implants-2"}},
		},
		prerequisites = {
			"implants-1",
			"genetics-2",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("exotic", 2500),
			Dy_Bio_Tech_Pack("dna-myriapod", 3000),
			Dy_Bio_Tech_Pack("dna-arachnid", 3000),
		},
		time = Dy_Tech_Time_Calc(45),
		order = "4",
	},
	----- Natives -----
	{
		name = "natives",
		flags = {Act_3 = true},
		prerequisites = {
			"bio-centrifuge",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("chitin", 350),
			Dy_Bio_Tech_Pack("blood-bottle", 350),
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
			Dy_Bio_Tech_Pack("chitin", 500),
			Dy_Bio_Tech_Pack("blood-bottle", 500),
			Dy_Bio_Tech_Pack("dna-arachnid", 500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "3",
	},
	{
		name = "arachnid-2",
		flags = {Act_3 = true},
		prerequisites = {
			"arachnid-1",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("chitin", 500),
			Dy_Bio_Tech_Pack("blood-bottle", 500),
			Dy_Bio_Tech_Pack("dna-arachnid", 1500),
		},
		time = Dy_Tech_Time_Calc(60),
		order = "3",
	},
	{
		name = "arachnid-3",
		flags = {Act_3 = true},
		prerequisites = {
			"arachnid-2",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("chitin", 500),
			Dy_Bio_Tech_Pack("blood-bottle", 500),
			Dy_Bio_Tech_Pack("dna-arachnid", 4500),
		},
		time = Dy_Tech_Time_Calc(90),
		order = "3",
	},
	{
		name = "arachnid-4",
		flags = {Act_3 = true},
		prerequisites = {
			"arachnid-3",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("chitin", 500),
			Dy_Bio_Tech_Pack("blood-bottle", 500),
			Dy_Bio_Tech_Pack("dna-arachnid", 15000),
		},
		time = Dy_Tech_Time_Calc(120),
		order = "3",
	},
	{
		name = "arachnid-5",
		flags = {Act_3 = true},
		prerequisites = {
			"arachnid-4",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("chitin", 500),
			Dy_Bio_Tech_Pack("blood-bottle", 500),
			Dy_Bio_Tech_Pack("dna-arachnid", 45000),
		},
		time = Dy_Tech_Time_Calc(150),
		order = "3",
	},
	{
		name = "myriapod-1",
		flags = {Act_3 = true},
		prerequisites = {
			"natives",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("chitin", 500),
			Dy_Bio_Tech_Pack("blood-bottle", 500),
			Dy_Bio_Tech_Pack("dna-myriapod", 500),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "3",
	},
	{
		name = "myriapod-2",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-1",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("chitin", 500),
			Dy_Bio_Tech_Pack("blood-bottle", 500),
			Dy_Bio_Tech_Pack("dna-myriapod", 1500),
		},
		time = Dy_Tech_Time_Calc(60),
		order = "3",
	},
	{
		name = "myriapod-3",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-2",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("chitin", 500),
			Dy_Bio_Tech_Pack("blood-bottle", 500),
			Dy_Bio_Tech_Pack("dna-myriapod", 4500),
		},
		time = Dy_Tech_Time_Calc(90),
		order = "3",
	},
	{
		name = "myriapod-4",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-3",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("chitin", 500),
			Dy_Bio_Tech_Pack("blood-bottle", 500),
			Dy_Bio_Tech_Pack("dna-myriapod", 15000),
		},
		time = Dy_Tech_Time_Calc(120),
		order = "3",
	},
	{
		name = "myriapod-5",
		flags = {Act_3 = true},
		prerequisites = {
			"myriapod-4",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("chitin", 500),
			Dy_Bio_Tech_Pack("blood-bottle", 500),
			Dy_Bio_Tech_Pack("dna-myriapod", 45000),
		},
		time = Dy_Tech_Time_Calc(150),
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
			Dy_Bio_Tech_Pack("exotic", 500),
			Dy_Bio_Tech_Pack("dna-myriapod", 1000),
			Dy_Bio_Tech_Pack("dna-arachnid", 1000),
		},
		time = Dy_Tech_Time_Calc(60),
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
			Dy_Bio_Tech_Pack("exotic", 2500),
			Dy_Bio_Tech_Pack("dna-myriapod", 3000),
			Dy_Bio_Tech_Pack("dna-arachnid", 3000),
		},
		time = Dy_Tech_Time_Calc(120),
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
			Dy_Bio_Tech_Pack("exotic", 5000),
			Dy_Bio_Tech_Pack("dna-myriapod", 9000),
			Dy_Bio_Tech_Pack("dna-arachnid", 9000),
		},
		time = Dy_Tech_Time_Calc(180),
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
			Dy_Bio_Tech_Pack("exotic", 7500),
			Dy_Bio_Tech_Pack("dna-myriapod", 15000),
			Dy_Bio_Tech_Pack("dna-arachnid", 15000),
		},
		time = Dy_Tech_Time_Calc(240),
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
			Dy_Bio_Tech_Pack("exotic", 10000),
			Dy_Bio_Tech_Pack("dna-myriapod", 30000),
			Dy_Bio_Tech_Pack("dna-arachnid", 30000),
		},
		time = Dy_Tech_Time_Calc(300),
		order = "3",
	},
	---- Misc 1 -----
	{
		name = "bio-waste",
		icon = DyDs_path_tech.."bio-waste.png",
		flags = {Act_3 = true},
		prerequisites = {
			"agriculture-herbs-2",
			"agroforestry-dead",
			"agroforestry-sulfur",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("wood", 5000),
			Dy_Bio_Tech_Pack("soil", 5000),
		},
		time = Dy_Tech_Time_Calc(45),
		order = "3",
	},
	{
		name = "salinization",
		icon = DyDs_path_tech.."salt.png",
		flags = {Act_3 = true},
		prerequisites = {
			"bio-waste",
			"agroforestry-dead",
		},
		ingredients = {
			Dy_Bio_Tech_Pack("wood", 5000),
			Dy_Bio_Tech_Pack("soil", 5000),
		},
		time = Dy_Tech_Time_Calc(60),
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
			Dy_Bio_Tech_Pack("wood", 50),
		},
		time = Dy_Tech_Time_Calc(15),
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
			Dy_Bio_Tech_Pack("soil", 500),
		},
		time = Dy_Tech_Time_Calc(30),
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
			Dy_Bio_Tech_Pack("soil", 750),
		},
		time = Dy_Tech_Time_Calc(30),
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
			Dy_Bio_Tech_Pack("fish-salmon", 100),
			Dy_Bio_Tech_Pack("fish-pike", 100),
		},
		time = Dy_Tech_Time_Calc(60),
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
			Dy_Bio_Tech_Pack("acidic-residue", 1000),
			Dy_Bio_Tech_Pack("wood", 5000),
			Dy_Bio_Tech_Pack("soil", 5000),
			Dy_Bio_Tech_Pack("exotic", 100),
		},
		time = Dy_Tech_Time_Calc(45),
		order = "3",
	},
}

for k,v in pairs(Biological_Techs) do
	DyWorld_Tech_Add(v) 
end