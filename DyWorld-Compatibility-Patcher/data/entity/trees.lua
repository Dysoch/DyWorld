



for k,v in pairs(data.raw.tree) do
	if v.minable then
		if v.minable.result and v.minable.count then
			local COUNT = v.minable.count
			local RESULT = v.minable.result
			if not v.minable.results then v.minable.results = {} end
			INSERT = {type = "item", name = RESULT, amount_min = math.ceil(COUNT * 0.5), amount_max = math.ceil(COUNT * 5), probability = 0.98}
			table.insert(v.minable.results, INSERT)
		elseif v.minable.results then
			INSERT = {type = "item", name = "wood", amount_min = math.ceil(5 * 0.5), amount_max = math.ceil(5 * 5), probability = 0.98}
			table.insert(v.minable.results, INSERT)
		end
	end
end

local Tree_Loot_Table = {
	{
		Name = "wood",
		Chance = 0.05,
		Max_Count = 11,
	},
	{
		Name = "lignite",
		Chance = 0.005,
		Max_Count = 2,
	},
}


for k,v in pairs(Tree_Loot_Table) do
	for _,z in pairs(data.raw.tree) do
		if not z.loot then z.loot = {} end
		loottable = {
			item = v.Name,
			probability = v.Chance,
			count_min = 1,
			count_max = v.Max_Count,
		}
		table.insert(z.loot, loottable)
	end
end

  -- wetland
data.raw.tree["tree-wetland-a"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.123},
}  
data.raw.tree["tree-wetland-b"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.890},
}  
data.raw.tree["tree-wetland-c"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.730},
}  
data.raw.tree["tree-wetland-d"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.816},
}  
data.raw.tree["tree-wetland-e"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.930},
}  
data.raw.tree["tree-wetland-f"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.175},
}  
data.raw.tree["tree-wetland-g"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.787},
}  
data.raw.tree["tree-wetland-h"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.492},
}  
data.raw.tree["tree-wetland-i"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.116},
}  
data.raw.tree["tree-wetland-j"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.912},
}  
data.raw.tree["tree-wetland-k"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.198},
}  
data.raw.tree["tree-wetland-l"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.403},
}  
data.raw.tree["tree-wetland-m"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.430},
}  
data.raw.tree["tree-wetland-n"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.837},
}  
data.raw.tree["tree-wetland-o"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 10, probability = 0.478},
}  
  -- grassland
data.raw.tree["tree-grassland-a"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.123},
}  
data.raw.tree["tree-grassland-b"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.890},
}  
data.raw.tree["tree-grassland-c"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.730},
}  
data.raw.tree["tree-grassland-d"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.816},
}  
data.raw.tree["tree-grassland-e"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.930},
}  
data.raw.tree["tree-grassland-f"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.175},
}  
data.raw.tree["tree-grassland-g"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.787},
}  
data.raw.tree["tree-grassland-h"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.492},
}  
data.raw.tree["tree-grassland-i"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.116},
}  
data.raw.tree["tree-grassland-j"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.912},
}  
data.raw.tree["tree-grassland-k"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.198},
}  
data.raw.tree["tree-grassland-l"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.403},
}  
data.raw.tree["tree-grassland-m"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.430},
}  
data.raw.tree["tree-grassland-n"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.837},
}  
data.raw.tree["tree-grassland-o"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.478},
}  
data.raw.tree["tree-grassland-p"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.942},
}  
data.raw.tree["tree-grassland-q"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.347},
}  
  -- dryland
data.raw.tree["tree-dryland-a"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.123},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-b"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.890},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-c"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.730},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-d"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.816},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-e"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.930},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-f"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.175},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-g"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.787},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-h"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.492},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-i"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.116},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-j"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.912},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-k"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.198},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-l"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.403},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-m"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.430},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-n"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.837},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
data.raw.tree["tree-dryland-o"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 18, probability = 0.478},
	{type = "item", name = "lignite", amount_min = 1, amount_max = 10, probability = 0.05},
}  
  -- desert
data.raw.tree["tree-desert-a"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.123},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-b"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.890},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-c"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.730},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-d"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.816},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-e"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.930},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-f"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.175},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-g"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.787},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-h"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.492},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-i"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.116},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-j"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.912},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-k"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.198},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-l"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.403},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-m"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.430},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
data.raw.tree["tree-desert-n"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.837},
	{type = "item", name = "sand", amount_min = 1, amount_max = 50, probability = 0.05},
}  
  -- volcanic
data.raw.tree["tree-volcanic-a"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 15, probability = 0.08},
}  
-- frozen
data.raw.tree["tree-snow-a"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 11, probability = 0.38},
}
  -- palm
data.raw.tree["tree-palm-a"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.78},
}
data.raw.tree["tree-palm-b"].minable.results = {
	{type = "item", name = "wood", amount_min = 1, amount_max = 13, probability = 0.86},
}