require "data/prefix"

local Data_Table = {
	{
		Name = "wheat",
		Icon = dyworld_path_icon_temp,
		Item_Place = nil,
		Subgroup = "food-raw",
		Stack = 200,
		Recipe = true,
		Recipe_Category = dy.."farming",
		Recipe_Ingredients = {{dy.."wheat-seed", 1}, {type = "fluid", name = "water", amount = 10}},
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 60,
		Recipe_Result_Count = 2,
	},
	{
		Name = "flour",
		Icon = dyworld_path_icon_temp,
		Item_Place = nil,
		Subgroup = "food-raw",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 30,
		Recipe_Result_Count = 1,
	},
	{
		Name = "carrot",
		Icon = dyworld_path_icon_temp,
		Item_Place = nil,
		Subgroup = "food-raw",
		Stack = 200,
		Recipe = true,
		Recipe_Category = dy.."farming",
		Recipe_Ingredients = {{dy.."carrot", 1}, {type = "fluid", name = "water", amount = 10}},
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 60,
		Recipe_Result_Count = 3,
	},
	{
		Name = "sugar",
		Icon = dyworld_path_icon_temp,
		Item_Place = nil,
		Subgroup = "food-raw",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 30,
		Recipe_Result_Count = 1,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Item(v),
	})
	if v.Recipe then
		data:extend(
		{
			DyWorld_Recipe(v),
		})
		--for _,z in pairs(v.Recipe_Ingredients) do
			--table.insert(data.raw.recipe[v.Name].ingredients,z)
		--end
	end
end