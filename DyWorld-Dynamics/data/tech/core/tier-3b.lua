

local Biological_Techs = {
	----- Automatica -----
	{
		name = "automatica-4",
		icon = DyDs_path_tech_base.."automation-2.png",
		flags = {Act_3 = true},
		prerequisites = {
			"intermediates-4",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "4",
	},
	{
		name = "automatica-5",
		icon = DyDs_path_tech_base.."automation-2.png",
		flags = {Act_3 = true},
		prerequisites = {
			"automatica-4",
			"intermediates-5",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "4",
	},
	{
		name = "automatica-6",
		icon = DyDs_path_tech_base.."automation-2.png",
		flags = {Act_3 = true},
		prerequisites = {
			"automatica-5",
			"intermediates-6",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "4",
	},
	{
		name = "automatica-7",
		icon = DyDs_path_tech_base.."automation-2.png",
		flags = {Act_3 = true},
		prerequisites = {
			"automatica-6",
			"intermediates-7",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "4",
	},
	{
		name = "automatica-8",
		icon = DyDs_path_tech_base.."automation-2.png",
		flags = {Act_3 = true},
		prerequisites = {
			"automatica-7",
			"intermediates-8",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "4",
	},
	{
		name = "automatica-9",
		icon = DyDs_path_tech_base.."automation-2.png",
		flags = {Act_3 = true},
		prerequisites = {
			"automatica-8",
			"intermediates-9",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "4",
	},
	{
		name = "automatica-10",
		icon = DyDs_path_tech_base.."automation-2.png",
		flags = {Act_3 = true},
		prerequisites = {
			"automatica-9",
			"intermediates-10",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "4",
	},
	{
		name = "automatica-11",
		icon = DyDs_path_tech_base.."automation-2.png",
		flags = {Act_3 = true},
		prerequisites = {
			"automatica-10",
			"intermediates-11",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "4",
	},
	{
		name = "automatica-12",
		icon = DyDs_path_tech_base.."automation-2.png",
		flags = {Act_3 = true},
		prerequisites = {
			"automatica-11",
			"intermediates-12",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
		},
		time = Dy_Tech_Time_Calc(20),
		order = "4",
	},
	----- Intermediates -----
	{
		name = "intermediates-4",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_3 = true},
		prerequisites = {
			"dy-science-pack-1",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "intermediates-5",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_3 = true},
		prerequisites = {
			"intermediates-4",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
			Dy_Main_Tech_Pack(2, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "intermediates-6",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_3 = true},
		prerequisites = {
			"intermediates-5",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
			Dy_Main_Tech_Pack(2, 250),
			Dy_Main_Tech_Pack(3, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "intermediates-7",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_3 = true},
		prerequisites = {
			"intermediates-6",
		},
		ingredients = {
			Dy_Main_Tech_Pack(4, 250),
			Dy_Main_Tech_Pack(5, 250),
			Dy_Main_Tech_Pack(6, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "intermediates-8",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_3 = true},
		prerequisites = {
			"intermediates-7",
		},
		ingredients = {
			Dy_Main_Tech_Pack(6, 250),
			Dy_Main_Tech_Pack(7, 250),
			Dy_Main_Tech_Pack(8, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "intermediates-9",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_3 = true},
		prerequisites = {
			"intermediates-8",
		},
		ingredients = {
			Dy_Main_Tech_Pack(8, 250),
			Dy_Main_Tech_Pack(9, 250),
			Dy_Main_Tech_Pack(10, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "intermediates-10",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_3 = true},
		prerequisites = {
			"intermediates-9",
		},
		ingredients = {
			Dy_Main_Tech_Pack(10, 250),
			Dy_Main_Tech_Pack(11, 250),
			Dy_Main_Tech_Pack(12, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "intermediates-11",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_3 = true},
		prerequisites = {
			"intermediates-10",
		},
		ingredients = {
			Dy_Main_Tech_Pack(12, 250),
			Dy_Main_Tech_Pack(13, 250),
			Dy_Main_Tech_Pack(14, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "intermediates-12",
		icon = DyDs_path_tech.."intermediates.png",
		flags = {Act_3 = true},
		prerequisites = {
			"intermediates-11",
		},
		ingredients = {
			Dy_Main_Tech_Pack(14, 250),
			Dy_Main_Tech_Pack(15, 250),
			Dy_Main_Tech_Pack(16, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	----- Logistica -----
	{
		name = "logistica-2",
		icon = DyDs_path_tech_base.."logistics-1.png",
		flags = {Act_3 = true},
		prerequisites = {
			"intermediates-4",
			"automatica-4",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1, 250),
			Dy_Main_Tech_Pack(2, 250),
			Dy_Main_Tech_Pack(3, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "logistica-3",
		icon = DyDs_path_tech_base.."logistics-1.png",
		flags = {Act_3 = true},
		prerequisites = {
			"logistica-2",
		},
		ingredients = {
			Dy_Main_Tech_Pack(2, 250),
			Dy_Main_Tech_Pack(3, 250),
			Dy_Main_Tech_Pack(4, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "logistica-4",
		icon = DyDs_path_tech_base.."logistics-1.png",
		flags = {Act_3 = true},
		prerequisites = {
			"logistica-3",
		},
		ingredients = {
			Dy_Main_Tech_Pack(3, 250),
			Dy_Main_Tech_Pack(4, 250),
			Dy_Main_Tech_Pack(5, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "logistica-5",
		icon = DyDs_path_tech_base.."logistics-1.png",
		flags = {Act_3 = true},
		prerequisites = {
			"logistica-4",
			"intermediates-5",
			"automatica-5",
		},
		ingredients = {
			Dy_Main_Tech_Pack(5, 250),
			Dy_Main_Tech_Pack(6, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "logistica-6",
		icon = DyDs_path_tech_base.."logistics-1.png",
		flags = {Act_3 = true},
		prerequisites = {
			"logistica-5",
			"intermediates-6",
			"automatica-6",
		},
		ingredients = {
			Dy_Main_Tech_Pack(8, 250),
			Dy_Main_Tech_Pack(9, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "logistica-7",
		icon = DyDs_path_tech_base.."logistics-1.png",
		flags = {Act_3 = true},
		prerequisites = {
			"logistica-6",
			"intermediates-7",
			"automatica-7",
		},
		ingredients = {
			Dy_Main_Tech_Pack(11, 250),
			Dy_Main_Tech_Pack(13, 250),
			Dy_Main_Tech_Pack(14, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "logistica-8",
		icon = DyDs_path_tech_base.."logistics-1.png",
		flags = {Act_3 = true},
		prerequisites = {
			"logistica-7",
			"intermediates-8",
			"automatica-8",
		},
		ingredients = {
			Dy_Main_Tech_Pack(15, 250),
			Dy_Main_Tech_Pack(16, 250),
			Dy_Main_Tech_Pack(17, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
	{
		name = "logistica-9",
		icon = DyDs_path_tech_base.."logistics-1.png",
		flags = {Act_3 = true},
		prerequisites = {
			"logistica-8",
			"intermediates-9",
			"automatica-9",
		},
		ingredients = {
			Dy_Main_Tech_Pack(18, 250),
			Dy_Main_Tech_Pack(19, 250),
			Dy_Main_Tech_Pack(20, 250),
		},
		time = Dy_Tech_Time_Calc(30),
		order = "4",
	},
}

for k,v in pairs(Biological_Techs) do
	DyWorld_Tech_Add(v) 
end