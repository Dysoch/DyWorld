require "data/prefix"

local Data_Table_Looped = {
	{
		Name = "accumulator-normal-",
		Icon = "__base__/graphics/icons/accumulator.png",
		Tech_Icon = "__base__/graphics/technology/electric-energy-acumulators.png",
		Recipe = true,
		Recipe_Craft_Time = 5,
		Recipe_Result_Count = 1,
		Recipe_First_Ingredient = {"accumulator", 1},
		Recipe_Ingredients = {{"advanced-circuit", 5}},
		Recipe_Without_Tech = false,
		Tech_Count = 500,
		Tech_Time = 30,
		Tech_PreReq = "electric-energy-accumulators-1",
		Tech_Ingredients = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1}},
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
		if v.Recipe_Without_Tech == false then
		data:extend(
		{
			DyWorld_Technology(v, i),
		})
		end
	end
end