

require("data.power.edits.entities")
require("data.power.edits.items")
require("data.power.edits.recipes")

require("data.power.accumulator.accumulator-normal")
require("data.power.solar.solar-normal")

require("data.power.poles.poles")









require("data.power.recipes")

local Remove_Table = {"solar-panel", "accumulator", "small-electric-pole", "medium-electric-pole", "big-electric-pole"}

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