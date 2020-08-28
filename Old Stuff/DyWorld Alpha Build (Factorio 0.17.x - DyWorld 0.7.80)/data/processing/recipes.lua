require "data/prefix"


local Recipe_Table = {
	[dy.."assembling-electric-1"] = {{"advanced-circuit", 5}, {dy.."steel-gear", 2}, {dy.."frame", 1}},
	[dy.."assembling-electric-2"] = {{"advanced-circuit", 15}, {dy.."steel-gear", 5}, {dy.."rubber", 12}},
	[dy.."assembling-electric-3"] = {{"processing-unit", 5}, {dy.."steel-gear", 12}, {dy.."frame", 1}},
	[dy.."assembling-electric-4"] = {{"processing-unit", 10}, {dy.."controller", 1}},
	[dy.."assembling-electric-5"] = {{dy.."processing-advanced", 10}, {dy.."controller", 1}},
	[dy.."assembling-electric-6"] = {{dy.."processing-advanced", 25}, {dy.."controller", 2}},
	[dy.."assembling-electric-7"] = {{dy.."processing-logic", 10}, {dy.."controller", 3}},
	[dy.."assembling-electric-8"] = {{dy.."processing-logic", 25}, {dy.."controller", 5}},
	[dy.."assembling-electric-9"] = {{dy.."processing-logic", 50}, {dy.."controller", 10}},
}

for k,v in pairs(Recipe_Table) do
	for _,z in pairs(v) do
		if data.raw.recipe[k] then
			table.insert(data.raw.recipe[k].ingredients,z)	
		end
	end
end