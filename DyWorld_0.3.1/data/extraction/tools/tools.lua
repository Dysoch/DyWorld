require "data/prefix"

local Data_Table_Looped = {
	{
		Name = "mining-tool",
		Icon = "__base__/graphics/icons/iron-axe.png",
		Tech_Icon = "__base__/graphics/technology/steel-processing.png",
		Recipe = true,
		Recipe_Craft_Time = 2.5,
		Recipe_Result_Count = 1,
		Recipe_First_Ingredient = {"steel-axe", 1},
		Recipe_Ingredients = {{"advanced-circuit", 5}},
		Recipe_Without_Tech = false,
		Tech_Count = 200,
		Tech_Time = 30,
		Tech_PreReq = "steel-processing",
		Tech_Ingredients = {{"science-pack-1", 1},{"science-pack-2", 1}},
		Stack = 50,
		Subgroup = "tools",
		Speed = 5,
		Durability = 7500,
		Dmg = 10,
		
	},
}

for i=1,Tiered_Entities do
	for k,v in pairs(Data_Table_Looped) do
	data:extend(
		{
			DyWorld_Mining_Tool(v, i),
			DyWorld_Recipe(v, i),
		})
		if v.Recipe_Without_Tech == false then
		data:extend(
		{
			DyWorld_Technology(v, i),
		})
		end
	end
end