
require("data.modules.speed")
require("data.modules.effectivity")
require("data.modules.productivity")

local Remove_Table = {"speed-module", "speed-module-2", "speed-module-3", "effectivity-module", "effectivity-module-2", "effectivity-module-3", "productivity-module", "productivity-module-2", "productivity-module-3"}

for k,m in pairs(Remove_Table) do
	for j,n in pairs(data.raw.technology) do
		if n.effects then
			for h,b in pairs(n.effects) do
				if b.recipe == m then
					table.remove(n.effects, h)
				end
			end
		end
	end
	for j,n in pairs(data.raw.recipe) do
		if n.ingredients then
			for h,b in pairs(n.ingredients) do
				if b.name then
					if b.name == m then
						table.remove(n.ingredients, h)
					end
				elseif b[1] == m then
					table.remove(n.ingredients, h)
				end
			end
		end
	end
	if data.raw.recipe[m] then
		if data.raw.recipe[m].normal then
			data.raw.recipe[m].normal.hidden = true
			data.raw.recipe[m].expensive.hidden = true
		else
			data.raw.recipe[m].hidden = true
		end
	end
end