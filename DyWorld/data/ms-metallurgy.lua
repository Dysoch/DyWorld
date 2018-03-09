local Table = {
	{ Name = "stainless-steel", Table = "Stainless_Steel", Type = "Alloy", Tier = 4},
	{ Name = "billon", Table = "Billon", Type = "Alloy", Tier = 4},
	{ Name = "bronze", Table = "Bronze", Type = "Alloy", Tier = 4},
	{ Name = "copper-tungsten", Table = "Copper_Tungsten", Type = "Alloy", Tier = 4},
	{ Name = "copper-hydride", Table = "Copper_Hydride", Type = "Alloy", Tier = 4},
	{ Name = "elinvar", Table = "Elinvar", Type = "Complex_Alloy", Tier = 5},
	{ Name = "stainless-copilinvar-tungstate", Table = "Stainless_Copilinvar_Tungstate", Type = "Super_Alloy", Tier = 6},
    }
    for k,v in pairs(Table) do
        table.insert(Material_Table, Table[k])
    end