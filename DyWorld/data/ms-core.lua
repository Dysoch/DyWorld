require "data/prefix"

local Table = {
	{ Name = "stone", Table = "Stone", Type = "Primitive"},
	{ Name = "wood", Table = "Wood", Type = "Primitive"},
	{ Name = "obsidian", Table = "Obsidian", Type = "Primitive"},
	{ Name = "rubber", Table = "Rubber", Type = "Primitive"},
	{ Name = "copper", Table = "Copper", Type = "Basic"},
	{ Name = "iron", Table = "Iron", Type = "Basic"},
	{ Name = "chromium", Table = "Chromium", Type = "Basic"},
	{ Name = "zinc", Table = "Zinc", Type = "Basic"},
	{ Name = "tin", Table = "Tin", Type = "Basic"},
	{ Name = "silver", Table = "Silver", Type = "Basic"},
	{ Name = "gold", Table = "Gold", Type = "Basic"},
	{ Name = "lead", Table = "Lead", Type = "Basic"},
	{ Name = "tungsten", Table = "Tungsten", Type = "Basic"},
	{ Name = "nickel", Table = "Nickel", Type = "Basic"},
	{ Name = "aluminium", Table = "Aluminium", Type = "Basic"},
	{ Name = "uranium", Table = "Uranium", Type = "Basic"},
	{ Name = "steel", Table = "Steel", Type = "Simple_Alloy"},
}
    for k,v in pairs(Table) do
        table.insert(Material_Table, Table[k])
    end