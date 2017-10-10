require "data/prefix"

data.raw.recipe["accumulator"].ingredients = {}

local Recipe_Table = {
	["solar-panel"] = {{dy.."solar-cell", 9}},
	[dy.."solar-normal-1"] = {{"advanced-circuit", 3}, {dy.."solar-cell", 9}, {dy.."frame", 1}},
	[dy.."solar-normal-2"] = {{"advanced-circuit", 6}, {dy.."solar-cell", 9}},
	[dy.."solar-normal-3"] = {{"processing-unit", 5}, {dy.."solar-cell", 9}, {dy.."frame", 1}},
	[dy.."solar-normal-4"] = {{"processing-unit", 10}, {dy.."solar-cell", 9}},
	[dy.."solar-normal-5"] = {{"processing-unit", 20}, {dy.."solar-cell", 9}},
	[dy.."solar-normal-6"] = {{dy.."processing-advanced", 10}, {dy.."solar-cell", 9}, {dy.."frame", 1}},
	[dy.."solar-normal-7"] = {{dy.."processing-advanced", 20}, {dy.."solar-cell", 9}},
	[dy.."solar-normal-8"] = {{dy.."processing-logic", 20}, {dy.."solar-cell", 9}, {dy.."frame", 1}},
	[dy.."solar-normal-9"] = {{dy.."processing-logic", 40}, {dy.."solar-cell", 9}},
	["accumulator"] = {{dy.."battery-pack", 1}, {"iron-plate", 4}, {"copper-plate", 2}},
	[dy.."accumulator-normal-1"] = {{"electronic-circuit", 3}, {dy.."battery-pack", 2}, {dy.."frame", 1}},
	[dy.."accumulator-normal-2"] = {{"advanced-circuit", 3}, {dy.."battery-pack", 3}},
	[dy.."accumulator-normal-3"] = {{"advanced-circuit", 6}, {dy.."battery-pack", 4}, {dy.."frame", 1}},
	[dy.."accumulator-normal-4"] = {{"processing-unit", 10}, {dy.."battery-pack", 5}},
	[dy.."accumulator-normal-5"] = {{"processing-unit", 20}, {dy.."battery-pack", 6}},
	[dy.."accumulator-normal-6"] = {{dy.."processing-advanced", 10}, {dy.."battery-pack", 7}, {dy.."frame", 1}},
	[dy.."accumulator-normal-7"] = {{dy.."processing-advanced", 20}, {dy.."battery-pack", 8}},
	[dy.."accumulator-normal-8"] = {{dy.."processing-logic", 20}, {dy.."battery-pack", 9}, {dy.."frame", 1}},
	[dy.."accumulator-normal-9"] = {{dy.."processing-logic", 40}, {dy.."battery-pack", 10}},
}

for k,v in pairs(Recipe_Table) do
	for _,z in pairs(v) do
		table.insert(data.raw.recipe[k].ingredients,z)	
	end
end