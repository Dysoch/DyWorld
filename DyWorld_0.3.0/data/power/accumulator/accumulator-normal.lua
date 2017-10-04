require "data/prefix"

local Data_Table_Looped = {
	{
		Name = "accumulator-normal-",
		Icon = "__base__/graphics/icons/accumulator.png",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"advanced-circuit", 5}},
		Stack = 50,
		Subgroup = "accumulator",
		Item_Place = "quickbar",
		Entity = true,
		Health = 500,
		Energy = (5*2),
	},
}

data.raw["accumulator"]["accumulator"].fast_replaceable_group = "accumulator"

for i=1,Tiered_Entities do
	for k,v in pairs(Data_Table_Looped) do
	data:extend(
		{
			DyWorld_Entity_Accumulators(v, i),
			DyWorld_Item(v, i),
			DyWorld_Recipe(v, i),
		})
		--for _,z in pairs(v.Recipe_Ingredients) do
			--table.insert(data.raw.recipe[dyworld_prefix..v.Name..tostring(i)].ingredients,z)
		--end
		if v.Recipe_Without_Tech == false then
		data:extend(
		{
			DyWorld_Technology(v, i),
		})
			if v.Tech_PreReq then
				for _,z in pairs(v.PreReq_Tech) do
					table.insert(data.raw.technology[v.Name].prerequisites,z)
				end
			end
			local result = {type = "unlock-recipe", recipe = dyworld_prefix..v.Name..tostring(i)}
			table.insert(data.raw.technology[dyworld_prefix..v.Name..tostring(i)].effects,result)
			for _,z in pairs(v.Tech_Ingredients) do
				table.insert(data.raw.technology[dyworld_prefix..v.Name..tostring(i)].unit.ingredients,z)
			end
		end
	end
end