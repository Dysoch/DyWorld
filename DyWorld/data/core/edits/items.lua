
local StackSizes = {
	{Name = "iron-ore", Amount = 200, Type = "item"},
	{Name = "copper-ore", Amount = 200, Type = "item"},
	{Name = "iron-plate", Amount = 200, Type = "item"},
	{Name = "copper-plate", Amount = 200, Type = "item"},
	{Name = "steel-plate", Amount = 200, Type = "item"},
	{Name = "stone", Amount = 200, Type = "item"},
	{Name = "wood", Amount = 200, Type = "item"},
	{Name = "raw-wood", Amount = 200, Type = "item"},
	{Name = "coal", Amount = 200, Type = "item"},
	{Name = "pipe", Amount = 200, Type = "item"},
	{Name = "pipe-to-ground", Amount = 200, Type = "item"},
	{Name = "transport-belt", Amount = 200, Type = "item"},
	{Name = "fast-transport-belt", Amount = 200, Type = "item"},
	{Name = "express-transport-belt", Amount = 200, Type = "item"},
	{Name = "underground-belt", Amount = 200, Type = "item"},
	{Name = "fast-underground-belt", Amount = 200, Type = "item"},
	{Name = "express-underground-belt", Amount = 200, Type = "item"},
	{Name = "splitter", Amount = 200, Type = "item"},
	{Name = "fast-splitter", Amount = 200, Type = "item"},
	{Name = "express-splitter", Amount = 200, Type = "item"},
	{Name = "stone-brick", Amount = 200, Type = "item"},
	{Name = "plastic-bar", Amount = 200, Type = "item"},
	{Name = "landfill", Amount = 200, Type = "item"},
}

for k,v in pairs(StackSizes) do
	data.raw[v.Type][v.Name].stack_size = v.Amount
end

data.raw.item["iron-ore"].localised_name = {"edits-name.iron-ore"}
data.raw.item["copper-ore"].localised_name = {"edits-name.copper-ore"}
data.raw.item["iron-plate"].localised_name = {"edits-name.iron-plate"}
data.raw.item["copper-plate"].localised_name = {"edits-name.copper-plate"}