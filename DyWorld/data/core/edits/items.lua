require "data/core/functions/prefix"

local StackSizes = {
	{Name = "iron-ore", Amount = 200, Type = "item"},
	{Name = "copper-ore", Amount = 200, Type = "item"},
	{Name = "iron-plate", Amount = 200, Type = "item"},
	{Name = "iron-gear-wheel", Amount = 200, Type = "item"},
	{Name = "copper-plate", Amount = 200, Type = "item"},
	{Name = "steel-plate", Amount = 200, Type = "item"},
	{Name = "stone", Amount = 200, Type = "item"},
	{Name = "wood", Amount = 200, Type = "item"},
	{Name = "coal", Amount = 200, Type = "item"},
	{Name = "sulfur", Amount = 500, Type = "item"},
	{Name = "pipe", Amount = 200, Type = "item"},
	{Name = "pipe-to-ground", Amount = 200, Type = "item"},
	{Name = "heat-pipe", Amount = 200, Type = "item"},
	{Name = "inserter", Amount = 200, Type = "item"},
	{Name = "fast-inserter", Amount = 200, Type = "item"},
	{Name = "stack-inserter", Amount = 200, Type = "item"},
	{Name = "long-handed-inserter", Amount = 200, Type = "item"},
	{Name = "filter-inserter", Amount = 200, Type = "item"},
	{Name = "stack-filter-inserter", Amount = 200, Type = "item"},
	{Name = "stone-wall", Amount = 500, Type = "item"},
	{Name = "uranium-235", Amount = 200, Type = "item"},
	{Name = "uranium-238", Amount = 200, Type = "item"},
	{Name = "uranium-ore", Amount = 200, Type = "item"},
}

for k,v in pairs(StackSizes) do
	if data.raw[v.Type][v.Name] then
		data.raw[v.Type][v.Name].stack_size = v.Amount
	end
end

data.raw.item["iron-ore"].subgroup = dy.."0-resource"
data.raw.item["iron-ore"].order = "iron-ore"

data.raw.item["copper-ore"].subgroup = dy.."0-resource"
data.raw.item["copper-ore"].order = "copper-ore"

data.raw.item["stone"].subgroup = dy.."0-resource"
data.raw.item["stone"].order = "stone"

data.raw.item["coal"].subgroup = dy.."0-resource"
data.raw.item["coal"].order = "coal"

data.raw.item["wood"].subgroup = dy.."0-resource"
data.raw.item["wood"].order = "wood"

data.raw.item["uranium-ore"].subgroup = dy.."0-resource"
data.raw.item["uranium-ore"].order = "uranium-ore"

data.raw.item["iron-plate"].subgroup = dy.."material-1"
data.raw.item["iron-plate"].order = "iron-plate"

data.raw.item["copper-plate"].subgroup = dy.."material-1"
data.raw.item["copper-plate"].order = "copper-plate"

data.raw.item["steel-plate"].subgroup = dy.."material-2"
data.raw.item["steel-plate"].order = "steel-plate"

data.raw.item["stone"].subgroup = dy.."material-0"
data.raw.item["stone"].order = "stone"

data.raw.item["coal"].subgroup = dy.."material-0"
data.raw.item["coal"].order = "coal"

data.raw.item["wood"].subgroup = dy.."material-0"
data.raw.item["wood"].order = "wood"