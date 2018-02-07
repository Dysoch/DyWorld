function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function Mass_Calc(NAME)
	Mass_1 = 0
	if Compounds[NAME].Elements then
		for k,m in pairs(Compounds[NAME].Elements) do
			Mass_1 = Mass_1 + Element_Calc(k, m)
		end
	end
	if Compounds[NAME].Compounds then
		for k,m in pairs(Compounds[NAME].Compounds) do
			Mass_1 = Mass_1 + Compound_Calc(k, m)
		end
	end
	Compounds[NAME].Mass = Mass_1
end

function Mass_Calc_2(NAME)
	Mass_4 = 0
	if Compounds[NAME].Elements then
		for k,m in pairs(Compounds[NAME].Elements) do
			Mass_4 = Mass_4 + Element_Calc(k, m)
		end
	end
	if Compounds[NAME].Compounds then
		for k,m in pairs(Compounds[NAME].Compounds) do
			Mass_4 = Mass_4 + Compound_Calc(k, m)
		end
	end
	return Mass_4
end

function Compound_Calc(COMPOUND, PERC)
	Mass_2 = 0
	for k,m in pairs(Compounds) do
		if COMPOUND == k then
			if m.Elements then
				for j,n in pairs(m.Elements) do
					Mass_2 = Mass_2 + Element_Calc(j, ((PERC/100)*n))
				end
			end
			if m.Compounds then
				Mass_2 = Mass_2 + ((Mass_Calc_2(k)/100) * PERC)
			end
		end
	end
	return Mass_2
end

function Element_Calc(ELEMENT, PERC)
	Mass_3 = 0
	for h,b in pairs(Liquids) do
		if ELEMENT == b.Name then
			Mass_3 = Mass_3 + ((b.Mass/100) * PERC)
		end
	end
	for h,b in pairs(Solids) do
		if ELEMENT == b.Name then
			Mass_3 = Mass_3 + ((b.Mass/100) * PERC)
		end			
	end
	return Mass_3
end

Solids = {
	{ Name = "sulfur", Mass = 32.065 },
	{ Name = "carbon", Mass = 12.0107 },
	{ Name = "silicon", Mass = 28.0855 },
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

-- Compounds containing Compounds need to be at the bottom for it work. If a compound it contains is below it, then it will fail. Make sure it is ordered
-- The type is used in the splicer recipe, make sure it is correct
Compounds = {
	["coal"] = {
		Mass = 0, 
		Type = "item",
		Elements = {["sulfur"] = 3, ["oxygen"] = 17, ["hydrogen"] = 5, ["carbon"] = 75},
	},
	["cellulose"] = {
		Mass = 0, 
		Type = "item",
		Elements = {["oxygen"] = 24, ["hydrogen"] = 48, ["carbon"] = 28},
	},
	["hemicellulose"] = {
		Mass = 0, 
		Type = "item",
		Elements = {["oxygen"] = 24, ["hydrogen"] = 47, ["carbon"] = 29},
	},
	["lignin"] = {
		Mass = 0, 
		Type = "item",
		Elements = {["oxygen"] = 19, ["hydrogen"] = 42, ["carbon"] = 39},
	},
	["silica"] = {
		Mass = 0, 
		Type = "item",
		Elements = {["silicon"] = 33, ["oxygen"] = 67},
	},
	["alumina"] = {
		Mass = 0, 
		Type = "item",
		Elements = {["aluminium-clean-ore"] = 40, ["oxygen"] = 60},
	},
	["ferrous-oxide"] = {
		Mass = 0, 
		Type = "item",
		Elements = {["iron-clean-ore"] = 50, ["oxygen"] = 50},
	},
	["diferrous-trioxide"] = {
		Mass = 0, 
		Type = "item",
		Elements = {["iron-clean-ore"] = 40, ["oxygen"] = 60},
	},
	["dyworld-water-clean"] = {
		Mass = 0, 
		Type = "fluid",
		Elements = {["oxygen"] = 67, ["hydrogen"] = 33},
	},
	["stone"] = {
		Mass = 0, 
		Type = "item",
		Compounds = {["silica"] = 78, ["alumina"] = 17, ["ferrous-oxide"] = 2, ["diferrous-trioxide"] = 3},
	},
	["stone-brick"] = {
		Mass = 0, 
		Type = "item",
		Elements = {["carbon"] = 50},
		Compounds = {["silica"] = 39, ["alumina"] = 8.5, ["ferrous-oxide"] = 1, ["diferrous-trioxide"] = 1.5},
	},
	["raw-wood"] = {
		Mass = 0, 
		Type = "item",
		Compounds = {["cellulose"] = 40, ["hemicellulose"] = 32, ["lignin"] = 28},
	},
	["wood"] = {
		Mass = 0, 
		Type = "item",
		Elements = {["carbon"] = 7.5},
		Compounds = {["cellulose"] = 17.5, ["hemicellulose"] = 13.5, ["lignin"] = 11.5},
	},
}
for k,v in pairs(Compounds) do
	Mass_Calc(k)
end