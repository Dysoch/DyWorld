require "data/prefix"

local Data_Table_Looped = {
	{
		Name = "assembling-electric-",
		Icon = "__base__/graphics/icons/assembling-machine-3.png",
		Tech_Icon = "__base__/graphics/technology/automation.png",
		Recipe = true,
		Recipe_Craft_Time = 5,
		Recipe_Result_Count = 1,
		Recipe_First_Ingredient = {"assembling-machine-3", 1},
		Recipe_Ingredients = {{"advanced-circuit", 5}},
		Recipe_Without_Tech = false,
		Tech_Count = 300,
		Tech_Time = 60,
		Tech_PreReq = "automation-3",
		Tech_Ingredients = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1},{"production-science-pack", 1}},
		Stack = 50,
		Subgroup = "assembling-electric",
		Item_Place = "quickbar",
		Entity = true,
		Health = 800,
		Energy = 250,
		Speed = 2,
		Pollution = 5,
		Module = 6,
		
	},
}

for i=1,Tiered_Entities do
	for k,v in pairs(Data_Table_Looped) do
	data:extend(
		{
			DyWorld_Entity_Assembling_Electric(v, i),
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