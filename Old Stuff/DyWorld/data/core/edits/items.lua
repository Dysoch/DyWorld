require "data/core/functions/prefix"
--[[
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
	{Name = "landfill", Amount = 500, Type = "item"},
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
end]]--

local StackSizes = {
	["iron-ore"] = 200,
	["uranium-235"] = 200,
	["uranium-238"] = 200,
	["uranium-ore"] = 200,
	["copper-ore"] = 200,
	["iron-plate"] = 200,
	["iron-gear-wheel"] = 200,
	["copper-plate"] = 200,
	["steel-plate"] = 200,
	["stone"] = 200,
	["wood"] = 200,
	["coal"] = 200,
	["pipe"] = 200,
	["pipe-to-ground"] = 200,
	["heat-pipe"] = 200,
	["inserter"] = 200,
	["fast-inserter"] = 200,
	["stack-inserter"] = 200,
	["long-handed-inserter"] = 200,
	["filter-inserter"] = 200,
	["stack-filter-inserter"] = 200,
	
	["stone-wall"] = 500,
	["sulfur"] = 500,
	["landfill"] = 500,
}

for k,v in pairs(StackSizes) do
	if data.raw.item[k] then
		data.raw.item[k].stack_size = v
	elseif data.raw.ammo[k] then
		data.raw.ammo[k].stack_size = v
	elseif data.raw.tool[k] then
		data.raw.tool[k].stack_size = v
	elseif data.raw.module[k] then
		data.raw.module[k].stack_size = v
	elseif data.raw.capsule[k] then
		data.raw.capsule[k].stack_size = v
	elseif data.raw["rail-planner"][k] then
		data.raw["rail-planner"][k].stack_size = v
	elseif data.raw["repair-tool"][k] then
		data.raw["repair-tool"][k].stack_size = v
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