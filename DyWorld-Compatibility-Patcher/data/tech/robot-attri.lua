



--[[local Recipes = {
	["motor"] = {"intermediates-1"},
	["electric-motor"] = {"intermediates-2"},
}


for name, techtable in pairs(Recipes) do
	for _,tech in pairs(techtable) do
		DyWorld_Add_To_Tech(tech, name)
	end
end]]--

data.raw.technology["robot-attrition-explosion-safety"].prerequisites = {"dy-science-pack-11"}