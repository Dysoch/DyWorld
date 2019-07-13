require "data/prefix"

local Change = {
	{Old = "speed-module", New = dy.."iron-module-speed"},
	{Old = "speed-module-2", New = dy.."steel-module-speed"},
	{Old = "speed-module-3", New = dy.."bronze-module-speed"},
	{Old = "productivity-module", New = dy.."iron-module-productivity"},
	{Old = "productivity-module-2", New = dy.."lead-module-productivity"},
	{Old = "productivity-module-3", New = dy.."stainless-steel-module-productivity"},
	{Old = "effectivity-module", New = dy.."copper-module-effectivity"},
	{Old = "effectivity-module-2", New = dy.."silver-module-effectivity"},
	{Old = "effectivity-module-3", New = dy.."elinvar-module-effectivity"},
	{Old = "beacon", New = dy.."iron-beacon"},
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
		if data.raw.item[m.Old].flags then
			table.insert(data.raw.item[m.Old].flags, "hidden")
		else
			data.raw.item[m.Old].flags = {"hidden"}
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