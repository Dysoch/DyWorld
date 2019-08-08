

local Change = {
	{Old = "speed-module", New = "stone-speed-module"},
	{Old = "effectivity-module", New = "stone-effectivity-module"},
	{Old = "productivity-module", New = "stone-productivity-module"},
	{Old = "speed-module-2", New = "silver-speed-module"},
	{Old = "effectivity-module-2", New = "silver-effectivity-module"},
	{Old = "productivity-module-2", New = "silver-productivity-module"},
	{Old = "speed-module-3", New = "gold-speed-module"},
	{Old = "effectivity-module-3", New = "gold-effectivity-module"},
	{Old = "electronic-circuit", New = "simple-control-board"},
	{Old = "advanced-circuit", New = "advanced-control-board"},
	{Old = "processing-unit", New = "logic-control-board"},
	
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
			if data.raw.item[m.Old].flags then
				table.insert(data.raw.item[m.Old].flags, "hidden")
			else
				data.raw.item[m.Old].flags = {"hidden"}
			end
		end
		if data.raw.module[m.Old] then
			if data.raw.module[m.Old].flags then
				table.insert(data.raw.module[m.Old].flags, "hidden")
			else
				data.raw.module[m.Old].flags = {"hidden"}
			end
		end
		if data.raw["assembling-machine"][m.Old] then
			if data.raw["assembling-machine"][m.Old].next_upgrade then
				data.raw["assembling-machine"][m.Old].next_upgrade = nil
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