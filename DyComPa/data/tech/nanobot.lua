



--[[local Recipes = {
	["motor"] = {"intermediates-1"},
	["electric-motor"] = {"intermediates-2"},
}


for name, techtable in pairs(Recipes) do
	for _,tech in pairs(techtable) do
		DyWorld_Add_To_Tech(tech, name)
	end
end]]--

data.raw.technology["nanobots"].prerequisites = {"automation-science-pack"}
data.raw.technology["nanobots-cliff"].prerequisites = {"nanobots", "logistic-science-pack"}
data.raw.technology["nano-range-2"].prerequisites = {"nano-range-1", "logistic-science-pack"}
data.raw.technology["nano-speed-2"].prerequisites = {"nano-speed-1", "logistic-science-pack"}