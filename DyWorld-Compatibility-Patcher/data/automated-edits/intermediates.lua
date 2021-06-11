

local Change = {
	{Old = "stone", New = "stone-brick"},
	{Old = "iron-gear-wheel", New = "iron-gear"},
	{Old = "electronic-circuit", New = "control-board-1"},
	{Old = "advanced-circuit", New = "control-board-2"},
	{Old = "processing-unit", New = "control-board-3"},
	{Old = "raw-fish", New = "raw-fish-pike"},
	{Old = "pump", New = "bronze-pump"},
	{Old = "pipe", New = "bronze-pipe"},
	{Old = "pipe-to-ground", New = "bronze-pipe-to-ground"},
	{Old = "inserter", New = "basic-inserter"},
	{Old = "storage-tank", New = "storage-tank-1"},
	--{Old = "raw", New = "raw"},
	
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