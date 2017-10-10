require "data/prefix"

local Data_Table_Looped = {
	{
		Name = "solar-normal-",
		Icon = "__base__/graphics/icons/solar-panel.png",
		Tech_Icon = "__base__/graphics/technology/solar-energy.png",
		Recipe = true,
		Recipe_Craft_Time = 5,
		Recipe_Result_Count = 1,
		Recipe_First_Ingredient = {"solar-panel", 1},
		Recipe_Without_Tech = false,
		Tech_Count = 500,
		Tech_Time = 30,
		Tech_PreReq = "solar-energy",
		Tech_Ingredients = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1}},
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
		if v.Recipe_Without_Tech == false then
		data:extend(
		{
			DyWorld_Technology(v, i),
		})
		end
	end
end