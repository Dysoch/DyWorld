



--[[local Recipes = {
	["motor"] = {"intermediates-1"},
	["electric-motor"] = {"intermediates-2"},
}


for name, techtable in pairs(Recipes) do
	for _,tech in pairs(techtable) do
		DyWorld_Add_To_Tech(tech, name)
	end
end]]--

data.raw.technology["se-rocket-fuel-from-water"].prerequisites = {"oil-processing", "chemical-science-pack"}
data.raw.technology["se-fuel-refining"].prerequisites = {"oil-processing", "logistic-science-pack"}
data.raw.technology["artillery-shell-range-2"].hidden = true
data.raw.technology["artillery-shell-speed-2"].hidden = true