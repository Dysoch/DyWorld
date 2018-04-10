function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

Enemies = {
	["cuspira"] = {
		Type = "spitter",
		Base_HP = 25,
		Unit_Amount = 10,
		Spawner = false,
		Resistances = {
			{type = "physical", decrease = 0, percent = 2.5},
			{type = "impact", decrease = 1, percent = 1, negative = true},
			{type = "poison", decrease = 5000, percent = 100, maxed = true},
			{type = "explosion", decrease = 2.5, percent = 1, negative = true},
			{type = "fire", decrease = 2, percent = 0.5},
			{type = "acid", decrease = 1.5, percent = 7.5},
		},
		Speed = 0.2,
		Attack_Range_Base = 5,
		Attack_DMG_Base = 10,
		Attack_DMG_Type = "poison",
		Attack_Speed_Base = 30,
		Pollution_to_Join_Attack_Base = 250,
		Tint_1 = {r=0.96, g=0.46, b=0.42, a=0.65},
		Tint_2 = {r=1, g=0.63, b=0, a=0.4},
	},
	["arachtoid"] = {
		Type = "biter",
		Base_HP = 15,
		Unit_Amount = 10,
		Spawner = false,
		Resistances = {
			{type = "physical", decrease = 0, percent = 0.5},
			{type = "impact", decrease = 1, percent = 1, negative = true},
			{type = "explosion", decrease = 2.5, percent = 1, negative = true},
			{type = "fire", decrease = 2, percent = 0.5},
			{type = "acid", decrease = 0, percent = 2.5},
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