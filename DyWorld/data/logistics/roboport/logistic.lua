require "data/prefix"

local Data_Table_Looped = {
	{
		Name = "logistic-roboport-",
		Icon = "__base__/graphics/icons/roboport.png",
		Tech_Icon = "__base__/graphics/technology/robotics.png",
		Recipe = true,
		Recipe_Craft_Time = 5,
		Recipe_Result_Count = 1,
		Recipe_First_Ingredient = {"roboport", 1},
		Recipe_Without_Tech = false,
		Tech_Count = 200,
		Tech_Time = 30,
		Tech_PreReq = "logistic-robotics",
		Tech_Ingredients = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1}},
		Stack = 50,
		Subgroup = "roboport-logistic",
		Item_Place = "quickbar",
		Entity = true,
		Radius_Logistic = 40,
		Radius_Construction = 40,
		Health = 1000,
	},
}

for i=1,Tiered_Entities do
	for k,v in pairs(Data_Table_Looped) do
	data:extend(
		{
			DyWorld_Entity_Roboport(v, i),
			DyWorld_Item(v, i),
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