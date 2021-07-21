

--[[
local Main_Techs = {
	{
		name = "dyson-network-4",
		icon = DyDs_path_tech.."asteroid.png",
		flags = {Act_3 = true},
		prerequisites = {
			"dyson-network-3",
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.2, 1000),
			Dy_Main_Tech_Pack(2.2, 1000),
			Dy_Main_Tech_Pack(3.2, 1000),
			Dy_Main_Tech_Pack(5.2, 1000),
			Dy_Main_Tech_Pack(6.2, 1000),
			Dy_Main_Tech_Pack(7.2, 1000),
		},
		time = Dy_Tech_Time_Calc(20, true),
		order = "4",
	},
}

for k,v in pairs(Main_Techs) do
	DyWorld_Tech_Add(v) 
end
]]

for i = 1,20 do
	DyWorld_Tech_Add({
		name = "dyson-efficiency-"..i,
		icon = DyDs_path_tech.."asteroid.png",
		flags = {Act_3 = true},
        effects = {
			{type = "nothing", effect_description = {"dyson-efficiency"}},
		},
		prerequisites = {
			i >= 2 and "dyson-efficiency-"..(i-1) or nil,
			i == 1 and "dyson-network-1" or nil,
			i == 6 and "dyson-network-2" or nil,
			i == 11 and "dyson-network-3" or nil,
			i == 16 and "dyson-network-4" or nil,
			i == 1 and "dy-science-pack-3" or nil,
			i == 1 and "dy-science-pack-5" or nil,
			i == 1 and "dy-science-pack-9" or nil,
			i == 2 and "dy-science-pack-11" or nil,
			i == 3 and "dy-science-pack-13" or nil,
			i == 10 and "dy-science-pack-2" or nil,
			i == 11 and "dy-science-pack-4" or nil,
			i == 12 and "dy-science-pack-6" or nil,
			i == 13 and "dy-science-pack-10" or nil,
			i == 14 and "dy-science-pack-12" or nil,
			i == 15 and "dy-science-pack-14" or nil,
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 200*i),
			Dy_Main_Tech_Pack(2.1, 200*i),
			Dy_Main_Tech_Pack(3.1, 200*i),
			Dy_Main_Tech_Pack(5.1, 200*i),
			i >= 2 and Dy_Main_Tech_Pack(6.1, 200*i) or nil,
			i >= 3 and Dy_Main_Tech_Pack(7.1, 200*i) or nil,
			i >= 10 and Dy_Main_Tech_Pack(1.2, 250*i) or nil,
			i >= 11 and Dy_Main_Tech_Pack(2.2, 250*i) or nil,
			i >= 12 and Dy_Main_Tech_Pack(3.2, 250*i) or nil,
			i >= 13 and Dy_Main_Tech_Pack(5.2, 250*i) or nil,
			i >= 14 and Dy_Main_Tech_Pack(6.2, 250*i) or nil,
			i >= 15 and Dy_Main_Tech_Pack(7.2, 250*i) or nil,
		},
		time = Dy_Tech_Time_Calc(i, true),
		order = "z",
	}) 
end
