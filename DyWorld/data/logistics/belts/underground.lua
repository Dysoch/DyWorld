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
		Order = "copper",
		Item_Place = "quickbar",
		Entity = true,
		Tint = Material_Colors.Copper,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Copper"),
		Range = DyWorld_Material_Formulas(2, "Copper"),
		Health = DyWorld_Material_Formulas(3, "Copper"),
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
		Order = "stone",
		Item_Place = "quickbar",
		Entity = true,
		Tint = Material_Colors.Stone,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Stone"),
		Range = DyWorld_Material_Formulas(2, "Stone"),
		Health = DyWorld_Material_Formulas(3, "Stone"),
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
		Order = "wood",
		Item_Place = "quickbar",
		Entity = true,
		Tint = Material_Colors.Wood,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Wood"),
		Range = DyWorld_Material_Formulas(2, "Wood"),
		Health = DyWorld_Material_Formulas(3, "Wood"),
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
DyWorld_Add_To_Tech("logistics", dy.."lead-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."silver-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."gold-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."tin-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."chromium-underground-belt")