local Table = {
	{ Name = "stainless-steel", Table = "Stainless_Steel", Type = "Alloy"},
	{ Name = "billon", Table = "Billon", Type = "Alloy"},
	{ Name = "bronze", Table = "Bronze", Type = "Alloy"},
	{ Name = "copper-tungsten", Table = "Copper_Tungsten", Type = "Alloy"},
	{ Name = "copper-hydride", Table = "Copper_Hydride", Type = "Alloy"},
	{ Name = "elinvar", Table = "Elinvar", Type = "Complex_Alloy"},
	{ Name = "stainless-copilinvar-tungstate", Table = "Stainless_Copilinvar_Tungstate", Type = "Super_Alloy"},
    }
    for k,v in pairs(Table) do
        table.insert(Material_Table, Table[k])
    end