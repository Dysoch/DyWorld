
local ores = {
	"iron", "copper", "tin", "titanium", "magnesium", "aluminium", "gold", "silver", "lead", "uranium"
}
for k,v in pairs(ores) do
	for i = 1,100 do
	DyWorld_Tech_Add({
		name = "space-mining-efficiency-"..v.."-"..i,
		icon = DyDs_path_tech.."asteroid.png",
		localised_name = {"looped-name.space-mining-efficiency", {"looped-name."..v}},
		flags = {Act_3 = true},
        effects = {
			{type = "nothing", effect_description = {"mining-increase", {"looped-name."..v}}},
		},
		prerequisites = {
			i >= 2 and "space-mining-efficiency-"..v.."-"..(i-1) or nil,
			i == 1 and "advanced-asteroid-mining" or nil,
			i == 5 and "dy-science-pack-11" or nil,
			i == 10 and "dy-science-pack-13" or nil,
			i == 20 and "dy-science-pack-2" or nil,
			i == 22 and "dy-science-pack-4" or nil,
			i == 24 and "dy-science-pack-6" or nil,
			i == 26 and "dy-science-pack-10" or nil,
			i == 28 and "dy-science-pack-12" or nil,
			i == 30 and "dy-science-pack-14" or nil,
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 200*i),
			Dy_Main_Tech_Pack(2.1, 200*i),
			Dy_Main_Tech_Pack(3.1, 200*i),
			Dy_Main_Tech_Pack(5.1, 200*i),
			i >= 5 and Dy_Main_Tech_Pack(6.1, 200*i) or nil,
			i >= 10 and Dy_Main_Tech_Pack(7.1, 200*i) or nil,
			i >= 20 and Dy_Main_Tech_Pack(1.2, 250*i) or nil,
			i >= 22 and Dy_Main_Tech_Pack(2.2, 250*i) or nil,
			i >= 24 and Dy_Main_Tech_Pack(3.2, 250*i) or nil,
			i >= 26 and Dy_Main_Tech_Pack(5.2, 250*i) or nil,
			i >= 28 and Dy_Main_Tech_Pack(6.2, 250*i) or nil,
			i >= 30 and Dy_Main_Tech_Pack(7.2, 250*i) or nil,
		},
		time = Dy_Tech_Time_Calc(i*15),
		order = "z",
	}) 
	end
	for i = 1,20 do
	DyWorld_Tech_Add({
		name = "space-mining-storage-"..v.."-"..i,
		icon = DyDs_path_tech.."asteroid.png",
		localised_name = {"looped-name.space-mining-storage", {"looped-name."..v}},
		flags = {Act_3 = true},
        effects = {
			{type = "nothing", effect_description = {"mining-storage-"..i, {"looped-name."..v}}},
		},
		prerequisites = {
			i >= 2 and "space-mining-storage-"..v.."-"..(i-1) or nil,
			i == 1 and "advanced-asteroid-mining" or nil,
			i == 3 and "dy-science-pack-11" or nil,
			i == 7 and "dy-science-pack-13" or nil,
			i == 9 and "dy-science-pack-2" or nil,
			i == 11 and "dy-science-pack-4" or nil,
			i == 13 and "dy-science-pack-6" or nil,
			i == 15 and "dy-science-pack-10" or nil,
			i == 17 and "dy-science-pack-12" or nil,
			i == 19 and "dy-science-pack-14" or nil,
		},
		ingredients = {
			Dy_Main_Tech_Pack(1.1, 400*i),
			Dy_Main_Tech_Pack(2.1, 400*i),
			Dy_Main_Tech_Pack(3.1, 400*i),
			Dy_Main_Tech_Pack(5.1, 400*i),
			i >= 3 and Dy_Main_Tech_Pack(6.1, 400*i) or nil,
			i >= 7 and Dy_Main_Tech_Pack(7.1, 400*i) or nil,
			i >= 9 and Dy_Main_Tech_Pack(1.2, 500*i) or nil,
			i >= 11 and Dy_Main_Tech_Pack(2.2, 500*i) or nil,
			i >= 13 and Dy_Main_Tech_Pack(3.2, 500*i) or nil,
			i >= 15 and Dy_Main_Tech_Pack(5.2, 500*i) or nil,
			i >= 17 and Dy_Main_Tech_Pack(6.2, 500*i) or nil,
			i >= 19 and Dy_Main_Tech_Pack(7.2, 500*i) or nil,
		},
		time = Dy_Tech_Time_Calc(i*30),
		order = "z",
	}) 
	end
end
