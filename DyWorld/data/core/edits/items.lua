
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

data.raw.tool["science-pack-1"].subgroup = dy.."science-tool"
data.raw.tool["science-pack-2"].subgroup = dy.."science-tool"
data.raw.tool["science-pack-3"].subgroup = dy.."science-tool"
data.raw.tool["military-science-pack"].subgroup = dy.."science-tool"
data.raw.tool["production-science-pack"].subgroup = dy.."science-tool"
data.raw.tool["high-tech-science-pack"].subgroup = dy.."science-tool"
data.raw.tool["science-pack-1"].order = "01"
data.raw.tool["science-pack-2"].order = "02"
data.raw.tool["science-pack-3"].order = "04"
data.raw.tool["military-science-pack"].order = "03"
data.raw.tool["production-science-pack"].order = "05"
data.raw.tool["high-tech-science-pack"].order = "06"

data.raw.item["electronic-circuit"].subgroup = dy.."circuit-04-circuits"
data.raw.item["electronic-circuit"].order = "01"
data.raw.item["advanced-circuit"].subgroup = dy.."circuit-04-circuits"
data.raw.item["advanced-circuit"].order = "02"
data.raw.item["processing-unit"].subgroup = dy.."circuit-04-circuits"
data.raw.item["processing-unit"].order = "03"