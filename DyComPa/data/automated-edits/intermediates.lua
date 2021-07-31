

local Change = {
	{Old = "stone", New = "limestone"},
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
	{Old = "plastic-bar", New = "polycarbonate"},
	{Old = "transport-belt", New = "transport-belt-1"},
	{Old = "fast-transport-belt", New = "transport-belt-2"},
	{Old = "express-transport-belt", New = "transport-belt-3"},
	{Old = "underground-belt", New = "underground-belt-1"},
	{Old = "fast-underground-belt", New = "underground-belt-2"},
	{Old = "express-underground-belt", New = "underground-belt-3"},
	{Old = "loader", New = "loader-1"},
	{Old = "fast-loader", New = "loader-2"},
	{Old = "express-loader", New = "loader-3"},
	{Old = "splitter", New = "splitter-1"},
	{Old = "fast-splitter", New = "splitter-2"},
	{Old = "express-splitter", New = "splitter-3"},
	{Old = "assembling-machine-1", New = "basic-assembler"},
	{Old = "assembling-machine-2", New = "advanced-assembler"},
	{Old = "assembling-machine-3", New = "nano-assembler"},
	{Old = "boiler", New = "basic-boiler"},
	{Old = "burner-mining-drill", New = "basic-burner-drill"},
	{Old = "electric-mining-drill", New = "basic-electric-drill"},
	{Old = "small-electric-pole", New = "basic-power-pole"},
	{Old = "steam-engine", New = "basic-steam-engine"},
	{Old = "radar", New = "radar-1"},
	{Old = "lab", New = "lab-1"},
	{Old = "pumpjack", New = "oil-extractor"},
	{Old = "rocket-silo", New = "rocket-silo-1"},
	{Old = "medium-electric-pole", New = "advanced-power-pole"},
	{Old = "big-electric-pole", New = "basic-power-relay"},
	{Old = "heat-pipe", New = "heat-pipe-fission"},
	{Old = "nuclear-reactor", New = "reactor-fission"},
	{Old = "car", New = "car-1"},
	{Old = "cargo-wagon", New = "cargo-wagon-1"},
	{Old = "fluid-wagon", New = "fluid-wagon-1"},
	{Old = "locomotive", New = "locomotive-1"},
	{Old = "construction-robot", New = "construction-robot-1"},
	{Old = "logistic-robot", New = "logistic-robot-1"},
	{Old = "roboport", New = "roboport-1"},
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