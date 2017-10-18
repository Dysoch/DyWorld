require "data/prefix"

local Data_Table_Looped = {
	{
		Name = "electric-mining-drill-small-",
		Icon = "__base__/graphics/icons/electric-mining-drill.png",
		Tech_Icon = "__base__/graphics/technology/steel-processing.png",
		Recipe = true,
		Recipe_Craft_Time = 2.5,
		Recipe_Result_Count = 1,
		Recipe_First_Ingredient = {"electric-mining-drill", 1},
		Recipe_Without_Tech = false,
		Entity = true,
		Item_Place = "quickbar",
		Tech_Count = 100,
		Tech_Time = 15,
		Tech_PreReq = "steel-processing",
		Tech_Ingredients = {{"science-pack-1", 1},{"science-pack-2", 1}},
		Stack = 100,
		Subgroup = "drills-electric-1",	
		Energy = 100,
		Range = 2.49,
	},
	{
		Name = "electric-mining-drill-medium-",
		Icon = "__base__/graphics/icons/electric-mining-drill.png",
		Tech_Icon = "__base__/graphics/technology/steel-processing.png",
		Recipe = true,
		Recipe_Craft_Time = 5,
		Recipe_Result_Count = 1,
		Recipe_First_Ingredient = {"electric-mining-drill", 2},
		Recipe_Without_Tech = false,
		Entity = true,
		Item_Place = "quickbar",
		Tech_Count = 250,
		Tech_Time = 30,
		Tech_PreReq = dy.."electric-mining-drill-small-1",
		Tech_Ingredients = {{"science-pack-1", 1},{"science-pack-2", 1}},
		Stack = 100,
		Subgroup = "drills-electric-2",	
		Energy = 150,
		Range = 3.49,
	},
	{
		Name = "electric-mining-drill-large-",
		Icon = "__base__/graphics/icons/electric-mining-drill.png",
		Tech_Icon = "__base__/graphics/technology/steel-processing.png",
		Recipe = true,
		Recipe_Craft_Time = 10,
		Recipe_Result_Count = 1,
		Recipe_First_Ingredient = {"electric-mining-drill", 3},
		Recipe_Without_Tech = false,
		Entity = true,
		Item_Place = "quickbar",
		Tech_Count = 500,
		Tech_Time = 45,
		Tech_PreReq = dy.."electric-mining-drill-medium-1",
		Tech_Ingredients = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1}},
		Stack = 100,
		Subgroup = "drills-electric-3",	
		Energy = 225,
		Range = 4.49,
	},
	{
		Name = "electric-mining-drill-huge-",
		Icon = "__base__/graphics/icons/electric-mining-drill.png",
		Tech_Icon = "__base__/graphics/technology/steel-processing.png",
		Recipe = true,
		Recipe_Craft_Time = 30,
		Recipe_Result_Count = 1,
		Recipe_First_Ingredient = {"electric-mining-drill", 4},
		Recipe_Without_Tech = false,
		Entity = true,
		Item_Place = "quickbar",
		Tech_Count = 1000,
		Tech_Time = 60,
		Tech_PreReq = dy.."electric-mining-drill-large-1",
		Tech_Ingredients = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1}},
		Stack = 100,
		Subgroup = "drills-electric-4",	
		Energy = 350,
		Range = 5.49,
	},
}

for i=1,Tiered_Entities do
	for k,v in pairs(Data_Table_Looped) do
	data:extend(
		{
			DyWorld_Entity_Electric_Drill(v, i)
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