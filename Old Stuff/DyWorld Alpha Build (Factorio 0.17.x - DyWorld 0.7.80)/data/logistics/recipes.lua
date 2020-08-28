require "data/prefix"

local Recipe_Table = {
	[dy.."construction-robot-1"] = {{"processing-unit", 1}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."construction-robot-2"] = {{"processing-unit", 2}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."construction-robot-3"] = {{"processing-unit", 3}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."construction-robot-4"] = {{dy.."processing-advanced", 1}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."construction-robot-5"] = {{dy.."processing-advanced", 2}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."construction-robot-6"] = {{dy.."processing-advanced", 3}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."construction-robot-7"] = {{dy.."processing-logic", 3}, {dy.."logistic-unit", 1}, {dy.."intake", 1}, {dy.."controller", 1}},
	[dy.."construction-robot-8"] = {{dy.."processing-logic", 6}, {dy.."logistic-unit", 1}, {dy.."intake", 1}, {dy.."controller", 1}},
	[dy.."construction-robot-9"] = {{dy.."processing-logic", 9}, {dy.."logistic-unit", 1}, {dy.."intake", 1}, {dy.."controller", 1}},
	[dy.."logistic-robot-1"] = {{"processing-unit", 1}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."logistic-robot-2"] = {{"processing-unit", 2}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."logistic-robot-3"] = {{"processing-unit", 3}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."logistic-robot-4"] = {{dy.."processing-advanced", 1}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."logistic-robot-5"] = {{dy.."processing-advanced", 2}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."logistic-robot-6"] = {{dy.."processing-advanced", 3}, {dy.."logistic-unit", 1}, {dy.."intake", 1}},
	[dy.."logistic-robot-7"] = {{dy.."processing-logic", 3}, {dy.."logistic-unit", 1}, {dy.."intake", 1}, {dy.."controller", 1}},
	[dy.."logistic-robot-8"] = {{dy.."processing-logic", 6}, {dy.."logistic-unit", 1}, {dy.."intake", 1}, {dy.."controller", 1}},
	[dy.."logistic-robot-9"] = {{dy.."processing-logic", 9}, {dy.."logistic-unit", 1}, {dy.."intake", 1}, {dy.."controller", 1}},
}

for k,v in pairs(Recipe_Table) do
	for _,z in pairs(v) do
		if data.raw.recipe[k] then
			table.insert(data.raw.recipe[k].ingredients,z)	
		end
	end
end