require "data/prefix"

local Recipe_Table = {
	[dy.."mining-tool-1"] = {{dy.."steel-stick", 1}, {dy.."binding-steel", 1}},
	[dy.."mining-tool-2"] = {{dy.."steel-stick", 2}, {dy.."binding-steel", 1}, {dy.."rubber", 1}},
	[dy.."mining-tool-3"] = {{dy.."steel-stick", 3}, {dy.."binding-steel", 1}},
	[dy.."mining-tool-4"] = {{dy.."steel-stick", 4}, {dy.."binding-steel", 1}},
	[dy.."mining-tool-5"] = {{dy.."steel-stick", 5}, {dy.."binding-chitin", 1}},
	[dy.."mining-tool-6"] = {{dy.."steel-stick", 5}, {dy.."binding-chitin", 1}, {dy.."processing-advanced", 1}},
	[dy.."mining-tool-7"] = {{dy.."steel-stick", 5}, {dy.."binding-chitin", 1}, {dy.."processing-advanced", 1}},
	[dy.."mining-tool-8"] = {{dy.."steel-stick", 5}, {dy.."binding-chitin", 1}, {dy.."processing-logic", 1}},
	[dy.."mining-tool-9"] = {{dy.."steel-stick", 5}, {dy.."processing-logic", 1}},
}

for k,v in pairs(Recipe_Table) do
	for _,z in pairs(v) do
		table.insert(data.raw.recipe[k].ingredients,z)	
	end
end