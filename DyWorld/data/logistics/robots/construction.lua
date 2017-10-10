require "data/prefix"

local Data_Table_Looped = {
	{
		Name = "construction-robot-",
		Icon = "__base__/graphics/icons/construction-robot.png",
		Tech_Icon = "__base__/graphics/technology/construction-robotics.png",
		Recipe = true,
		Recipe_Craft_Time = 5,
		Recipe_Result_Count = 1,
		Recipe_First_Ingredient = {"construction-robot", 1},
		Recipe_Without_Tech = false,
		Tech_Count = 200,
		Tech_Time = 30,
		Tech_PreReq = "construction-robotics",
		Tech_Ingredients = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1}},
		Stack = 50,
		Subgroup = "robot-construction",
		Item_Place = "quickbar",
		Entity = true,
		Health = 200,
		Speed = 0.11,
		Max_Energy = 2,
		Tick_Energy = 0.04,
		Move_Energy = 10,
		
	},
}

for i=1,Tiered_Entities do
	for k,v in pairs(Data_Table_Looped) do
	data:extend(
		{
			DyWorld_Entity_Construction_Robot(v, i),
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