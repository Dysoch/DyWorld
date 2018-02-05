function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function Mass_Calc(TABLE)
	mass = 0
	for k,m in pairs(TABLE) do
		for h,b in pairs(Liquids) do
			if k == b.Name then
				mass = mass + ((b.Mass/100) * m)
			end
		end
		for j,n in pairs(Solids) do
			if k == n.Name then
				mass = mass + ((n.Mass/100) * m)
			end			
		end
	end
	return mass
end

Solids = {
	{ Name = "sulfur", Mass = 32.065 },
	{ Name = "carbon", Mass = 12.0107 },
	--{ Name = "silicon", Mass = 28.0855 },
	{ Name = "chromium-clean-ore", Mass = 51.9962 },
	{ Name = "iron-clean-ore", Mass = 55.845 },
	{ Name = "nickel-clean-ore", Mass = 58.6934 },
	{ Name = "copper-clean-ore", Mass = 63.546 },
	{ Name = "zinc-clean-ore", Mass = 65.38 },
	{ Name = "aluminium-clean-ore", Mass = 26.98153 },
	{ Name = "silver-clean-ore", Mass = 107.8682 },
	{ Name = "tin-clean-ore", Mass = 118.710 },
	{ Name = "tungsten-clean-ore", Mass = 183.84 },
	{ Name = "gold-clean-ore", Mass = 196.9665 },
	{ Name = "lead-clean-ore", Mass = 207.2 },
	{ Name = "uranium-clean-ore", Mass = 238.0289 },
}

Liquids = {
	{ Name = "hydrogen", Mass = 1.00794 },
	{ Name = "oxygen", Mass = 15.9994 },
}

-- Compounds ALWAYS have to be 100% total, NOT HIGHER AND LOWER!
Compound_Components = {
	Coal = {["sulfur"] = 3, ["oxygen"] = 17, ["hydrogen"] = 5, ["carbon"] = 75},
	--Silica = {["silicon"] = 33, ["oxygen"] = 67},
	--Alumina = {["aluminium-clean-ore"] = 40, ["oxygen"] = 60},
	--Ferrous_Oxide = {["iron-clean-ore"] = 50, ["oxygen"] = 50},
	--Diferrous_Trioxide = {["iron-clean-ore"] = 40, ["oxygen"] = 60},
	--Stone = {["silica"] = 78, ["alumina"] = 17, ["ferrous-oxide"] = 2, ["diferrous-trioxide"] = 3},
}

Compounds = {
	{ Name = "coal", Mass = Mass_Calc(Compound_Components.Coal) },
	--{ Name = "silica", Mass = Mass_Calc(Compound_Components.Silica) },
	--{ Name = "alumina", Mass = Mass_Calc(Compound_Components.Alumina) },
	--{ Name = "ferrous-oxide", Mass = Mass_Calc(Compound_Components.Ferrous_Oxide) },
	--{ Name = "diferrous-trioxide", Mass = Mass_Calc(Compound_Components.Diferrous_Trioxide) },
	--{ Name = "stone", Mass = Mass_Calc(Compound_Components.Stone) },
}