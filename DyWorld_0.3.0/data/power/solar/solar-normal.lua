require "data/prefix"

local Data_Table_Looped = {
	{
		Name = "solar-normal-",
		Icon = "__base__/graphics/icons/solar-panel.png",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"solar-panel", 1},{"advanced-circuit", 5}},
		Stack = 50,
		Subgroup = "solar",
		Item_Place = "quickbar",
		Entity = true,
		Health = 500,
		Energy = (60*2),
	},
}

data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"

for i=1,Tiered_Entities do
	for k,v in pairs(Data_Table_Looped) do
	data:extend(
		{
			DyWorld_Entity_Solar_Panels(v, i),
			DyWorld_Item(v, i),
			DyWorld_Recipe(v, i),
		})
		--for _,z in pairs(v.Recipe_Ingredients) do
			--table.insert(data.raw.recipe[dyworld_prefix..v.Name..tostring(i)].ingredients,z)
		--end
	end
end