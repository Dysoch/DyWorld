require "data/prefix"

local Data_Table = {
	{
		Name = "wheat-seed",
		Icon = dyworld_path_icon_temp,
		Item_Place = nil,
		Subgroup = "seeds",
		Stack = 200,
		Recipe = true,
		Recipe_Ingredients = {{dy.."wheat", 1}},
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 1,
		Recipe_Result_Count = 5,
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