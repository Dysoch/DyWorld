

for i = 1,50 do
	DyWorld_Tech_Add({
		name = "laser-turrets-single-damage-"..i,
		icon = DyDs_path_tech_base.."energy-weapons-damage.png",
		flags = {Act_3 = true},
		effects = {
			{
				type = "ammo-damage",
				ammo_category = "laser-single",
				modifier = 0.1
			},
		},
		prerequisites = {
			i == 1 and "laser-turrets-single-1" or nil,
			i == 6 and "laser-turrets-single-3" or nil,
			i == 11 and "laser-turrets-single-5" or nil,
			i == 16 and "laser-turrets-single-7" or nil,
			i == 21 and "laser-turrets-single-9" or nil,
			i >= 2 and "laser-turrets-single-damage-"..(i-1) or nil,
		},
		ingredients = {
			Dy_Main_Tech_Pack("mil-1", 1000*i),
			i >= 11 and Dy_Main_Tech_Pack("mil-2", 2000*i) or nil,
		},
		time = Dy_Tech_Time_Calc(i, true),
		order = "z",
	})
	DyWorld_Tech_Add({
		name = "laser-turrets-chain-damage-"..i,
		icon = DyDs_path_tech_base.."energy-weapons-damage.png",
		flags = {Act_3 = true},
		effects = {
			{
				type = "ammo-damage",
				ammo_category = "laser-chain",
				modifier = 0.1
			},
		},
		prerequisites = {
			i == 1 and "laser-turrets-chain-1" or nil,
			i == 6 and "laser-turrets-chain-3" or nil,
			i == 11 and "laser-turrets-chain-5" or nil,
			i == 16 and "laser-turrets-chain-7" or nil,
			i == 21 and "laser-turrets-chain-9" or nil,
			i >= 2 and "laser-turrets-chain-damage-"..(i-1) or nil,
		},
		ingredients = {
			Dy_Main_Tech_Pack("mil-1", 1000*i),
			i >= 11 and Dy_Main_Tech_Pack("mil-2", 2000*i) or nil,
		},
		time = Dy_Tech_Time_Calc(i, true),
		order = "z",
	})
	DyWorld_Tech_Add({
		name = "laser-turrets-shotgun-damage-"..i,
		icon = DyDs_path_tech_base.."energy-weapons-damage.png",
		flags = {Act_3 = true},
		effects = {
			{
				type = "ammo-damage",
				ammo_category = "laser-shotgun",
				modifier = 0.1
			},
		},
		prerequisites = {
			i == 1 and "laser-turrets-shotgun-1" or nil,
			i == 6 and "laser-turrets-shotgun-3" or nil,
			i == 11 and "laser-turrets-shotgun-5" or nil,
			i == 16 and "laser-turrets-shotgun-7" or nil,
			i == 21 and "laser-turrets-shotgun-9" or nil,
			i >= 2 and "laser-turrets-shotgun-damage-"..(i-1) or nil,
		},
		ingredients = {
			Dy_Main_Tech_Pack("mil-1", 1000*i),
			i >= 11 and Dy_Main_Tech_Pack("mil-2", 2000*i) or nil,
		},
		time = Dy_Tech_Time_Calc(i, true),
		order = "z",
	})
	DyWorld_Tech_Add({
		name = "laser-turrets-sniper-damage-"..i,
		icon = DyDs_path_tech_base.."energy-weapons-damage.png",
		flags = {Act_3 = true},
		effects = {
			{
				type = "ammo-damage",
				ammo_category = "laser-sniper",
				modifier = 0.1
			},
		},
		prerequisites = {
			i == 1 and "laser-turrets-sniper-1" or nil,
			i == 6 and "laser-turrets-sniper-3" or nil,
			i == 11 and "laser-turrets-sniper-5" or nil,
			i == 16 and "laser-turrets-sniper-7" or nil,
			i == 21 and "laser-turrets-sniper-9" or nil,
			i >= 2 and "laser-turrets-sniper-damage-"..(i-1) or nil,
		},
		ingredients = {
			Dy_Main_Tech_Pack("mil-1", 1000*i),
			i >= 11 and Dy_Main_Tech_Pack("mil-2", 2000*i) or nil,
		},
		time = Dy_Tech_Time_Calc(i, true),
		order = "z",
	})
	DyWorld_Tech_Add({
		name = "beam-turrets-low-damage-"..i,
		icon = DyDs_path_tech_base.."energy-weapons-damage.png",
		flags = {Act_3 = true},
		effects = {
			{
				type = "ammo-damage",
				ammo_category = "beam-low",
				modifier = 0.1
			},
		},
		prerequisites = {
			i == 1 and "beam-turrets-low-1" or nil,
			i == 6 and "beam-turrets-low-3" or nil,
			i == 11 and "beam-turrets-low-5" or nil,
			i == 16 and "beam-turrets-low-7" or nil,
			i == 21 and "beam-turrets-low-9" or nil,
			i >= 2 and "beam-turrets-low-damage-"..(i-1) or nil,
		},
		ingredients = {
			Dy_Main_Tech_Pack("mil-1", 1000*i),
			i >= 11 and Dy_Main_Tech_Pack("mil-2", 2000*i) or nil,
		},
		time = Dy_Tech_Time_Calc(i, true),
		order = "z",
	})
	DyWorld_Tech_Add({
		name = "beam-turrets-medium-damage-"..i,
		icon = DyDs_path_tech_base.."energy-weapons-damage.png",
		flags = {Act_3 = true},
		effects = {
			{
				type = "ammo-damage",
				ammo_category = "beam-medium",
				modifier = 0.1
			},
		},
		prerequisites = {
			i == 1 and "beam-turrets-medium-1" or nil,
			i == 6 and "beam-turrets-medium-3" or nil,
			i == 11 and "beam-turrets-medium-5" or nil,
			i == 16 and "beam-turrets-medium-7" or nil,
			i == 21 and "beam-turrets-medium-9" or nil,
			i >= 2 and "beam-turrets-medium-damage-"..(i-1) or nil,
		},
		ingredients = {
			Dy_Main_Tech_Pack("mil-1", 1000*i),
			i >= 11 and Dy_Main_Tech_Pack("mil-2", 2000*i) or nil,
		},
		time = Dy_Tech_Time_Calc(i, true),
		order = "z",
	})
	DyWorld_Tech_Add({
		name = "beam-turrets-high-damage-"..i,
		icon = DyDs_path_tech_base.."energy-weapons-damage.png",
		flags = {Act_3 = true},
		effects = {
			{
				type = "ammo-damage",
				ammo_category = "beam-high",
				modifier = 0.1
			},
		},
		prerequisites = {
			i == 1 and "beam-turrets-high-1" or nil,
			i == 6 and "beam-turrets-high-3" or nil,
			i == 11 and "beam-turrets-high-5" or nil,
			i == 16 and "beam-turrets-high-7" or nil,
			i == 21 and "beam-turrets-high-9" or nil,
			i >= 2 and "beam-turrets-high-damage-"..(i-1) or nil,
		},
		ingredients = {
			Dy_Main_Tech_Pack("mil-1", 1000*i),
			i >= 11 and Dy_Main_Tech_Pack("mil-2", 2000*i) or nil,
		},
		time = Dy_Tech_Time_Calc(i, true),
		order = "z",
	})
end
