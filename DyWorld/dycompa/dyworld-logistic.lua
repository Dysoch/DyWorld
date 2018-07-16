require "data/prefix"

local Change = {
	{Old = "fast-inserter", New = dy.."iron-basic-inserter"},
	{Old = "transport-belt", New = dy.."stone-transport-belt"},
	{Old = "splitter", New = dy.."stone-splitter"},
	{Old = "underground-belt", New = dy.."stone-underground-belt"},
	{Old = "fast-transport-belt", New = dy.."iron-transport-belt"},
	{Old = "fast-splitter", New = dy.."iron-splitter"},
	{Old = "fast-underground-belt", New = dy.."iron-underground-belt"},
	{Old = "express-transport-belt", New = dy.."steel-transport-belt"},
	{Old = "express-splitter", New = dy.."steel-splitter"},
	{Old = "express-underground-belt", New = dy.."steel-underground-belt"},
	{Old = "stack-inserter", New = dy.."aluminium-stack-inserter"},
	{Old = "filter-inserter", New = dy.."obsidian-filter-inserter"},
	{Old = "stack-filter-inserter", New = dy.."lead-stack-filter-inserter"},
	{Old = "filter-stack-inserter", New = dy.."lead-stack-filter-inserter"},
	{Old = "long-handed-inserter", New = dy.."copper-long-inserter"},
	{Old = "basic-inserter", New = dy.."stone-basic-inserter"},
	{Old = "construction-robot", New = dy.."nickel-construction-robot"},
	{Old = "logistic-robot", New = dy.."zinc-logistic-robot"},
	{Old = "roboport", New = dy.."iron-roboport"},
	{Old = "iron-chest", New = dy.."iron-chest"},
	{Old = "steel-chest", New = dy.."steel-chest"},
	{Old = "wooden-chest", New = dy.."wood-chest"},
	{Old = "inserter", New = dy.."stone-basic-inserter"},
	{Old = "pump", New = dy.."stone-pump"},
	{Old = "offshore-pump", New = dy.."stone-offshore-pump"},
	{Old = "pipe", New = dy.."stone-pipe"},
	{Old = "repair-pack", New = dy.."tungsten-repair-tool"},
	{Old = "pipe-to-ground", New = dy.."stone-pipe-to-ground"},
	{Old = "storage-tank", New = dy.."copper-storage-tank"},
}

for k,v in pairs(Change) do
	for _, Recipe in pairs(data.raw.recipe) do
		if Recipe.ingredients then
			for _, b in pairs(Recipe.ingredients) do
				if b.name then
					if b.name == v.Old then
						b.name = v.New
					end
				elseif b[1] == v.Old then
					b[1] = v.New
				end
			end
		end
	end
end

for k,m in pairs(Change) do
	for j,n in pairs(data.raw.technology) do
		if n.effects then
			for h,b in pairs(n.effects) do
				if b.recipe == m.Old then
					table.remove(n.effects, h)
				end
			end
		end
	end
	if data.raw.item[m.Old] then
		table.insert(data.raw.item[m.Old].flags, "hidden")
	end
	if data.raw.recipe[m.Old] then
		if data.raw.recipe[m.Old].normal then
			data.raw.recipe[m.Old].normal.hidden = true
			data.raw.recipe[m.Old].expensive.hidden = true
		else
			data.raw.recipe[m.Old].hidden = true
		end
	end
end