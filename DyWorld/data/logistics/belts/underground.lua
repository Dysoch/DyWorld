require "data/prefix"

local Data_Table = {
	{
		Name = "copper-underground-belt",
		Icons = {{icon = "__base__/graphics/icons/underground-belt.png", tint = Material_Colors.Copper}},
		Recipe = true,
		Recipe_Craft_Time = 2,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{dy.."copper-transport-belt", 4},{dy.."binding-copper", 8}},
		Recipe_Without_Tech = false,
		Stack = 200,
		Subgroup = "transport-underground",
		Order = "3",
		Item_Place = "quickbar",
		Entity = true,
		Health = 50,
		Tint = Material_Colors.Copper,
		Item_Per_Sec = 10,
		Range = 4,
	},
	{
		Name = "stone-underground-belt",
		Icons = {{icon = "__base__/graphics/icons/underground-belt.png", tint = Material_Colors.Stone}},
		Recipe = true,
		Recipe_Craft_Time = 2,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{dy.."stone-transport-belt", 10},{dy.."stone-stick", 20}},
		Recipe_Without_Tech = true,
		Stack = 200,
		Subgroup = "transport-underground",
		Order = "2",
		Item_Place = "quickbar",
		Entity = true,
		Health = 100,
		Tint = Material_Colors.Stone,
		Item_Per_Sec = 7.5,
		Range = 10,
	},
	{
		Name = "wood-underground-belt",
		Icons = {{icon = "__base__/graphics/icons/underground-belt.png", tint = Material_Colors.Wood}},
		Recipe = true,
		Recipe_Craft_Time = 2,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{dy.."wood-transport-belt", 3},{dy.."wood-stick", 6}},
		Recipe_Without_Tech = true,
		Stack = 200,
		Subgroup = "transport-underground",
		Order = "1",
		Item_Place = "quickbar",
		Entity = true,
		Health = 5,
		Tint = Material_Colors.Wood,
		Item_Per_Sec = 4,
		Range = 3,
	},
}
	
for k,v in pairs(Data_Table) do
	data:extend(
		{
			DyWorld_Entity_Underground_Belt(v),
			DyWorld_Item(v),
			DyWorld_Recipe(v),
		})
end

DyWorld_Add_To_Tech("logistics", dy.."copper-underground-belt")