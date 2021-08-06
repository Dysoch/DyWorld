local Science_Table = {"automation", "logistic", "chemical", "military", "production", "utility", "biological"}

for k,v in pairs(Science_Table) do
    local Basic = {
		name = v.."-science-pack",
		flags = {Tech_Main = true},
		prerequisites = {
            v == "automation" and "basic-asteroid-mining" or nil,
            v == "logistic" and "automation-science-pack" or nil,
            v == "military" and "automation-science-pack" or nil,
            v == "chemical" and "logistic-science-pack" or nil,
            v == "biological" and "automation-science-pack" or nil,
            v == "biological" and "logistic-science-pack" or nil,
            v == "production" and "chemical-science-pack" or nil,
            v == "utility" and "production-science-pack" or nil,
        },
		ingredients = {
            v == "automation" and Dy_Metal_Tech_Pack("steel", 2500) or nil,
            v == "logistic" and Dy_Main_Tech_Pack(1.1, 2500) or nil,
            v == "military" and Dy_Main_Tech_Pack(1.1, 2500) or nil,
            v == "chemical" and Dy_Main_Tech_Pack(1.1, 2500) or nil,
            v == "chemical" and Dy_Main_Tech_Pack(2.1, 2500) or nil,
            v == "biological" and Dy_Main_Tech_Pack(1.1, 2500) or nil,
            v == "biological" and Dy_Main_Tech_Pack(2.1, 2500) or nil,
            v == "production" and Dy_Main_Tech_Pack(1.1, 2500) or nil,
            v == "production" and Dy_Main_Tech_Pack(2.1, 2500) or nil,
            v == "production" and Dy_Main_Tech_Pack(3.1, 2500) or nil,
            v == "utility" and Dy_Main_Tech_Pack(1.1, 2500) or nil,
            v == "utility" and Dy_Main_Tech_Pack(2.1, 2500) or nil,
            v == "utility" and Dy_Main_Tech_Pack(3.1, 2500) or nil,
            v == "utility" and Dy_Main_Tech_Pack(5.1, 2500) or nil,
        },
		time = Dy_Tech_Time_Calc(30),
		order = "999",
	}
    local Advanced = {
		name = v.."-science-pack-advanced",
		flags = {Tech_Main = true},
		prerequisites = {
			v.."-science-pack",
		},
		ingredients = {
            v == "automation" and Dy_Main_Tech_Pack(1.1, 2500) or nil,
            v == "logistic" and Dy_Main_Tech_Pack(1.2, 2500) or nil,
            v == "chemical" and Dy_Main_Tech_Pack(1.2, 2500) or nil,
            v == "chemical" and Dy_Main_Tech_Pack(2.2, 2500) or nil,
            v == "biological" and Dy_Main_Tech_Pack(1.2, 2500) or nil,
            v == "biological" and Dy_Main_Tech_Pack(2.2, 2500) or nil,
            v == "production" and Dy_Main_Tech_Pack(1.2, 2500) or nil,
            v == "production" and Dy_Main_Tech_Pack(2.2, 2500) or nil,
            v == "production" and Dy_Main_Tech_Pack(3.2, 2500) or nil,
            v == "utility" and Dy_Main_Tech_Pack(1.2, 2500) or nil,
            v == "utility" and Dy_Main_Tech_Pack(2.2, 2500) or nil,
            v == "utility" and Dy_Main_Tech_Pack(3.2, 2500) or nil,
            v == "utility" and Dy_Main_Tech_Pack(5.2, 2500) or nil,
            v == "military" and Dy_Main_Tech_Pack(1.2, 2500) or nil,
            v == "military" and Dy_Main_Tech_Pack(2.2, 2500) or nil,
            v == "military" and Dy_Main_Tech_Pack("mil-1", 2500) or nil,
        },
		time = Dy_Tech_Time_Calc(300),
		order = "999",
	}
    DyWorld_Tech_Add(Basic)
    DyWorld_Tech_Add(Advanced)
end