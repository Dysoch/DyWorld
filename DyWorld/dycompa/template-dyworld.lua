require "data/prefix"

local Change = {
	{Old = "", New = ""},
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
	if data.raw.recipe[m.Old] then
		if data.raw.recipe[m.Old].normal then
			data.raw.recipe[m.Old].normal.hidden = true
			data.raw.recipe[m.Old].expensive.hidden = true
		else
			data.raw.recipe[m.Old].hidden = true
		end
	end
end