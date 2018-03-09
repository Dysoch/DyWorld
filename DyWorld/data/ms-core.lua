require "data/prefix"

local Table = {
	{ Name = "stone", Table = "Stone", Type = "Primitive", Tier = 1},
	{ Name = "wood", Table = "Wood", Type = "Primitive", Tier = 1},
	{ Name = "obsidian", Table = "Obsidian", Type = "Primitive", Tier = 1},
	{ Name = "rubber", Table = "Rubber", Type = "Primitive", Tier = 1},
	{ Name = "copper", Table = "Copper", Type = "Basic", Tier = 2},
	{ Name = "iron", Table = "Iron", Type = "Basic", Tier = 2},
	{ Name = "chromium", Table = "Chromium", Type = "Basic", Tier = 2},
	{ Name = "zinc", Table = "Zinc", Type = "Basic", Tier = 2},
	{ Name = "tin", Table = "Tin", Type = "Basic", Tier = 2},
	{ Name = "silver", Table = "Silver", Type = "Basic", Tier = 2},
	{ Name = "gold", Table = "Gold", Type = "Basic", Tier = 2},
	{ Name = "lead", Table = "Lead", Type = "Basic", Tier = 2},
	{ Name = "tungsten", Table = "Tungsten", Type = "Basic", Tier = 2},
	{ Name = "nickel", Table = "Nickel", Type = "Basic", Tier = 2},
	{ Name = "aluminium", Table = "Aluminium", Type = "Basic", Tier = 2},
	{ Name = "uranium", Table = "Uranium", Type = "Basic", Tier = 2},
	{ Name = "steel", Table = "Steel", Type = "Simple_Alloy", Tier = 3},
}
    for k,v in pairs(Table) do
        table.insert(Material_Table, Table[k])
    end