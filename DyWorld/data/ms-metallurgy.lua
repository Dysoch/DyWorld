local Table = {
	{ 
		Name = "stainless-steel", 
		Table = "Stainless_Steel", 
		Type = "Alloy", 
		Tier = 4,
		DMG_Type = "physical",
	},
	{ 
		Name = "billon", 
		Table = "Billon", 
		Type = "Alloy", 
		Tier = 4,
		DMG_Type = "physical",
	},
	{ 
		Name = "bronze", 
		Table = "Bronze", 
		Type = "Alloy", 
		Tier = 4,
		DMG_Type = "physical",
	},
	{ 
		Name = "copper-tungsten", 
		Table = "Copper_Tungsten", 
		Type = "Alloy", 
		Tier = 4,
		DMG_Type = "physical",
	},
	{ 
		Name = "copper-hydride", 
		Table = "Copper_Hydride", 
		Type = "Alloy", 
		Tier = 4,
		DMG_Type = "physical",
	},
	{ 
		Name = "elinvar", 
		Table = "Elinvar", 
		Type = "Complex_Alloy", 
		Tier = 5,
		DMG_Type = "physical",
	},
	{ 
		Name = "stainless-copilinvar-tungstate", 
		Table = "Stainless_Copilinvar_Tungstate", 
		Type = "Super_Alloy", 
		Tier = 6,
		DMG_Type = "physical",
	},
}

for k,v in pairs(Table) do
    table.insert(Material_Table, Table[k])
end