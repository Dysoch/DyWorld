
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
	{Name = "pipe", Amount = 100, Type = "item"},
	{Name = "pipe-to-ground", Amount = 100, Type = "item"},
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

if settings.startup["DyWorld_Logistics"].value then
data.raw.item["transport-belt"].order = "4"
data.raw.item["fast-transport-belt"].order = "5"
data.raw.item["express-transport-belt"].order = "6"
data.raw.item["transport-belt"].subgroup = dy.."transport-belt"
data.raw.item["fast-transport-belt"].subgroup = dy.."transport-belt"
data.raw.item["express-transport-belt"].subgroup = dy.."transport-belt"

data.raw.item["underground-belt"].order = "4"
data.raw.item["fast-transport-belt"].order = "5"
data.raw.item["express-transport-belt"].order = "6"
data.raw.item["underground-belt"].subgroup = dy.."transport-underground"
data.raw.item["fast-underground-belt"].subgroup = dy.."transport-underground"
data.raw.item["express-underground-belt"].subgroup = dy.."transport-underground"

data.raw.item["splitter"].order = "4"
data.raw.item["fast-splitter"].order = "5"
data.raw.item["express-splitter"].order = "6"
data.raw.item["splitter"].subgroup = dy.."transport-splitter"
data.raw.item["fast-splitter"].subgroup = dy.."transport-splitter"
data.raw.item["express-splitter"].subgroup = dy.."transport-splitter"
end