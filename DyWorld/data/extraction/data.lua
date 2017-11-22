
require("data.extraction.edits.recipes")



require("data.extraction.tools.tools")

require("data.extraction.drills.burner")
require("data.extraction.drills.electric")









require("data.extraction.recipes")

local Remove_Table = {"steel-axe", "iron-axe", "electric-mining-drill", "burner-mining-drill"}

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
	if data.raw.recipe[m] then
		if data.raw.recipe[m].normal then
			data.raw.recipe[m].normal.hidden = true
			data.raw.recipe[m].expensive.hidden = true
		else
			data.raw.recipe[m].hidden = true
		end
	end
end