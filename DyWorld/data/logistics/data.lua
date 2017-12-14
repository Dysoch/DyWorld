
require("data.logistics.edits.entities")
require("data.logistics.edits.items")
require("data.logistics.edits.recipes")
require("data.logistics.edits.techs")

require("data.logistics.robots.roboport")
require("data.logistics.robots.construction")
require("data.logistics.robots.logistic")

require("data.logistics.belts.belts")

require("data.logistics.pipes.pipes")
require("data.logistics.pipes.pumps")
require("data.logistics.pipes.storage")

require("data.logistics.inserters.inserters")

require("data.logistics.tools.repair")

require("data.logistics.chests.chests")
require("data.logistics.chests.warehouse")

require("data.logistics.trains.locomotives")









require("data.logistics.recipes")

local Remove_Table = {"fast-inserter", "transport-belt", "splitter", "underground-belt", "fast-transport-belt", "fast-splitter", "fast-underground-belt", "express-transport-belt", "express-splitter", "express-underground-belt", "stack-inserter", "filter-inserter", "filter-stack-inserter", "long-handed-inserter", "basic-inserter", "construction-robot", "logistic-robot", "roboport", "iron-chest", "steel-chest", "wooden-chest", "inserter", "pump", "offshore-pump", "pipe", "pipe-to-ground", "storage-tank"}

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