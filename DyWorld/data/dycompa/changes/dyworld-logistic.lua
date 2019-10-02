

local Change = {
	{Old = "transport-belt", New = "stone-transport-belt"},
	{Old = "splitter", New = "stone-splitter"},
	{Old = "loader", New = "stone-loader"},
	{Old = "underground-belt", New = "stone-underground-belt"},
	{Old = "fast-transport-belt", New = "iron-transport-belt"},
	{Old = "fast-splitter", New = "iron-splitter"},
	{Old = "fast-loader", New = "iron-loader"},
	{Old = "fast-underground-belt", New = "iron-underground-belt"},
	{Old = "express-transport-belt", New = "titanium-transport-belt"},
	{Old = "express-splitter", New = "titanium-splitter"},
	{Old = "express-loader", New = "titanium-loader"},
	{Old = "express-underground-belt", New = "titanium-underground-belt"},
	{Old = "pipe", New = "stone-pipe"},
	{Old = "pump", New = "stone-pump"},
	{Old = "pipe-to-ground", New = "stone-pipe-to-ground"},
	{Old = "roboport", New = "nickel-roboport"},
	{Old = "construction-robot", New = "nickel-construction-robot"},
	{Old = "logistic-robot", New = "nickel-logistic-robot"},
}

for k,v in pairs(Change) do
	if v.New then
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
			if Recipe.normal and Recipe.normal.ingredients then
				for _, b in pairs(Recipe.normal.ingredients) do
					if b.name then
						if b.name == v.Old then
							b.name = v.New
						end
					elseif b[1] == v.Old then
						b[1] = v.New
					end
				end
			end
			if Recipe.expensive and Recipe.expensive.ingredients then
				for _, b in pairs(Recipe.expensive.ingredients) do
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
	if m.New then
		if data.raw.item[m.Old] then
			data.raw.item[m.Old].DyWorld_Hidden = true
			data.raw.item[m.Old].subgroup = "dyworld-hidden-items"
		end
		if data.raw["transport-belt"][m.Old] then
			if data.raw["transport-belt"][m.Old].next_upgrade then
				data.raw["transport-belt"][m.Old].next_upgrade = nil
			end
		end
		if data.raw["splitter"][m.Old] then
			if data.raw["splitter"][m.Old].next_upgrade then
				data.raw["splitter"][m.Old].next_upgrade = nil
			end
		end
		if data.raw["underground-belt"][m.Old] then
			if data.raw["underground-belt"][m.Old].next_upgrade then
				data.raw["underground-belt"][m.Old].next_upgrade = nil
			end
		end
		if data.raw["inserter"][m.Old] then
			if data.raw["inserter"][m.Old].next_upgrade then
				data.raw["inserter"][m.Old].next_upgrade = nil
			end
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
end