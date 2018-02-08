function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

Enemies = {
	["cuspira"] = {
		Type = "spitter",
		Base_HP = 25,
		Spawner = false,
		Resistances = {
			{type = "physical", decrease = 0, percent = 2.5},
			{type = "impact", decrease = 0, percent = -10},
			{type = "poison", decrease = 5000, percent = 100},
			{type = "explosion", decrease = 0, percent = -10},
			{type = "fire", decrease = 0, percent = 5},
			{type = "laser", decrease = 0, percent = 0},
			{type = "acid", decrease = 25, percent = 75},
			{type = "electric", decrease = 0, percent = 0},
		},
		Speed = 0.2,
		Attack_Range_Base = 5,
		Attack_DMG_Base = 10,
		Attack_DMG_Type = "poison",
		Attack_Speed_Base = 30,
		Pollution_to_Join_Attack_Base = 250,
		Tint_1 = {r=0.56, g=0.46, b=0.42, a=0.65},
		Tint_2 = {r=1, g=0.63, b=0, a=0.4},
	},
	["arachtoid"] = {
		Type = "biter",
		Base_HP = 15,
		Spawner = false,
		Resistances = {
			{type = "physical", decrease = 0, percent = 5},
			{type = "impact", decrease = 0, percent = -10},
			{type = "poison", decrease = 0, percent = 0},
			{type = "explosion", decrease = 0, percent = -10},
			{type = "fire", decrease = 0, percent = 5},
			{type = "laser", decrease = 0, percent = 0},
			{type = "acid", decrease = 0, percent = 25},
			{type = "electric", decrease = 0, percent = 0},
		},
		Speed = 0.2,
		Attack_Range_Base = 1,
		Attack_DMG_Base = 5,
		Attack_DMG_Type = "physical",
		Attack_Speed_Base = 30,
		Pollution_to_Join_Attack_Base = 200,
		Tint_1 = {r=0.56, g=0.46, b=0.42, a=0.65},
		Tint_2 = {r=1, g=0.63, b=0, a=0.4},
	},
}