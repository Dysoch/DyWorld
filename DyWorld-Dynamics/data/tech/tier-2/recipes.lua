



local Recipes = {
	["rocket-silo-1"] = {"space-mining"},
	["rocket-part-1"] = {"space-mining"},
}


for name, techtable in pairs(Recipes) do
	for _,tech in pairs(techtable) do
		DyWorld_Add_To_Tech(tech, name)
	end
end